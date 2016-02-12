package com.latis.wpc.mapper;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.latis.wpc.dto.group.WpcGroup;
import com.latis.wpc.dto.user.WpcUser;

public interface WpcMapper {
	
	//------USER-----------
	public WpcUser getUser(HashMap<String, String> userMap);
	
	public ArrayList<WpcUser> searchUser(HashMap<String, String> userMap);
	
	public void addUser(Map<String, String> jsonMap);
	public void editUser(Map<String, String> jsonMap);
	public void deleteUser(Map<String, String> jsonMap);
	
	//---------------------
	
	//-------Group---------
	
	public ArrayList<WpcGroup> getAllGroupList();
	
	
	//---------------------
	
	
}
