package com.latis.wpc.service.user;

import java.util.ArrayList;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.latis.wpc.dao.user.UserManageDao;
import com.latis.wpc.dto.user.WpcUser;

@Service
public class UserManageServiceImpl implements UserManageService {

	@Autowired
	private UserManageDao userDao;
	
	@Override
	public ArrayList<WpcUser> loadUserList() {
		// TODO Auto-generated method stub
		return userDao.loadUserList();
	}

	@Override
	public ArrayList<WpcUser> searchUser(String filter, String keyword) {
		// TODO Auto-generated method stub
		return userDao.searchUser(filter, keyword);
	}

	@Override
	public String addUser(Map<String, String> jsonMap) {
		// TODO Auto-generated method stub
		return userDao.addUser(jsonMap);
	}

	@Override
	public String editUser(Map<String, String> jsonMap) {
		// TODO Auto-generated method stub
		return userDao.editUser(jsonMap);
	}

	@Override
	public String deleteUser(Map<String, String> jsonMap) {
		// TODO Auto-generated method stub
		return userDao.deleteUser(jsonMap);
	}

//	@Override
//	public ArrayList<WpcUser> searchUser() {
//		// TODO Auto-generated method stub
//		return userDao.searchUser();
//	}

}
