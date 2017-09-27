package com.kh.minimalist.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.commonUtil.CookieUtils;
import com.kh.minimalist.commonUtil.SHA256Util;
import com.kh.minimalist.member.model.service.MemberService;
import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.message.model.service.MessageService;
import com.kh.minimalist.orderinfo.model.service.OrderInfoService;
import com.kh.minimalist.orderinfo.model.vo.OrderInfo;
import com.kh.minimalist.product.model.service.ProductService;
import com.kh.minimalist.product.model.vo.Product;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderInfoService orderInfoService;

	@Autowired
	private MessageService messageService;

	@RequestMapping(value = "login.do")
	public String loginCheck(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response){
		String result = "main/index";

		// SQL injection에 대비해 정규식 표현을 적용합니다.
		Pattern p = Pattern.compile("^[A-Za-z0-9_]{4,16}$");
		Member member = null;
		// TODO [lintogi] □ if로 null이 아닌 것을 확인했음에도 NullPointerException를 던지고 그 순서가 절차지향을 무시한다.
		boolean patternBoolean = false;
		try {
			// if(p == null)
			// 	System.out.println("망p");
			// if(p.matcher(m.getMember_id()) == null)
			// 	System.out.println("망m");
			if (p != null && p.matcher(m.getMember_id()) != null)
				patternBoolean = p.matcher(m.getMember_id()).find();
		} catch (NullPointerException e) {
			// System.out.println("망n");
		}
		if (patternBoolean && m.getMember_id() != "" && m.getMember_pwd() != "" && memberService.searchMember(m.getMember_id()) != null) {
			m.setMember_pwd(SHA256Util.getEncrypt(m.getMember_pwd(), memberService.searchMember(m.getMember_id()).getSalt()));
			member = memberService.loginMember(m);
		}

		if (member != null) {
			session.setAttribute("member", member);
			if (request.getHeader("referer") != null && !request.getHeader("referer").contains("logout.do")) {
				result = "redirect:" + request.getHeader("referer");

			}
			session.setAttribute("messageList", messageService.selectMessageList(member.getMember_id()));
		}
		return result;
	}

	@RequestMapping("logout.do")
	public String logoutMember(HttpSession session) {
		logger.info("logoutMember() call...");

		if (session.getAttribute("member") != null) {
			session.invalidate();
		}

		return "main/index";
	}

	@RequestMapping("memberidchk.do")
	public void memberIdChk(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");

		String member_id = request.getParameter("member_id");

		System.out.println(member_id);

		int result = memberService.memberIdChk(member_id);

		PrintWriter clientOut = response.getWriter();

		// 업데이트 완료 여부 콜백
		if (result > 0) {
			clientOut.append("0");
			clientOut.flush();
		} else {
			clientOut.append("1");
			clientOut.flush();
		}
		clientOut.close();

	}

	@RequestMapping(value = "minsert.do", method = RequestMethod.POST)
	public String insertNoticeForm(Member m, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");
		String salt = SHA256Util.generateSalt();
		m.setMember_pwd(SHA256Util.getEncrypt(m.getMember_pwd(), salt));
		m.setSalt(salt);
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String phone = request.getParameter("tel_first") + "-" + request.getParameter("phone1") + "-" + request.getParameter("phone2");

		m.setPhone(phone);

		m.setEmail(email);
		int result = memberService.minsert(m);

		if (result > 0) {

			return "redirect:index.do";
		} else {

			return "main/404";
		}

	}

	@RequestMapping("register.do")
	public String register() {

		return "member/register";
	}

	@RequestMapping("memberList.do")
	public String memberList(Model model) {

		ArrayList<Member> list = new ArrayList<Member>();

		list = memberService.mList();
		model.addAttribute("list", list);

		return "manager/mSearchPopup";
	}

	@RequestMapping("member.mypage.do")
	public String myPageView(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {
		String result = "main/404";
		response.setContentType("text/html; charset=utf-8");

		if (((Member) session.getAttribute("member")) != null) {
			String member_id = ((Member) session.getAttribute("member")).getMember_id();

			// MY ORDER LIST
			ArrayList<OrderInfo> myOrder = orderInfoService.myOrder(member_id);
			if (myOrder != null)
				model.addAttribute("myOrder", myOrder);

			// RECENT VIEW (COOKIE)
			try {
				List<String> list = new CookieUtils().getValueList(member_id, request);
				ArrayList<Product> cookieList = new ArrayList<Product>();

				if (list != null) {
					for (String product_code : list)
						cookieList.add(productService.productDetail(new Product(Integer.parseInt(product_code))));
				}
				model.addAttribute("cookieList", cookieList);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			result = "mypage/customer-orders";
		} else {

			PrintWriter out = response.getWriter();
			out.println("<script>alert('권한이 없습니다.'); history.go(-1);</script>"); //관리자 등급별로 메뉴 제어
			out.flush();

		}

		return result;
	}

	//	-> PASSWORD CHECK
	@RequestMapping("member.passwordCheck.do")
	public String myPasswordCheck() {
		return "mypage/passwordCheck";
	}

	//	PASSWORD CHECK -> MEMBER UPDATE VIEW
	@RequestMapping("member.information.do")
	public String myInfomaion(Member m, HttpSession session, Model model) {
		String result = "mypage/passwordCheck";
		if (SHA256Util.getEncrypt(m.getMember_pwd(), memberService.searchMember(((Member) session.getAttribute("member")).getMember_id()).getSalt()).equals(((Member) session.getAttribute("member")).getMember_pwd())) {
			m.setMember_pwd(((Member) session.getAttribute("member")).getMember_pwd());
			result = "mypage/customer-account";
			Member member = memberService.loginMember(m);
			System.out.println(member);
			model.addAttribute("member", member);
		}
		return result;
	}

	//	MEMBER UPDATE VIEW -> MEMBER UPDATE
	// TODO [yjP] 멤버 업데이트 하다가 말았음
	@RequestMapping("member.memberUpdate.do")
	public String memberUpdate(Member m, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws UnsupportedEncodingException {
		String resultPage = "main/404";
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		System.out.println("update : " + m);
		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String phone = request.getParameter("tel_first") + "-" + request.getParameter("phone1") + "-" + request.getParameter("phone2");
		m.setMember_id(((Member) session.getAttribute("member")).getMember_id());
		m.setPhone(phone);
		m.setEmail(email);
		int result = memberService.mupdate(m);

		if (result > 0) {
			resultPage = "redirect:passwordCheck.do";
		} else {

		}
		return resultPage;
	}

	//	PASSWORD CHANGE POPUP(VIEW)
	@RequestMapping("member.passwordView.do")
	public String passwordView(Model model, HttpSession session) {
		model.addAttribute("member", memberService.searchMember(((Member) session.getAttribute("member")).getMember_id()));
		return "mypage/passwordChange";
	}
	
//	TODO [yjP] PASSWORD UPDATE
	@RequestMapping("member.passwordUpdate.do")
	public void passwordUpdate(Member m, HttpSession session, HttpServletResponse response) throws IOException{
		response.setContentType("text/html; charset=utf-8");
		
		String memberSalt = ((Member) session.getAttribute("member")).getSalt();
		String newPassword = SHA256Util.getEncrypt(m.getMember_pwd(), memberSalt);
		String member_id = ((Member) session.getAttribute("member")).getMember_id();
		m.setMember_id(member_id);
		m.setMember_pwd(newPassword);
		int result = memberService.passwordUpdate(m);
		
		if(result > 0){
			PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호 변경 완료'); window.close();</script>");
            out.flush();
		}else{
			PrintWriter out = response.getWriter();
            out.println("<script>alert('비밀번호 변경 실패'); location.reload();</script>");
            out.flush();
		}
	}
	
	// 회원 검색 페이지로 이동.
	@RequestMapping("member.memberSearchView.do")
	public String searchMemberView() {

		return "manager/sendMessage";
	}

	// 회원 검색
	@RequestMapping(value = "member.memberSearch.do", method = { RequestMethod.POST, RequestMethod.GET })
	public void searchMemer(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException {

		String member_id = request.getParameter("member_id");

		Member member = memberService.searchMember(member_id);

		PrintWriter writer = response.getWriter();
		if (member != null) {
			String id = member.getMember_id();
			model.addAttribute("member", member);
			writer.append(id);

		} else {
			writer.append("no");

		}
		writer.close();

	}

}
