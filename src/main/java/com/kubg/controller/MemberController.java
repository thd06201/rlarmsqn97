package com.kubg.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kubg.domain.MemberVO;
import com.kubg.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	
	@Inject
	MemberService service;

	
	// 회원 가입 get
	@RequestMapping(value = "/signup", method = RequestMethod.GET)
	public void getSignup() throws Exception {
	}

	// 회원 가입 post
	@RequestMapping(value = "/signup", method = RequestMethod.POST)
	public String postSignup(MemberVO vo) throws Exception {
	  
	 service.signup(vo);

	 return "redirect:/";
	}
	
	// 로그인  get
	@RequestMapping(value = "/signin", method = RequestMethod.GET)
	public void getSignin() throws Exception {
	}

	// 로그인 post
	@RequestMapping(value = "/signin", method = RequestMethod.POST)
	public String postSignin(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
	   
	 MemberVO login = service.signin(vo);  
	 HttpSession session = req.getSession();
	 
	 if(login != null ) {
		  session.setAttribute("member", login);
		 } else {
		  session.setAttribute("member", null);
		  rttr.addFlashAttribute("msg", false);
		  return "redirect:/member/signin";
		 }  
		 
		 return "redirect:/";
		}
		  
		// 로그아웃
		@RequestMapping(value = "/signout", method = RequestMethod.GET)
		public String signout(HttpSession session) throws Exception {
		 
		 service.signout(session);
		   
		 return "redirect:/";
		
		}
		
		// 아이디 중복 체크
		@ResponseBody
		@RequestMapping(value="/idChk", method = RequestMethod.POST)
		public int postIdCheck(HttpServletRequest req) throws Exception {
			String userId = req.getParameter("userId");
			MemberVO idChk = service.idChk(userId);
			
			int result = 0;
			
			if(idChk != null) {
				result = 1;
			}
			
			return result;
		}
		
		//회원정보 수정
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public void getModify() throws Exception {
		
		}
		
		@RequestMapping(value = "/modify", method = RequestMethod.POST)
		public String postModify(HttpSession session, MemberVO vo) throws Exception {
		 
		 service.modify(vo);
		 session.invalidate();
		 return "redirect:/";
		}
		
		//회원탈퇴
		@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
		public void getWithdrawal() throws Exception {
		
		}
		
		@RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
		public String postWithdrawal(HttpSession session, MemberVO vo, RedirectAttributes rttr) throws Exception {
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			 
			 String oldPass = member.getUserPass();
			 String newPass = vo.getUserPass();
			 
			 if(!(oldPass.equals(newPass))) {
				 rttr.addFlashAttribute("msg", false);
				 return "redirect:/member/withdrawal";
			 }
			 
			 service.withdrawal(vo);
			 
			 session.invalidate();
			  
			 return "redirect:/";
			}
		
		
		
		
		

}
		
