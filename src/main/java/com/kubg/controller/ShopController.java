package com.kubg.controller;

import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.domain.BoardVO;
import com.kubg.domain.CartVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.MemberVO;
import com.kubg.domain.OrderDetailVO;
import com.kubg.domain.OrderListVO;
import com.kubg.domain.OrderVO;
import com.kubg.service.ShopService;

@Controller
@RequestMapping("/shop/*")
public class ShopController {

	@Inject
	ShopService service;
	 
	//검색 결과 페이지 
    @RequestMapping(value = "/shop/Search", method = RequestMethod.GET)
    public String Search() throws Exception {
        return "/member/shop/Search";
    }
    
	//검색결과 메소드
	@RequestMapping(value = "/shop/productSearch", method = RequestMethod.POST)
    public String productSearch(HttpSession session, Model model,GoodsVO vo, HttpServletRequest request) throws Exception {
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = null;

		if (member != null) {
			userId = member.getUserId();
		}
		
		model.addAttribute("cartList", service.cartList(userId));
		
		
        String keyword = request.getParameter("keyword");

        List<GoodsVO> productList = service.productSearch(keyword);

        model.addAttribute("productList",productList);
        return "/member/shop/Search";
    }
	
	//카테고리별 상품 리스트
	@RequestMapping(value= "/shop/flower", method = RequestMethod.GET)
	public String getList(HttpSession session, @RequestParam("c") int cateCode, Model model) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = null;

		if (member != null) {
			userId = member.getUserId();
		}
		
		model.addAttribute("cartList", service.cartList(userId));
		
		List<GoodsViewVO> list = service.list(cateCode);
		
		model.addAttribute("list", list);
	
		return "/member/shop/flower";
	}

	
	
	// 상품디테일
	@RequestMapping(value = "/shop/productdetail", method = RequestMethod.GET)
	public String getProductDetail(HttpSession session,@RequestParam("n") int gdsNum, Model model) throws Exception {

		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = null;

		if (member != null) {
			userId = member.getUserId();
		}
		
		System.out.println(gdsNum);
		
		model.addAttribute("cartList", service.cartList(userId));
		
		GoodsViewVO productdetail = service.goodsView(gdsNum);
		model.addAttribute("productdetail", productdetail);
		model.addAttribute("list1", service.list1(gdsNum));
	
		return "/member/shop/productdetail";
	}
	

	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/productdetail/addCart", method = RequestMethod.POST)
	public int addCart(CartVO cart, HttpSession session) throws Exception {
	 
	int result = 0;
		
	 MemberVO member = (MemberVO)session.getAttribute("member");
	
	 if(member != null) {
		 cart.setUserId(member.getUserId());
		 service.addCart(cart);
		 result = 1;
	 }
	 return result;
	}
	
	    // 카트 목록
		@RequestMapping(value = "/cartList", method = RequestMethod.GET)
		public String getCartList(HttpSession session, Model model) throws Exception {
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = null;

		if (member != null) {
			userId = member.getUserId();
		}
		
		model.addAttribute("cartList", service.cartList(userId));
		return "/member/shop/cartList";
		}
		
		// 카트 삭제
		@ResponseBody
		@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
		public int deleteCart(HttpSession session,
		     @RequestParam(value = "chbox[]") List<String> chArr, CartVO cart) throws Exception {
		 
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 String userId = member.getUserId();
		 
		 int result = 0;
		 int cartNum = 0;
		 
		 
		 if(member != null) {
		  cart.setUserId(userId);
		  
		  for(String i : chArr) {   
		   cartNum = Integer.parseInt(i);
		   cart.setCartNum(cartNum);
		   service.deleteCart(cart);
		  }   
		  result = 1;
		 }  
		 return result;  
		}
		
		
		
		// 장바구니에서 주문
		@RequestMapping(value = "/cartList", method = RequestMethod.POST)
		public String order(HttpSession session, String cartNum, String gdsNumA, String gdsNameA, String gdsPriceA, String cartStockA,
				OrderVO order, OrderDetailVO orderDetail, Model model) throws Exception {
		 
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 String userId = member.getUserId();
		 
		 Calendar cal = Calendar.getInstance();
		 int year = cal.get(Calendar.YEAR);
		 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		 String subNum = "";
		 String orderId = "";
		 
		 String[] gdnsNumASplit = gdsNumA.split(",");
		 String[] gdsNameASplit = gdsNameA.split(",");
		 String[] gdsPriceAASplit = gdsPriceA.split(",");
		 String[] cartStockAASplit = cartStockA.split(",");
		 String[] checkedSplit = cartNum.split(",");
		 int[] checkedList = new int[checkedSplit.length];
		 for (int i = 0; i < checkedSplit.length; i++) {
			 
			 subNum += (int)(Math.random() * 10);
			 orderId = ymd + "_" + subNum;
			 
			 order.setOrderId(orderId + i);
			 
			 order.setUserId(userId);
			 order.setGdsNum(Integer.valueOf(gdnsNumASplit[i]));
			 order.setGdsPrice(Integer.valueOf(gdsPriceAASplit[i]));
			 order.setGdsStock(Integer.valueOf(cartStockAASplit[i]));
			 order.setGdsName(gdsNameASplit[i]);
			 checkedList[i] = Integer.parseInt(checkedSplit[i]);
			 
			 service.orderInfo(order);
		 }
		 
		 service.cartDelete(userId, checkedList);
		 
		 model.addAttribute("OrderView", order);
		 
		 return "member/shop/payComplete";  
		}
		
		// 주문 목록
		@RequestMapping(value = "/orderList", method = RequestMethod.GET)
		public String getOrderList(HttpSession session, OrderVO order, Model model) throws Exception {
		 
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 
		 String userId = member.getUserId();
		 
		 if (member != null) {
				userId = member.getUserId();
			}
			
			model.addAttribute("cartList", service.cartList(userId));
		 
		 order.setUserId(userId);
		 
		 List<OrderVO> orderList = service.orderList(order);
		 
		 model.addAttribute("orderList", orderList);
		 
		 return "member/shop/orderList";
		}
		
		// 주문 상세 목록
		@RequestMapping(value = "/orderView", method = RequestMethod.GET)
		public String getOrderView(HttpSession session, Model model) throws Exception {
		 MemberVO member = (MemberVO)session.getAttribute("member");
		 String userId = member.getUserId();
		 
		 List<OrderListVO> orderView = service.getOrderViewsByUserId(userId);
		 
		 System.out.println("orderView: " + orderView);
		 
		 
		 model.addAttribute("orderView", orderView);
		 
		 return "member/shop/orderView";
		}
		
		
		// 주문 페이지로 이동
		@RequestMapping(value = "/shop/pay", method = {RequestMethod.GET, RequestMethod.POST})
		public String getPay(int gdsNum, String stock, HttpServletRequest request) throws Exception {
			GoodsViewVO productdetail = service.goodsView(gdsNum);
			request.setAttribute("productdetail", productdetail);
			request.setAttribute("stock", Integer.parseInt(stock));
			
			return "/member/shop/pay";
		}
		
		//바로 결제의 주문정보 내역
		@RequestMapping(value="/shop/logPayment", method = {RequestMethod.GET, RequestMethod.POST})
		public String logPayment(OrderVO order, @RequestParam("gdsName") String gdsName ,HttpServletRequest request, Model model) throws Exception {
			
			String ymd = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyMMdd"));
			String subNum = "";
			for (int i = 0; i < 6; i++) {
				subNum += (int) (Math.random() * 10);
			}
			order.setOrderId(ymd + "_" + subNum);
			order.setOrderDate(new Date());
			
			service.orderInfo(order);

			model.addAttribute("OrderView", order);
			
			return "member/shop/payComplete";
		}
		
		
		
		//주문 상세보기 페이지 
		@RequestMapping(value = "/shop/payComplete", method = {RequestMethod.GET, RequestMethod.POST})
			public String getpayComplete() throws Exception {
										 	
				return "member/shop/orderPage";
		}
		
		@RequestMapping(value = "/shop/orderPage", method = RequestMethod.GET)
		public String orderList(HttpServletRequest request,HttpSession session, Model model) throws Exception {
			
			
			
			MemberVO member = (MemberVO)session.getAttribute("member");
			String userId = null;

			if (member != null) {
				userId = member.getUserId();
			}
			
			List<OrderVO> order = service.getOrdersByUserId(userId);
			
			model.addAttribute("orderList", order);
			
			return "member/shop/orderPage";
		}
		
		//커스터 마이징
	    @RequestMapping(value = "/shop/cu", method = RequestMethod.GET)
	    public String cu() throws Exception {
	        return "/member/shop/cu";
	    }
	    
	  //커스터 마이징
	    @RequestMapping(value = "/shop/cubefore", method = RequestMethod.GET)
	    public void cubefore() throws Exception {

	    }
	    
	  
	    
}