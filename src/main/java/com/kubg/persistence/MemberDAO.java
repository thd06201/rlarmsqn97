package com.kubg.persistence;

import com.kubg.domain.MemberVO;

public interface MemberDAO {
	
	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	// 아이디 중복체크
	public MemberVO idChk(String userId) throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo) throws Exception;
	
	//회원탈퇴
	public void withdrawal(MemberVO vo) throws Exception;
	
	//이메일 확인
	public String getIdByEmail(String email) throws Exception;


}
