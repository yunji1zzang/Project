package com.springapp.uglys.user.dao;

import com.springapp.uglys.user.vo.UserVO;

public interface UserDAO {
	
	// 로그인
	public UserVO login(UserVO vo) throws Exception;
	
	// 회원가입
	public void insertUser(UserVO vo) throws Exception;
	
	// 회원 수정
	public void updateUser(UserVO vo) throws Exception;
	
	// 회원 탈퇴
	public void deleteUser(UserVO vo) throws Exception;
	
	// 회원 정보 보기
	public UserVO selectUser(UserVO vo);
	
	public int checkUser(String user_id);
	
	
}
