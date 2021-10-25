package com.springapp.uglys.user.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.springapp.uglys.user.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO{
    
	@Inject SqlSession sql;

	// 로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return sql.selectOne("userMapping.login", vo);
	}

	// 회원가입
	@Override
	public void insertUser(UserVO vo) throws Exception{
		sql.insert("userMapping.insertUser", vo);
	}

	// 회원정보 수정
	@Override
	public void updateUser(UserVO vo) throws Exception {
		sql.update("userMapping.updateUser",vo);
	}

	// 회원탈퇴
	@Override
	public void deleteUser(UserVO vo) throws Exception {
		sql.delete("userMapping.deleteUser", vo);
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		return sql.selectOne("userMapping.selectUser",vo);
	}

	@Override
	public int checkUser(String user_id) {
		return sql.selectOne("userMapping.idChk",user_id);
	}


}
