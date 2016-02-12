package com.latis.wpc;

import java.util.ArrayList;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.latis.wpc.dto.user.WpcUser;
import com.latis.wpc.service.user.UserManageService;

@Controller
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@Autowired
	private UserManageService service;
	
	
	
	@RequestMapping(value = {"/{role}/userList.do"})
	@ResponseBody
	public ArrayList<WpcUser> loadUserList(){
		//(@RequestBody Map< String, Object> data
		//ajax에서 요청할대 보내는 data - json 키값은 무조건 string 이니까 이렇게 오면 됨
		
		return service.loadUserList();
	}
	
	@RequestMapping(value = {"/{role}/searchUser.do"})
	@ResponseBody
	public ArrayList<WpcUser> searchUser(
			@RequestBody Map<String, String> jsonMap, 
			Model model) {
//		logger.info("Welcome home! The client locale is {}.");
		System.out.println(jsonMap);
		
		return service.searchUser(jsonMap.get("filter"), jsonMap.get("keyword"));
	}
	
	//addUser.do
	@RequestMapping(value = {"/{role}/addUser.do"})
	@ResponseBody
	public String addUser(
			@RequestBody Map<String, String> jsonMap, 
			Model model) {
//		logger.info("Welcome home! The client locale is {}.");
		System.out.println(jsonMap);
		
		return service.addUser(jsonMap);
	}
	
	@RequestMapping(value = {"/{role}/editUser.do"})
	@ResponseBody
	public String editUser(
			@RequestBody Map<String, String> jsonMap, 
			Model model) {
//		logger.info("Welcome home! The client locale is {}.");
		System.out.println(jsonMap);
		
		return service.editUser(jsonMap);
	}
	
	@RequestMapping(value = {"/{role}/deleteUser.do"})
	@ResponseBody
	public String deleteUser(
			@RequestBody Map<String, String> jsonMap, 
			Model model) {
//		logger.info("Welcome home! The client locale is {}.");
		System.out.println(jsonMap);
		
		return service.deleteUser(jsonMap);
	}
	
}
