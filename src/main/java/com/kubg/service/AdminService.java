package com.kubg.service;

import java.util.List;

import com.kubg.domain.CategoryVO;
import com.kubg.domain.CuGoodsVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.MemberVO;

public interface AdminService {
	
	//카테고리
	public List<CategoryVO> category() throws Exception;
	
	//상품등록
	public void register (GoodsVO vo) throws Exception;

	//상품등록
	public void register2 (CuGoodsVO vo) throws Exception;

	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception;
	
	//상품조회
	public GoodsViewVO goodsView(int gdsNum) throws Exception;
		
	//상품 수정
	public void goodsModify(GoodsVO vo) throws Exception;
	
	//상품 삭제
	public void goodsDelete(int gdsNum) throws Exception;
	
	//회원목록
	public List<MemberVO> goodsmember() throws Exception;
		
	
	
}
