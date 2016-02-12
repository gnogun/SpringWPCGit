package com.latis.wpc;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.latis.wpc.dto.group.WpcGroup;
import com.latis.wpc.dto.user.WpcUser;
import com.latis.wpc.service.group.GroupManageService;

@Controller
public class GroupController {
	
	@Autowired
	private GroupManageService service;

	@RequestMapping(value = {"/{role}/groupList.do"})
	@ResponseBody
	public ArrayList<WpcGroup> loadGroupList(){
		//(@RequestBody Map< String, Object> data
		//ajax에서 요청할대 보내는 data - json 키값은 무조건 string 이니까 이렇게 오면 됨
		
//		return service.loadUserList();
		return service.loadGroupList();
	}
	
	@ResponseBody
	public Map<String, String> loadWpcList(){
		//(@RequestBody Map< String, Object> data
		//ajax에서 요청할대 보내는 data - json 키값은 무조건 string 이니까 이렇게 오면 됨
		
//		return service.loadUserList();
		return null;
	}
}
