package com.board.service;

import java.util.List;

import com.board.domain.BoardVO;
import com.kubg.domain.OrderVO;

public interface BoardService {
	
	//게시물 목록
	public List<BoardVO> list() throws Exception;
	
	//게시물 작성 - 상품가져오기
	public List<OrderVO> writeId(String userId)throws Exception;
	
	//게시물 작성
	public void write(BoardVO vo) throws Exception;

	// 게시물 조회
	public BoardVO view(int bno) throws Exception;
	
	// 게시물 수정
	public void modify(BoardVO vo) throws Exception;
	
	// 게시물 삭제
	public void delete(int bno) throws Exception;

	//게시물 총 개수
	public int count() throws Exception; 
	
	//게시물 목록 + 페이징
	public List<BoardVO> listPage(int displayPost, int postNum) throws Exception;
	
	// 게시물 목록 + 페이징 + 검색
	public List<BoardVO> listPageSearch(
	  int displayPost, int postNum, String searchType, String keyword) throws Exception;

	// 게시물 총 갯수 + 검색 적용
	public int searchCount(String searchType, String keyword) throws Exception;

	
	
}
