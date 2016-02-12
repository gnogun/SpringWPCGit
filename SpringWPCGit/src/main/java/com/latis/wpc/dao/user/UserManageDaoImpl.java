package com.latis.wpc.dao.user;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.dao.SaltSource;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.latis.wpc.dto.user.WpcUser;
import com.latis.wpc.mapper.WpcMapper;

@Repository
public class UserManageDaoImpl implements UserManageDao {

	@Autowired
	private SqlSessionTemplate sqlSession;

	
	@Autowired
	private ShaPasswordEncoder encoder;
	
	@Autowired 
	private SaltSource saltSource;
	
	
	@Override
	public ArrayList<WpcUser> loadUserList() {
		// TODO Auto-generated method stub

		ArrayList<WpcUser> list = (ArrayList) sqlSession
				.selectList("com.latis.wpc.mapper.WpcMapper.getUserList");

		return list;
	}



	@Override
	public ArrayList<WpcUser> searchUser(String filter, String keyword) {
		// TODO Auto-generated method stub
		WpcMapper mapper = sqlSession.getMapper(WpcMapper.class);
//		
		HashMap<String, String> userMap = new HashMap<String, String>();
		
		userMap.put(filter, "%"+keyword+"%");
		
		ArrayList<WpcUser> list =  mapper.searchUser(userMap);
		
//		ArrayList<WpcUser> list = (ArrayList) sqlSession
//				.selectList("com.latis.wpc.mapper.WpcMapper.getUserList");

		return list;
	}



	@Override
	public String addUser(Map<String, String> jsonMap) {
		// TODO Auto-generated method stub
		WpcMapper mapper = sqlSession.getMapper(WpcMapper.class);
		System.out.println("!!!!!!!!!!"+encoder.encodePassword("gno", saltSource));
		
//		Iterator<String> iterator = jsonMap.keySet().iterator();
		String pwd = jsonMap.get("pwd");
		jsonMap.put("pwd", encoder.encodePassword(pwd, saltSource));
		mapper.addUser(jsonMap);
		
		return "true";
	}



	@Override
	public String editUser(Map<String, String> jsonMap) {
		// TODO Auto-generated method stub
		WpcMapper mapper = sqlSession.getMapper(WpcMapper.class);
		System.out.println("!!!!!!!!!!"+encoder.encodePassword("gno", saltSource));
		
//		Iterator<String> iterator = jsonMap.keySet().iterator();
		String pwd = jsonMap.get("pwd");
		jsonMap.put("pwd", encoder.encodePassword(pwd, saltSource));
		mapper.editUser(jsonMap);
		
		return "true";
	}



	@Override
	public String deleteUser(Map<String, String> jsonMap) {
		// TODO Auto-generated method stub
		//deleteUser
		WpcMapper mapper = sqlSession.getMapper(WpcMapper.class);
		mapper.deleteUser(jsonMap);
		return "true";
	}

//	@Override
//	public ArrayList<WpcUser> searchUser() {
//		// TODO Auto-generated method stub
//		
//		WpcMapper mapper = sqlSession.getMapper(WpcMapper.class);
//		
//		HashMap<String, String> userMap = new HashMap<String, String>();
//		
//		userMap.put("id", "gno");
//		
//		ArrayList<WpcUser> list =  mapper.searchUser(userMap);
//		
////		ArrayList<WpcUser> list = (ArrayList) sqlSession
////				.selectList("com.latis.wpc.mapper.WpcMapper.getUserList");
//
//		return list;
//	}

}
