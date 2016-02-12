package com.latis.wpc.dao.group;

import java.util.ArrayList;
import java.util.HashMap;

import com.latis.wpc.dto.group.WpcGroup;
import com.latis.wpc.dto.group.WpcGroupGrant;

public interface GroupManageDao {
	public ArrayList<WpcGroup> loadGroupList();

	public WpcGroupGrant loadWpcList();
}
