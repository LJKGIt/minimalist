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
	public String loginCheck(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) {
		String result = "main/index";
		model.addAttribute("loginError", null);
		// SQL injection에 대비해 정규식 표현을 적용합니다.
		Pattern p = Pattern.compile("^[A-Za-z0-9_]{4,16}$");
		Member member = null;
		boolean patternBoolean = false;
		try {
			if (p != null && p.matcher(m.getMember_id()) != null)
				patternBoolean = p.matcher(m.getMember_id()).find();

			if (patternBoolean && m.getMember_id() != "" && m.getMember_pwd() != "" && memberService.searchMember(m.getMember_id()) != null) {
				m.setMember_pwd(SHA256Util.getEncrypt(m.getMember_pwd(), memberService.searchMember(m.getMember_id()).getSalt()));
				member = memberService.loginMember(m);
			}

			if (member != null && member.getDormant_yn() == 'n') {
				session.setAttribute("member", member);
				if (request.getHeader("referer") != null && !request.getHeader("referer").contains("logout.do")) {
					result = "redirect:" + request.getHeader("referer");

				}
				session.setAttribute("newMessageCount", messageService.selectMessageCount(member.getMember_id()));
			} else if (member.getDormant_yn() == 'y') {
				model.addAttribute("loginError", "탈퇴한 회원입니다.");
			} else {
				model.addAttribute("loginError", "아이디나 패스워드가 틀렸습니다.");
			}
		} catch (NullPointerException e) {
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

	@RequestMapping("member.delete.do")
	public String memberDelete(Member m, HttpSession session, HttpServletRequest request) {
		if ((Member) session.getAttribute("member") != null) {
			if (memberService.memberDelete(m) > 0) {
				System.out.println("탈퇴 완료");
			} else {
				System.out.println("회원탈퇴 실패");
			}
		}
		return "main/index";
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
			out.println("<script>alert('비정상적 접근입니다.'); location.href = \"http://localhost/minimalist/index.do\";</script>");
			out.flush();

		}

		return result;
	}

	// -> PASSWORD CHECK
	@RequestMapping("member.passwordCheck.do")
	public String myPasswordCheck(HttpSession session) {
		String result = "main/404";
		if (((Member) session.getAttribute("member")) != null) {
			result = "mypage/passwordCheck";
		}
		return result;
	}

	// PASSWORD CHECK -> MEMBER UPDATE VIEW
	@RequestMapping("member.information.do")
	public String myInfomaion(Member m, HttpSession session, Model model, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		String result = "mypage/passwordCheck";
		Member sessionMember = (Member) session.getAttribute("member");
		if (sessionMember != null) {
			if (SHA256Util.getEncrypt(m.getMember_pwd(), memberService.searchMember(sessionMember.getMember_id()).getSalt()).equals(sessionMember.getMember_pwd())) {
				m.setMember_pwd(sessionMember.getMember_pwd());
				model.addAttribute("updateMember", memberService.loginMember(m));
				result = "mypage/customer-account";
			} else {
				model.addAttribute("error", "비밀번호가 틀렸습니다.");
			}
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비정상적 접근입니다.'); location.href = \"http://localhost/minimalist/index.do\";</script>");
			out.flush();
			out.close();
		}
		return result;
	}

	// MEMBER UPDATE VIEW -> MEMBER UPDATE
	@RequestMapping("member.memberUpdate.do")
	public void memberUpdate(Member m, Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if ((Member) session.getAttribute("member") != null) {

			System.out.println("member.memberUpdate.do : " + m);
			// TODO [yjP] member_id=null 뜨는 이유??
			String email = request.getParameter("email1") + "@" + request.getParameter("email2");
			String phone = request.getParameter("tel_first") + "-" + request.getParameter("phone1") + "-" + request.getParameter("phone2");
			m.setMember_id(((Member) session.getAttribute("member")).getMember_id());
			m.setPhone(phone);
			m.setEmail(email);

			if (memberService.mupdate(m) > 0) {
				out.println("<script>alert('회원정보가 수정되었습니다.'); location.href = \"http://localhost/minimalist/member.passwordCheck.do\";</script>");
			} else {
				out.println("<script>alert('회원정보가 수정 실패!!'); location.href = 'redirect:member.passwordCheck.do'</script>");
			}

		} else {
			out.println("<script>alert('비정상적 접근입니다.'); location.href = \"http://localhost/minimalist/index.do\";</script>");
		}
		out.flush();
		out.close();
	}

	// PASSWORD CHANGE POPUP(VIEW)
	@RequestMapping("member.passwordView.do")
	public String passwordView(Model model, HttpSession session) {
		String result = "main/404";
		if (((Member) session.getAttribute("member")) != null) {
			result = "mypage/passwordChange";
		}
		return result;
	}

	@RequestMapping("member.passwordUpdate.do")
	public void passwordUpdate(Member m, HttpSession session, HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		if (((Member) session.getAttribute("member")) != null) {
			String memberSalt = ((Member) session.getAttribute("member")).getSalt();
			String newPassword = SHA256Util.getEncrypt(m.getMember_pwd(), memberSalt);
			String member_id = ((Member) session.getAttribute("member")).getMember_id();
			m.setMember_id(member_id);
			m.setMember_pwd(newPassword);
			int result = memberService.passwordUpdate(m);

			if (result > 0) {

				out.println("<script>alert('비밀번호 변경 완료'); window.close();</script>");
				out.flush();
			} else {
				out.println("<script>alert('비밀번호 변경 실패'); location.reload();</script>");
				out.flush();
			}
		} else {
			out.println("<script>alert('비정상적 접근입니다.'); location.href = \"http://localhost/minimalist/index.do\";</script>");
			out.flush();
		}
		out.close();
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
