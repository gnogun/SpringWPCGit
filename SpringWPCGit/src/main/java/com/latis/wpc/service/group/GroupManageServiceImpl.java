package com.latis.wpc.service.group;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.latis.wpc.dao.group.GroupManageDao;
import com.latis.wpc.dto.group.WpcGroup;
import com.latis.wpc.dto.group.WpcGroupGrant;

@Service
public class GroupManageServiceImpl implements GroupManageService {
	
	@Autowired
	private GroupManageDao gropManageDao;
	
	@Override
	public ArrayList<WpcGroup> loadGroupList() {
		// TODO Auto-generated method stub
		return gropManageDao.loadGroupList();
	}
	
	@Override
	public WpcGroupGrant loadWpcList(){
		return gropManageDao.loadWpcList();
	};
	
}
