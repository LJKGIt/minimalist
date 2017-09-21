package com.kh.minimalist.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.minimalist.notice.model.service.NoticeServiceImpl;
import com.kh.minimalist.notice.model.vo.Notice;

@Controller
public class NoticeController {

	@Autowired
	private NoticeServiceImpl noticeService;
	
	
	//공지사항 등록 페이지 이동
	@RequestMapping(value="notice.viewWriteForm.do")
	public String viewWriteNotice(){
		
		return "manager/writeNotice";
	}
	
	@RequestMapping(value="notice.writeNotice.do", method={RequestMethod.GET, RequestMethod.POST})
	public String writeNotice(HttpServletRequest request){
		
		Notice notice=new Notice();
		
		notice.setNotice_title(request.getParameter("title"));
		notice.setNotice_content(request.getParameter("content"));
		
		
		int result=noticeService.writeNotice(notice);
		
		String tmp="";
		if(result>0){
			tmp="redirect:notice.selectList.do";
		}else {
			tmp="main/404";
		}
		
		
		return tmp;
	}
	
	
	
	@RequestMapping(value="notice.selectList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectList(HttpServletRequest request, Model model){
		
		int currentPage=1;
		//현재 페이지
		
		if(request.getParameter("page")!=null){
			//현재 페이지 보정
		
				currentPage=Integer.parseInt(request.getParameter("page"));
	
		}
		int countRow=noticeService.countRow();
		//전체 글의 갯수
		int countList=10;
		//페이지당 보여줄 글의 수 
		int pageList=5;
		//아래 보여줄 페이지의 수
		
		int maxPage=countRow/countList;
		//총 페이지 수
		if(countRow%countList>0){
			maxPage++;
			//맥스 페이지 보정
		}
		
		
		
		int startPage=((currentPage-1)/pageList)*pageList+1;
		//화면에 보여줄 시작페이지
		int endPage=startPage+pageList-1;
		
		if(endPage>maxPage){
			//마지막 페이지 보정
			endPage=maxPage;
		}
		
		int startRow=(currentPage-1)*countList+1;
		//현재 화면에서 보여줄 글의 시작 rownum
		int endRow=startRow+countList-1;
		//현재 화면에서 보여줄 글의 마지막 rownum
		
		HashMap<String, Object> map=new HashMap<String, Object>();
		
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		
		ArrayList<Notice> list=noticeService.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		
		return "notice/noticeList";
	}
	
	
	@RequestMapping(value="notice.selectOne.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectOne(HttpServletRequest request, Model model){
		
		int notice_no=Integer.parseInt(request.getParameter("notice_no"));
		
		Notice notice=noticeService.selectOne(notice_no);
		
		model.addAttribute("notice", notice);
		
		return "notice/noticeDetail";
	}
	
	
	
	@RequestMapping(value="notice.viewUpdateForm.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String viewUpdateForm(HttpServletRequest request, Model model){
		
		
		int notice_no=Integer.parseInt(request.getParameter("notice_no"));
		
		
		Notice notice=noticeService.selectOne(notice_no);
		
		model.addAttribute("notice", notice);
		
		
		return "notice/noticeUpdate";
	}
	
	//
	@RequestMapping(value="notice.updateNotice.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String updateNotie(HttpServletRequest request,  Model model){
		
		int notice_no=Integer.parseInt(request.getParameter("notice_no"));
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		
		Notice notice=new Notice();
		notice.setNotice_no(notice_no);
		notice.setNotice_title(title);
		notice.setNotice_content(content);
		
		int result=noticeService.updateNotice(notice);
		
		
		String tmp=null;
		if(result>0){
			model.addAttribute("notice_no", notice_no);
			tmp="redirect:notice.selectOne.do";
		}else {
			tmp="main/404";
		}
		
		return tmp;
	}
	
	//
	@RequestMapping(value="notice.deleteNotice.do",  method={RequestMethod.GET, RequestMethod.POST})
	public String deleteNotice(HttpServletRequest request){
		
		int notice_no=Integer.parseInt(request.getParameter("notice_no"));
		
		
		int result=noticeService.deleteNotice(notice_no);
		
		String tmp=null;
		if(result>0){
			tmp="redirect:notice.selectList.do";
		}else {
			tmp="main/404";
		}
		
		
		return tmp;
		
	}
}
