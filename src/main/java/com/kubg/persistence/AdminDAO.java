package com.kubg.persistence;

import java.util.List;

import com.kubg.domain.CategoryVO;
import com.kubg.domain.CuGoodsVO;
import com.kubg.domain.CuGoodsViewVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.MemberVO;
import com.kubg.domain.OrderListVO;
import com.kubg.domain.OrderVO;

public interface AdminDAO {
	
	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register (GoodsVO vo) throws Exception;
	
	//상품등록2
	public void register2 (CuGoodsVO vo) throws Exception;
	
	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception;
	
	//상품목록2
	public List<CuGoodsViewVO> cugoodslist() throws Exception;
	
	//상품조회 + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
	
	//상품조회2
	public CuGoodsViewVO cugoodsView(int cuNum) throws Exception;
		
	//상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품 수정2
	public void cugoodsModify(CuGoodsVO vo) throws Exception;
		
	//상품 삭제
	public void goodsDelete(int gdsNum) throws Exception;

	//상품 삭제2
	public void cugoodsDelete(int cuNum) throws Exception;
	
	//회원목록
	public List<MemberVO> goodsmember() throws Exception;

	//주문 목록
	public List<OrderVO> orderList() throws Exception;
	
	//특정 주문 목록
	public List<OrderListVO> orderView(OrderVO order) throws Exception;
		
}
