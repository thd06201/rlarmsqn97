package com.kubg.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kubg.domain.MemberVO;
import com.kubg.service.ShopService;


@Controller
public class HomeController {
	
	@Inject
	ShopService service;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = null;

		if (member != null) {
			userId = member.getUserId();
		}
		
		model.addAttribute("cartList", service.cartList(userId));
		
		return "home";
	}
	
}
