package com.latis.wpc.service.group;

import java.util.ArrayList;

import com.latis.wpc.dto.group.WpcGroup;
import com.latis.wpc.dto.group.WpcGroupGrant;

public interface GroupManageService {
	public ArrayList<WpcGroup> loadGroupList();

	public WpcGroupGrant loadWpcList();
	
}
