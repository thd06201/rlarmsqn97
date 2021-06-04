package com.kubg.service;

import javax.servlet.http.HttpSession;

import com.kubg.domain.MemberVO;

public interface MemberService {

	//회원가입
	public void signup(MemberVO vo) throws Exception;
	
	//로그인
	public MemberVO signin(MemberVO vo) throws Exception;
	
	//로그아웃
	public void signout(HttpSession session) throws Exception;
	
	//아이디 중복
	public MemberVO idChk(String userId) throws Exception;
	
	//회원정보 수정
	public void modify(MemberVO vo) throws Exception;
	
	//회원탈퇴
	public void withdrawal(MemberVO vo) throws Exception;
	
	//이메일 확인
	public String getIdByEmail(String email) throws Exception;

}
