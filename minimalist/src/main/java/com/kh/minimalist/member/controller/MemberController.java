package com.kh.minimalist.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.List;

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

import com.kh.minimalist.cookie.CookieUtils;
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

	@RequestMapping(value = "login.do", method = RequestMethod.POST)
	public String loginCheck(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		String result = "main/index";
		Member member = memberService.loginMember(m);
		if (member != null) {
			session.setAttribute("member", member);
			if (request.getHeader("referer") != null && !request.getHeader("referer").contains("logout.do")) {
				result = "redirect:"+request.getHeader("referer");
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
	public void memberIdChk(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws IOException {
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
	public String insertNoticeForm(Member m, HttpServletRequest request, HttpServletResponse response)
			throws UnsupportedEncodingException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");

		String email = request.getParameter("email1") + "@" + request.getParameter("email2");
		String phone = request.getParameter("tel_first") + "-" + request.getParameter("phone1") + "-"
				+ request.getParameter("phone2");

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
	public String myPageView(HttpSession session, HttpServletRequest request, Model model) {
		String result = "main/404";
		String member_id = ((Member) session.getAttribute("member")).getMember_id();

		// MY ORDER LIST
		ArrayList<OrderInfo> myOrder = orderInfoService.myOrder(member_id);
		if (myOrder != null)
			model.addAttribute("myOrder", myOrder);

		// RECENT VIEW (COOKIE)
		if (((Member) session.getAttribute("member")) != null) {
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
		}

		return result;
	}

	@RequestMapping("passwordCheck.do")
	public String myPasswordCheck() {
		return "mypage/passwordCheck";
	}

	@RequestMapping("information.do")
	public String myInfomaion(Member m, HttpSession session) {
		String result = "mypage/passwordCheck";
		if (m.getMember_pwd().equals(((Member) session.getAttribute("member")).getMember_pwd())) {
			result = "mypage/customer-account";
		}
		return result;
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
