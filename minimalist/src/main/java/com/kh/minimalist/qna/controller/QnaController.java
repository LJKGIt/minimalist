package com.kh.minimalist.qna.controller;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.kh.minimalist.qna.model.service.QnaServiceImpl;
import com.kh.minimalist.qna.model.vo.Qna;

@Controller
public class QnaController {

	@Autowired
	private QnaServiceImpl qnaService;
	
	//문의글 list
	@RequestMapping(value="qna.selectList.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectList(HttpServletRequest request, Model model){
		
		int currentPage=1;
		//현재 페이지
		
		if(request.getParameter("page")!=null){
			//현재 페이지 보정
		
				currentPage=Integer.parseInt(request.getParameter("page"));
	
		}
		int countRow=qnaService.countRow();
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
		
		ArrayList<Qna> list=qnaService.selectList(map);
		
		model.addAttribute("list", list);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("maxPage", maxPage);
		
		return "qna/qnaList";
	}
	
	//문의글 하나보기(작성자 및 관리자만 열람가능)
	@RequestMapping(value="qna.selectOne.do", method={RequestMethod.GET, RequestMethod.POST})
	public String selectOne(HttpServletRequest request, Model model){
		
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
		
		Qna qna=qnaService.selectOne(qna_no);
		
		model.addAttribute("qna", qna);
		
		return "qna/qnaDetail";
	}
	
	
	
	//글 작성.
	
	//글 삭제.
	
	//글 수정.
	
	//댓글달기 - 관리자만.
	@RequestMapping(value="qna.addComment.do", method={RequestMethod.GET, RequestMethod.POST})
	public void addComment(HttpServletRequest request,
			HttpServletResponse response, Model model) throws IOException{
		
		Qna qna=new Qna();
		
		
		int result=0;
		if(request.getParameter("qna_no")!=null){
				qna.setQna_no(Integer.parseInt(request.getParameter("qna_no")));
			if(request.getParameter("comment")!=null){
				qna.setQna_comment(request.getParameter("comment"));
			}
			result=qnaService.addComment(qna);
		}
		
		
		PrintWriter writer=response.getWriter();
		if(result>0){
			
			writer.append("yes");
			writer.flush();
		}else {
			writer.append("no");
			writer.flush();
		}
		writer.close();
		
		
	}
	
	@RequestMapping(value="qna.viewWriteForm.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewWriteForm(){
		
		
		return "qna/writeForm";
	}
	
	//문의글 작성.cnslFile
	@RequestMapping(value="qna.writeQna.do", method={RequestMethod.GET, RequestMethod.POST})
	public String writeQna(HttpServletRequest request,
			@RequestParam("cnslFile") MultipartFile uploadFile
			) throws UnsupportedEncodingException{
		
		
		
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		
	
		String savePath="C:\\workspace\\minimalist\\src\\main\\webapp\\resources\\img_qna";
		//파일저장을 위한 경로 설정.
		//File file=new File(savePath);
		

		String fileName=uploadFile.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String reName=id+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		String fullPath=savePath+"\\"+reName;
	
		try {
			BufferedOutputStream stream=null;
				
					//파일 입출력을 통해 파일을 저장.
					
					stream=new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					byte[] bytes=uploadFile.getBytes();
					stream.write(bytes);
					stream.flush();
				
				stream.close();
			
		} catch (Exception e) {
	
		}
		
		
		
		Qna qna=new Qna();
		
		qna.setImg_path(reName);
		qna.setQna_category(category);
		qna.setQna_title(title);
		qna.setQna_content(content);
		qna.setMember_id(id);
		
		int result=qnaService.writeQna(qna);
		
		
		String tmp="";
		if(result>0){
			tmp="redirect:qna.selectList.do";
		}else {
			tmp="main/404";
		}
		
		
		return tmp;
	}
	
	
	
	
	//자주하는 질무 보여주기.
	@RequestMapping(value="qna.selectFaq.do", method={RequestMethod.GET, RequestMethod.POST})
	public String viewFaq(){
		
		return "qna/faq";
	}
	
	
	
	
	//질문 수정 폼.
	@RequestMapping(value="qna.viewUpdateForm.do", method=RequestMethod.GET)
	public String viewUpdateForm(HttpServletRequest request, Model model){
		
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
			
		Qna qna=qnaService.selectOne(qna_no);
		
		model.addAttribute("qna", qna);
		
		return "qna/updateForm";
	}
	
	
	
	//질문 수정. qna.updateQna.do
	@RequestMapping(value="qna.updateQna.do", method=RequestMethod.POST)
	public String updateQna(HttpServletRequest request, 
			@RequestParam("cnslFile") MultipartFile uploadFile,
			Model model){
		
		Qna qna=new Qna();
		
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
		String category=request.getParameter("category");
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		String id=request.getParameter("id");
		
		String temp=uploadFile.getOriginalFilename();
		
		if(temp.contains("jpg") || temp.contains("png") || temp.contains("gif")){
	
		String savePath="C:\\workspace\\minimalist\\src\\main\\webapp\\resources\\img_qna";
		//파일저장을 위한 경로 설정.
		//File file=new File(savePath);
		

		String fileName=uploadFile.getOriginalFilename();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		String reName=id+sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		String fullPath=savePath+"\\"+reName;
	
		try {
			BufferedOutputStream stream=null;
				
					//파일 입출력을 통해 파일을 저장.
					
					stream=new BufferedOutputStream(new FileOutputStream(new File(fullPath)));
					byte[] bytes=uploadFile.getBytes();
					stream.write(bytes);
					stream.flush();
				
				stream.close();
				
				qna.setImg_path(reName);
				//이미지 db에 저장.
		} catch (Exception e) {
			
		}
		
		}
		
		qna.setQna_no(qna_no);
		qna.setQna_category(category);
		qna.setQna_title(title);
		qna.setQna_content(content);
		
		
		
		int result=qnaService.updateQna(qna);
		
		
		String tmp="";
		if(result>0){
			model.addAttribute("qna_no", qna_no);
			tmp="redirect:qna.selectOne.do";
		}else {
			tmp="main/404";
		}
		
		
		return tmp;
	}
	
	//질문 삭제 qna.deleteQna.do
	
	@RequestMapping(value="qna.deleteQna.do", method=RequestMethod.GET)
	public String deleteQna(HttpServletRequest request){
		
		int qna_no=Integer.parseInt(request.getParameter("qna_no"));
		
		int result=qnaService.deleteQna(qna_no);
		
		String tmp=null;
		if(result>0){
			tmp="redirect:qna.selectList.do";
		}else {
			tmp="main/404";
		}
		return tmp;
	}
}
