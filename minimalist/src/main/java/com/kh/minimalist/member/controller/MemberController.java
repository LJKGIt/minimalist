package com.kh.minimalist.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.kh.minimalist.auction.model.service.AuctionService;
import com.kh.minimalist.auction.model.vo.Auction;
import com.kh.minimalist.commonUtil.CaptchaResponse;
import com.kh.minimalist.commonUtil.CookieUtils;
import com.kh.minimalist.commonUtil.RSA;
import com.kh.minimalist.commonUtil.RSAUtil;
import com.kh.minimalist.commonUtil.SHA256Util;
import com.kh.minimalist.income.model.service.IncomeService;
import com.kh.minimalist.income.model.vo.Income;
import com.kh.minimalist.member.model.service.MemberService;
import com.kh.minimalist.member.model.vo.Member;
import com.kh.minimalist.message.model.service.MessageService;
import com.kh.minimalist.orderinfo.model.service.OrderInfoService;
import com.kh.minimalist.orderinfo.model.vo.OrderInfo;
import com.kh.minimalist.product.model.service.ProductService;
import com.kh.minimalist.product.model.vo.Product;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.security.PrivateKey;

import com.google.gson.Gson;

@Controller
public class MemberController {

	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	private MemberService memberService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private ProductService productService;

	@Autowired
	private OrderInfoService orderInfoService;

	@Autowired
	private AuctionService auctionService;

	RSAUtil rsaUtil = new RSAUtil();

	@RequestMapping(value = "login.do")
	public String loginCheck(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model) throws UnsupportedEncodingException {
		String result = "redirect:index.do";
		model.addAttribute("loginError", null);

		// <RSA
		// 개인키 취득
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key == null) {
			model.addAttribute("loginError", "비정상 적인 접근 입니다.");
			return result;
		}

		// session에 저장된 개인키 초기화
		session.removeAttribute("RSAprivateKey");
		// 아이디/비밀번호 복호화
		try {
			String id = rsaUtil.getDecryptText(key, m.getMember_id());
			String password = rsaUtil.getDecryptText(key, m.getMember_pwd());
			// 복호화된 평문을 재설정
			m.setMember_id(id);
			m.setMember_pwd(password);
		} catch (Exception e) {
			model.addAttribute("loginError", "비정상 적인 접근 입니다.");
			return result;
		}
		// RSA>

		// SQL injection에 대비해 정규표현식을 적용합니다.
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

				// 로그인할 때 비로그인용 쿠키가 존재하면 COOKIE LIST 추가
				CookieUtils cu = new CookieUtils();
				if (cu.isExist("anonymous", request)) {
					for (String cookie : cu.getValueList("anonymous", request))
						cu.setCookie(member.getMember_id(), cookie, 365, request, response);
				}

				if (request.getHeader("referer") != null && !request.getHeader("referer").contains("logout.do")) {
					session.setAttribute("newMessageCount", messageService.selectMessageCount(member.getMember_id()));
					result = "redirect:" + request.getHeader("referer");
				}
			} else if (member != null && member.getDormant_yn() == 'y') {
				model.addAttribute("loginError", "탈퇴한 회원입니다.");
			} else if (member == null) {
				model.addAttribute("loginError", "아이디나 패스워드가 틀렸습니다.");
			}
		} catch (NullPointerException e) {
		}
		return result;
	}

	// 로그인 페이지 진입
	@RequestMapping(value = "loginTry.do", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> loginForm(HttpSession session, Model model) {
		// RSA 키 생성
		PrivateKey key = (PrivateKey) session.getAttribute("RSAprivateKey");
		if (key != null) { // 기존 key 파기
			session.removeAttribute("RSAprivateKey");
		}
		RSA rsa = rsaUtil.createRSA();
		session.setAttribute("RSAprivateKey", rsa.getPrivateKey());

		// model.addAttribute("modulus", rsa.getModulus());
		// model.addAttribute("exponent", rsa.getExponent());
		HashMap<String, Object> rsaData = new HashMap<String, Object>();
		rsaData.put("modulus", rsa.getModulus());
		rsaData.put("exponent", rsa.getExponent());
		return rsaData;
	}

	@RequestMapping("logout.do")
	public String logoutMember(HttpSession session) {
		logger.info("logoutMember() call...");

		if (session.getAttribute("member") != null) {
			session.invalidate();
		}

		return "redirect:index.do";
	}

	@RequestMapping("memberidchk.do")
	public View memberIdChk(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/plain; utf-8");

		String member_id = request.getParameter("member_id");

		int result = memberService.memberIdChk(member_id);

		// 업데이트 완료 여부 콜백
		if (result > 0) {
			model.addAttribute("mchk", "이미 사용 중 입니다.");
			model.addAttribute("flag", 1);
		} else {
			model.addAttribute("mchk", "사용가능한 아이디 입니다.");
			model.addAttribute("flag", 0);
		}

		return new MappingJackson2JsonView();

	}

	@RequestMapping(value = "minsert.do", method = RequestMethod.POST)
	public String insertNoticeForm(Member m, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		// <recaptcha
		String secretParameter = "6LfPMzQUAAAAANF_tilr6MpN3zfcQ5jwpVq4shpV";
		String recap = request.getParameter("g-recaptcha-response");
		// Send get request to Google reCaptcha server with secret key  
		URL url;
		String line, outputString = "";
		try {
			url = new URL("https://www.google.com/recaptcha/api/siteverify?secret=" + secretParameter + "&response=" + recap + "&remoteip=" + request.getRemoteAddr());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			while ((line = reader.readLine()) != null) {
				outputString += line;
			}
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		// Convert response into Object
		CaptchaResponse capRes = new Gson().fromJson(outputString, CaptchaResponse.class);

		// Verify whether the input from Human or Robot 
		if (capRes.isSuccess()) {
			// Input by Human
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
		} else {
			// Input by Robot
			return "member/register";
		}
	}

	@RequestMapping("member.dormant.do")
	public String memberDelete(Member m, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException {
		if ((Member) session.getAttribute("member") != null) {
			if (memberService.dormantMember(m) > 0) {
				response.getWriter().append("<script>alert('탈퇴가 완료되었습니다.')</script>");
			} else {
				response.getWriter().append("<script>alert('탈퇴중 오류가 발생했습니다.')</script>");
			}
		}
		return "redirect:index.do";
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
		response.setContentType("text/html; charset=utf-8");

		String result = "main/404";

		int orderDay = 7; // 조회기간
		String orderKeyword = ""; // 검색어

		HashMap<String, Object> map = new HashMap<String, Object>(); //

		if (((Member) session.getAttribute("member")) != null) {
			String member_id = ((Member) session.getAttribute("member")).getMember_id();

			// MEMBER_ID 값
			map.put("member_id", member_id);

			// ORDER KEYWORD 값
			if (request.getParameter("orderKeyword") != null) {
				orderKeyword = request.getParameter("orderKeyword");
				map.put("orderKeyword", orderKeyword);
				orderDay = -1;
			}

			// ORDERDAY 값(조회기간)
			if (request.getParameter("orderDay") != null)
				orderDay = Integer.parseInt(request.getParameter("orderDay"));
			map.put("orderDay", orderDay);

			// PAGING
			int currentPage = 1; // 현재 페이지
			if (request.getParameter("page") != null) {
				currentPage = Integer.parseInt(request.getParameter("page"));
			}
			HashMap<String, Object> totalCountMap = new HashMap<String, Object>();
			totalCountMap.put("member_id", member_id);
			totalCountMap.put("orderDay", orderDay);
			totalCountMap.put("orderKeyword", orderKeyword);
			int totalListCount = orderInfoService.myOrderCount(totalCountMap); // 총 개수
			int listPerPage = 5; // 한 화면에 출력될 페이지 수
			int pageList = 5; // PAGINATION 개수

			int totalPage = totalListCount / listPerPage; // 마지막 페이지
			if (totalListCount % listPerPage > 0)
				totalPage++;

			if (currentPage > totalPage) // 현재 페이지가 마지막 페이지보다 클 경우
				currentPage = totalPage;

			int startPage = ((currentPage - 1) / pageList) * pageList + 1; // 노출되는 시작 페이지
			int endPage = startPage + pageList - 1; // 노출되는 마지막 페이지
			if (endPage > totalPage)
				endPage = totalPage;

			int startRow = (currentPage - 1) * listPerPage + 1; // 현재 페이지 리스트의 첫 번째 행
			int endRow = startRow + listPerPage - 1; // 현재 페이지 리스트의 마지막 행

			// 현재 페이지 리스트의 시작, 마지막 값
			map.put("startRow", startRow);
			map.put("endRow", endRow);

			ArrayList<OrderInfo> myOrder = orderInfoService.myOrder(map);
			if (myOrder != null) {
				model.addAttribute("myOrder", myOrder);
				model.addAttribute("currentPage", currentPage);
				model.addAttribute("startPage", startPage);
				model.addAttribute("endPage", endPage);
				model.addAttribute("totalPage", totalPage);
				model.addAttribute("orderDay", orderDay);
				model.addAttribute("orderDay", orderDay);
				model.addAttribute("orderKeyword", orderKeyword);
			}
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
		if (sessionMember != null && m.getMember_pwd() != null) {
			if (SHA256Util.getEncrypt(m.getMember_pwd(), memberService.searchMember(sessionMember.getMember_id()).getSalt()).equals(sessionMember.getMember_pwd())) {
				m.setMember_pwd(sessionMember.getMember_pwd());
				model.addAttribute("updateMember", memberService.loginMember(m));
				model.addAttribute("telList", new String[] { "010", "011", "016", "017", "018", "019" });
				result = "mypage/customer-account";
			} else {
				model.addAttribute("error", "비밀번호가 틀렸습니다.");
			}
		} else if(sessionMember != null && m.getMember_pwd() == null){
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비정상적 접근입니다.'); location.href = \"http://localhost/minimalist/index.do\";</script>");
			out.flush();
			out.close();
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

			String email = request.getParameter("email1") + "@" + request.getParameter("email2");
			String phone = request.getParameter("tel_first") + "-" + request.getParameter("phone1") + "-" + request.getParameter("phone2");
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

	@Autowired
	IncomeService incomeService;

	@RequestMapping(value = "auction.selectMemberAuction.do", method = { RequestMethod.POST, RequestMethod.GET })
	public String selectMemberAuction(HttpSession session, Model model, HttpServletResponse response) throws IOException {
		if (((Member) session.getAttribute("member")) != null) {
			ArrayList<Auction> auctionList = auctionService.selectMemberAuction(((Member) session.getAttribute("member")).getMember_id());
			ArrayList<Income> incomeList = incomeService.selectMemberIncome(((Member) session.getAttribute("member")).getMember_id());
			model.addAttribute("auctionList", auctionList);
			model.addAttribute("incomeList", incomeList);
		} else {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비정상적 접근입니다.'); location.href = \"http://localhost/minimalist/index.do\";</script>");
			out.flush();
		}
		return "mypage/customer-auction";
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

	//회원 관리 페이지 - 멤버 리스트 보여주기
	@RequestMapping(value = "member.memberManage.do")
	public String memberManage(HttpServletRequest request, Model model) {

		int currentPage = 1;
		//현재 페이지

		if (request.getParameter("page") != null) {
			//현재 페이지 보정
			currentPage = Integer.parseInt(request.getParameter("page"));
		}

		int countRow = 0;
		//전체 글의 갯수
		countRow = memberService.memberCount();

		int countList = 10;
		//페이지당 보여줄 글의 수 
		int pageList = 5;
		//아래 보여줄 페이지의 수

		int maxPage = countRow / countList;
		//총 페이지 수
		if (countRow % countList > 0) {
			maxPage++;
			//맥스 페이지 보정
		}

		int startPage = ((currentPage - 1) / pageList) * pageList + 1;
		//화면에 보여줄 시작페이지
		int endPage = startPage + pageList - 1;

		if (endPage > maxPage) {
			//마지막 페이지 보정
			endPage = maxPage;
		}

		int startRow = (currentPage - 1) * countList + 1;
		//현재 화면에서 보여줄 글의 시작 rownum
		int endRow = startRow + countList - 1;
		//현재 화면에서 보여줄 글의 마지막 rownum

		HashMap<String, Integer> map = new HashMap<String, Integer>();

		map.put("startRow", startRow);
		map.put("endRow", endRow);

		ArrayList<Member> list = memberService.memberList(map);

		String tmp = null;

		if (list.size() != 0) {
			model.addAttribute("list", list);
			model.addAttribute("currentPage", currentPage);
			model.addAttribute("startPage", startPage);
			model.addAttribute("endPage", endPage);
			model.addAttribute("maxPage", maxPage);
			tmp = "manager/memberList";
		} else {
			tmp = "main/404";
		}

		return tmp;
	}

	@RequestMapping(value = "member.searchingMember.do")
	public String searchingMember(HttpServletRequest request, Model model) {

		String keyword = request.getParameter("keyword");

		ArrayList<Member> list = memberService.searchingMember(keyword);

		model.addAttribute("list", list);

		return "manager/memberList";
	}

	//member.selectOne.do
	@RequestMapping(value = "member.selectOne.do")
	public String selectOneMember(HttpServletRequest request, Model model) {

		String member_id = request.getParameter("member_id");

		Member m = memberService.memberOne(member_id);

		String yn = null;
		if (m.getDormant_yn() == 'y') {
			yn = "y";
		} else {
			yn = "n";
		}

		model.addAttribute("yn", yn);
		model.addAttribute("member", m);

		return "manager/memberDetail";

	}

	//회원 계정 정지 - 계정 풀기
	@RequestMapping(value = "member.updateDormant.do", method = RequestMethod.GET)
	public void updateDormant(HttpServletRequest request, HttpServletResponse response) throws IOException {

		String tmp = request.getParameter("yn");
		Member m = new Member();

		m.setMember_id(request.getParameter("id"));
		m.setDormant_yn(tmp.charAt(0));

		int result = memberService.updateDormant(m);

		PrintWriter writer = response.getWriter();
		if (result > 0) {
			writer.append("yes");
		} else {
			writer.append("no");
		}

		writer.flush();
		writer.close();
	}

	//회원 등급 조정
	@RequestMapping(value = "member.updateGrade.do", method = RequestMethod.GET)
	public void updateGrade(HttpServletRequest request, HttpServletResponse response) throws IOException {

		Member m = new Member();

		m.setGrade(Integer.parseInt(request.getParameter("grade")));
		m.setMember_id(request.getParameter("id"));

		int result = memberService.updateGrade(m);

		PrintWriter writer = response.getWriter();
		if (result > 0) {
			writer.append("yes");
		} else {
			writer.append("no");
		}

		writer.flush();
		writer.close();
	}
}
