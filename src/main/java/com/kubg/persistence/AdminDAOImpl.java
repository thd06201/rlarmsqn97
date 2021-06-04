package com.kubg.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kubg.domain.CategoryVO;
import com.kubg.domain.CuGoodsVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.MemberVO;

@Repository
public class AdminDAOImpl implements AdminDAO{  
	
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.kubg.mappers.adminMapper";

	//카테고리
	@Override
	public List<CategoryVO> category() throws Exception {
		return sql.selectList(namespace + ".category");
		
	}
	
	//상품등록
	@Override
	public void register (GoodsVO vo) throws Exception {
		sql.insert(namespace + ".register", vo);
	}
	
	//상품등록
	@Override
	public void register2 (CuGoodsVO vo) throws Exception {
		sql.insert(namespace + ".register2", vo);
	}	
	
	@Override
	//상품목록
	public List<GoodsViewVO> goodslist() throws Exception {
		return sql.selectList(namespace + ".goodslist");
	}
	
	//상품조회
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne(namespace + ".goodsView", gdsNum);
	}
	
	//상품 수정
	@Override
	public void goodsModify(GoodsVO vo) throws Exception {
		sql.update(namespace + ".goodsModify", vo);
	}
		
	//상품 삭제
	@Override
	public void goodsDelete(int gdsNum) throws Exception {
		sql.delete(namespace + ".goodsDelete", gdsNum);
	}
	
	//회원목록
	@Override
	public List<MemberVO> goodsmember() throws Exception {
		return sql.selectList(namespace + ".goodsmember");
	}
		
	

	
}
