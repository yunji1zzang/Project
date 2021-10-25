package com.springapp.uglys.user.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.springapp.uglys.user.dao.UserDAO;
import com.springapp.uglys.user.vo.UserVO;

@Service
public class UserServiceImpl implements UserService{

	@Inject 
	UserDAO dao;

	// 로그인
	@Override
	public UserVO login(UserVO vo) throws Exception {
		return dao.login(vo);
	}

	@Override
	public void insertUser(UserVO vo) throws Exception{
		dao.insertUser(vo);
	}

	@Override
	public void updateUser(UserVO vo) throws Exception {
		dao.updateUser(vo);
	}

	@Override
	public void deleteUser(UserVO vo) throws Exception{
		dao.deleteUser(vo);
	}

	@Override
	public UserVO selectUser(UserVO vo) {
		return dao.selectUser(vo);
	}

	@Override
	public int checkUser(String user_id) {
		// TODO Auto-generated method stub
		return dao.checkUser(user_id);
	}
}
