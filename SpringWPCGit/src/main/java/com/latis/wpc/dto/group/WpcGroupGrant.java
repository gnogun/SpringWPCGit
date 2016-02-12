package com.latis.wpc.dto.group;

import java.util.ArrayList;

public class WpcGroupGrant {
	
	private ArrayList<String> allWpcList;
	private ArrayList<String> currentGroupWpcList;
	
	private ArrayList<String> allUserList;
	private ArrayList<String> currentUserList;
	
	
	public ArrayList<String> getAllWpcList() {
		return allWpcList;
	}
	public void setAllWpcList(ArrayList<String> allWpcList) {
		this.allWpcList = allWpcList;
	}
	public ArrayList<String> getCurrentGroupWpcList() {
		return currentGroupWpcList;
	}
	public void setCurrentGroupWpcList(ArrayList<String> currentGroupWpcList) {
		this.currentGroupWpcList = currentGroupWpcList;
	}
	public ArrayList<String> getAllUserList() {
		return allUserList;
	}
	public void setAllUserList(ArrayList<String> allUserList) {
		this.allUserList = allUserList;
	}
	public ArrayList<String> getCurrentUserList() {
		return currentUserList;
	}
	public void setCurrentUserList(ArrayList<String> currentUserList) {
		this.currentUserList = currentUserList;
	}
	
	
	
}
