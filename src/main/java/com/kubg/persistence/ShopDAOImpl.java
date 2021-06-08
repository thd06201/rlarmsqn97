package com.kubg.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kubg.domain.CartListVO;
import com.kubg.domain.CartVO;
import com.kubg.domain.GoodsVO;
import com.kubg.domain.GoodsViewVO;
import com.kubg.domain.OrderDetailVO;
import com.kubg.domain.OrderListVO;
import com.kubg.domain.OrderVO;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sql;
	
	//매퍼
	private static String namespace = "com.kubg.mappers.shopMapper";
	
	// 검색기능
    public List<GoodsVO> productSearch(String keyword ) throws Exception {
        return sql.selectList(namespace + ".productSearch",keyword);
    }
	
	//카테고리별 상품 리스트
	@Override
	public List<GoodsViewVO> list(int cateCode) throws Exception {
		
		return sql.selectList(namespace + ".list", cateCode);
	}
	
	//상품 디테일
	@Override
	public GoodsViewVO goodsView(int gdsNum) throws Exception {
		return sql.selectOne("com.kubg.mappers.adminMapper" + ".goodsView", gdsNum);
	}
	
	//카트 담기
	@Override
	public void addCart(CartVO cart) throws Exception {
		sql.insert(namespace + ".addCart", cart);
	}
	
	//카트 목록
	@Override
	public List<CartListVO> cartList(String userId) throws Exception {
		return sql.selectList(namespace + ".cartList", userId);
	}

	//카트 삭제
	@Override
	public void deleteCart(CartVO cart) throws Exception {
		sql.delete(namespace + ".deleteCart", cart);
	}

	//주문 정보
	@Override
	public void orderInfo(OrderVO order) throws Exception {
		sql.insert(namespace + ".orderInfo", order);
	}
	
	@Override
	public List<OrderVO> getOrdersByUserId(String userId) {
		return sql.selectList(namespace + ".getOrdersByUserId", userId);
	}
	

	//주문 상세 정보(장바구니)
	@Override
	public void orderInfo_Details(OrderDetailVO orderDetail) throws Exception {
		sql.insert(namespace + ".orderInfo_Details", orderDetail);
	}
	
	// 카트 비우기
	@Override
	public void cartAllDelete(String userId) throws Exception {
		sql.delete(namespace + ".cartAllDelete", userId);
	}
	
	@Override
	public void cartDelete(String userId, int[] cartNums) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userId", userId);
		map.put("cartNums", cartNums);
		sql.delete(namespace + ".cartDelete", map);
	}

	// 주문 목록
	@Override
	public List<OrderVO> orderList(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderList", order);
	}
	
	// 특정 주문 목록
	@Override
	public List<OrderListVO> orderView(OrderVO order) throws Exception {
		return sql.selectList(namespace + ".orderView", order);
	}
	
	@Override
	public List<OrderListVO> getOrderViewsByUserId(String userId) throws Exception {
		return sql.selectList(namespace + ".getOrderViewsByUserId", userId);
	}

	@Override
	public int getOrderListCount(String userId) throws Exception {
		return sql.selectOne(namespace + ".getOrderListCount", userId);
	}

}
