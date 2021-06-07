package com.board.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.board.domain.BoardVO;
import com.board.domain.Page;
import com.board.service.BoardService;
import com.kubg.domain.MemberVO;
import com.kubg.domain.OrderVO;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	@Inject
	BoardService service;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception{
		
		List<BoardVO> list = null;
		list = service.list();
		
		model.addAttribute("list", list);
		
	}
	
	//게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public String getWrite(HttpSession session , Model model) throws Exception{
		
		MemberVO member = (MemberVO)session.getAttribute("member");

		List<OrderVO> writeId = service.writeId(member.getUserId());
		
		for (int i = 0; i < writeId.size(); i++) {
			System.out.println(writeId.get(i).getOrderId());
		}
		
		model.addAttribute("OrderList", writeId);
		return "/board/write";
		
	}
	//게시물 작성
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String postWrite(BoardVO vo, HttpSession session) throws Exception{
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		vo.setUserId(member.getUserId());
		
		service.write(vo);
		
		return "redirect:/board/listPageSearch?num=1";
	}
	//게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("bno") int bno, Model model) throws Exception{
		BoardVO vo = service.view(bno);
		model.addAttribute("view",vo);
	
	}
	
	// 게시물 수정
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void getModify(@RequestParam("bno") int bno, Model model) throws Exception {
		
		BoardVO vo = service.view(bno);
		
		model.addAttribute("view",vo);
		System.out.println("view" + bno);
	}
	
	@RequestMapping(value ="/modify", method = RequestMethod.POST)
	public String postModify(BoardVO vo) throws Exception {

	 	
	 service.modify(vo);
	   
	 return "redirect:/board/view?bno=" + vo.getBno();
	}
	
	//게시물 삭제
	@RequestMapping(value = "/delete", method = RequestMethod.GET)
	public String getDelete(@RequestParam("bno") int bno , Model model) throws Exception{
		
		service.delete(bno);
		return "redirect:/board/listPageSearch?num=1";
	}
	
	//게시물 목록 + 페이징 추가 
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
		
		Page page = new Page();
		
		page.setNum(num);
		page.setCount(service.count());  

		List<BoardVO> list = null; 
		list = service.listPage(page.getDisplayPost(), page.getPostNum());

		model.addAttribute("list", list);   
		
		model.addAttribute("page", page);
		model.addAttribute("select", num);
		
	}
	
	// 게시물 목록 + 페이징 추가 + 검색
	@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
	public void getListPageSearch(Model model, @RequestParam("num") int num, 
			@RequestParam(value = "searchType",required = false, defaultValue = "title") String searchType,
			@RequestParam(value = "keyword",required = false, defaultValue = "") String keyword
		) throws Exception {

	 
	 Page page = new Page();
	 
	 page.setNum(num);
	 page.setCount(service.searchCount(searchType, keyword));
	 
	 page.setSearchType(searchType);
	 page.setKeyword(keyword); 
	 
	 
	 List<BoardVO> list = null; 

	 list = service.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
	 
	 model.addAttribute("list", list);
	 model.addAttribute("page", page);
	 model.addAttribute("select", num);
	 
	 
	}
	
	
		
	
}