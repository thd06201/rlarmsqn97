package com.kubg.service;

import java.util.HashMap;
import java.util.List;

import com.kubg.domain.CartListVO;
import com.kubg.domain.CartVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.OrderDetailVO;
import com.kubg.domain.OrderListVO;
import com.kubg.domain.OrderVO;

public interface ShopService {

	//검색기능
    public List<GoodsVO> productSearch(String keyword ) throws Exception;
	
	//카테고리별 상품 리스트
	public List<GoodsViewVO> list(int cateCode) throws Exception;

	//상품 디테일
	public GoodsViewVO goodsView(int gdsNum) throws Exception;

	//카트 담기
	public void addCart(CartVO cart) throws Exception;
	
	//카트 목록
	public List<CartListVO> cartList(String userId) throws Exception;

	//카트 삭제
	public void deleteCart(CartVO cart) throws Exception;

	//주문 정보
	public void orderInfo(OrderVO order) throws Exception;

	public List<OrderVO> getOrdersByUserId(String userId);
	
	// 카트 비우기
	public void cartAllDelete(String userId) throws Exception;
		
	//주문 상세 정보(장바구니)
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception;

	// 주문 목록
	public List<OrderVO> orderList(OrderVO order) throws Exception;
		
	// 특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;









}
