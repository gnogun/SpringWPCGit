package com.latis.wpc.dao.group;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.latis.wpc.dto.group.WpcGroup;
import com.latis.wpc.dto.group.WpcGroupGrant;
import com.latis.wpc.mapper.WpcMapper;

@Repository
public class GroupManageDaoImpl implements GroupManageDao{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public ArrayList<WpcGroup> loadGroupList() {
		// TODO Auto-generated method stub
		
		WpcMapper wpcMapper = sqlSession.getMapper(WpcMapper.class);
		
		ArrayList<WpcGroup> returnList = wpcMapper.getAllGroupList();
		
		return wpcMapper.getAllGroupList();
	}
	
	@Override
	public WpcGroupGrant loadWpcList() {
		// TODO Auto-generated method stub
		
		WpcMapper wpcMapper = sqlSession.getMapper(WpcMapper.class);
		
		
		return null;
	}

}
