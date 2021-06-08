package com.kubg.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.board.domain.BoardVO;
import com.kubg.domain.CartListVO;
import com.kubg.domain.CartVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.OrderDetailVO;
import com.kubg.domain.OrderListVO;
import com.kubg.domain.OrderVO;
import com.kubg.persistence.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{

	@Inject
	private ShopDAO dao;
	
	//상품별 리뷰 목록
	@Override
	public List<BoardVO> list1(int gdsNum) throws Exception {
			return dao.list1(gdsNum);
	}

	//검색기능
	 @Override
     public List<GoodsVO> productSearch(String keyword ) throws Exception{
         return  dao.productSearch(keyword);
     }
	
	//카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		return dao.list(cateCode);
	}
	
	//상품 디테일
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}
	
	//카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		dao.addCart(cart);
	}
	
	//카트 목록
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return dao.cartList(userId);
	}

	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		dao.deleteCart(cart);
	}

	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		dao.orderInfo(order);
	}

	@Override
	public List<OrderVO> getOrdersByUserId(String userId) {
		return dao.getOrdersByUserId(userId);
	}
	
	
	//주문 상세 정보(장바구니)
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		dao.orderInfo_Details(orderDetail);
	}
	
	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		dao.cartAllDelete(userId);
	}
	
	@Override
	public void cartDelete(String userId, int[] cartNums) {
		dao.cartDelete(userId, cartNums);
	}
	
	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return dao.orderList(order);
	}
		
	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return dao.orderView(order);
	}
	
	@Override
	public List<OrderListVO> getOrderViewsByUserId(String userId) throws Exception {
		return dao.getOrderViewsByUserId(userId);
	}

	@Override
	public int getOrderListCount(String userId) throws Exception {
		return dao.getOrderListCount(userId);
	}
}
