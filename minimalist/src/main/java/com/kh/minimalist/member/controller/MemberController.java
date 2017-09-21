package com.kh.minimalist.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

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

import com.kh.minimalist.member.model.service.MemberService;
import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.message.model.service.MessageService;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MessageService messageService;
	
	
	
	//관리자 페이지 이동용 메서드
	@RequestMapping(value = "manage.do", method ={RequestMethod.POST, RequestMethod.GET})
	public String management(){
		
		return "manager/manageHome";
	}

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
		
	@RequestMapping("minsert.do")
	public String insertNoticeForm(Member m, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");
		
		String email = request.getParameter("email1") + "@" + request.getParameter("email2") ;
		m.setEmail(email);
		int result = memberService.minsert(m);
		
		if (result > 0) {
			return "main/index";			
		}
		else {
			return "main/404";
		}
		
	}
	
	@RequestMapping("register.do")
	public String register(){
		
		return "member/register";
	}
	
//	@RequestMapping("emailAuth.do")
//	public ModelAndView emailAuth(HttpServletResponse response, HttpServletRequest request) throws Exception {
//		String email = request.getParameter("email");
//		String authNum = "";
//		
//		authNum = RandomNum();
//		
//		sendEmail(email.toString(), authNum);
//		
//		ModelAndView mv = new ModelAndView();
//		mv.setViewName("member/register");
//		mv.addObject("email", email);
//		mv.addObject("authNum", authNum);
//		
//		return mv;
//	}
//	
//	private void sendEmail(String email, String authNum) {
//		String host = "stmp.gmail.com";
//		String subject = "NEGABOX 인증번호 전달";
//		String fromName = "네가박스 관리자";
//		String from = "ruew12@gmail.com";
//		String to1 = email;
//		
//		String content = "인증번호 [ " + authNum + " ]";
//		
//		try {
//			Properties prop = new Properties();
//			prop.put("mail.smtp.starttls.enable", "true");
//			prop.put("mail.transport.protocol", "smtp");
//			prop.put("mail.smtp.host", host);
//			prop.setProperty("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
//			prop.put("mail.smtp.port", "465");
//			prop.put("mail.smtp.user", from);
//			prop.put("mail.smtp.auth", "true");
//			
//			Session mailSession = Session.getInstance(prop, new javax.mail.Authenticator() {
//				protected PasswordAuthentication getPasswordAuthentication() {
//					return new PasswordAuthentication()
//				}
//			})
//		} catch (Exception e) {
//			
//		}
//	}
	
	@RequestMapping("mypage.do")
	public String myPageView() {
		return "mypage/customer-orders";
	}
	
	@RequestMapping("wishlist.do")
	public String myWishList() {
		return "mypage/customer-wishlist";
	}
	
	@RequestMapping("infomation.do")
	public String myInfomation() {
		return "mypage/customer-account";
	}
	
	
	//회원 검색 페이지로 이동.
	@RequestMapping("member.memberSearchView.do")
	public String searchMemberView(){
		
		return "manager/sendMessage";
	}
	
	
	//회원 검색
	@RequestMapping(value="member.memberSearch.do", method={RequestMethod.POST, RequestMethod.GET})
	public void searchMemer(HttpServletRequest request, HttpServletResponse response, Model model) throws IOException{
		
		String member_id=request.getParameter("member_id");
		System.out.println(member_id);
		
		Member member=memberService.searchMember(member_id);
		
		
		PrintWriter writer=response.getWriter();
		if(member!=null){
			String id=member.getMember_id();
			model.addAttribute("member", member);
			writer.append(id);
			writer.flush();
		}else {
			writer.append("no");
			writer.flush();
		}
		writer.close();
		
	}
}
