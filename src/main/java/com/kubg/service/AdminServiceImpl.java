package com.kubg.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kubg.domain.CategoryVO;
import com.kubg.domain.CuGoodsVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.MemberVO;
import com.kubg.persistence.AdminDAO;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Inject
	private AdminDAO dao;
	
	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return dao.category();
		
	}
	
	//상품등록
	@Override
	public void register (GoodsVO vo) throws Exception {
		dao.register(vo);
	}
	
	//상품등록
	@Override
	public void register2 (CuGoodsVO vo) throws Exception {
		dao.register2(vo);
	}

	//상품목록
	@Override
	public List<GoodsViewVO> goodslist() throws Exception {
		System.out.println("서비스");
		return dao.goodslist();
	}
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return dao.goodsView(gdsNum);
	}
	
	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		dao.goodsModify(vo);
	}
	
	//상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		dao.goodsDelete(gdsNum);
	}
	
	//회원목록
	@Override
	public List<MemberVO> goodsmember() throws Exception {
		return dao.goodsmember();
	}
		
		
}
