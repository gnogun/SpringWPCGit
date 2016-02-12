package com.latis.wpc.dao.user;

import java.util.ArrayList;
import java.util.Map;

import com.latis.wpc.dto.user.WpcUser;

public interface UserManageDao {
	public ArrayList<WpcUser> loadUserList();
	public ArrayList<WpcUser> searchUser(String filter, String keyword);
	public String addUser(Map<String, String> jsonMap);
	public String editUser(Map<String, String> jsonMap);
	public String deleteUser(Map<String, String> jsonMap);
}
