function Group(formId, formErrorSelectorIds ){
	this.formId = formId;
	this.formErrorSelectorIds = formErrorSelectorIds;
};


Group.prototype.addGroup = function(data, url,dialog, clearSelector, groupGrid, reloadUrl){
	
	this.isValid(data,url, dialog, clearSelector, groupGrid, reloadUrl);
};

Group.prototype.editGroup = function(){
	
};

Group.prototype.deleteGroup = function(){
	
};

Group.prototype.isValid = function(data, url, dialog, clearSelector, groupGrid, reloadUrl){
	if($("#"+this.formId).valid()) {
		$.ajax({
			type: "POST",
			url: url,
			contentType : 'application/json;charset=UTF-8', // 서버 요청시 전송할 데이터가 UTF-8 형식의 JSON 객체임을 명시
	 		data : JSON.stringify(data),
			dataType: "text",
			success: function (rslt_msg) {			
				if(rslt_msg != "false" && rslt_msg != ""){
					dialog.close();
					this.clearSelectorValue(clearSelector);
					groupGrid.reloadGrid(reloadUrl, data);
				}else{
					$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
				}
			},
			error: function (rslt_msg) {
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});			
			}
		});
	}else{
		str_msg = "Sum of tollgates do not match the quotation price.";
		$(this.formErrorSelectorIds).html(str_msg).show();
		setTimeout("$('"+this.formErrorSelectorIds+" ).hide(300)",5000);
	}
};

Group.prototype.formValidator = function(){
	if(this.getProjectListJoin() == "" && this.getUserListJoin() == ""){
		str_msg = "Sum of tollgates do not match the quotation price.";
		$(this.formErrorSelectorIds).html(str_msg).show();
		setTimeout("$('"+this.formErrorSelectorIds+" ).hide(300)",5000);
		return false;
	}
	return true;
};


Group.prototype.loadWpcList = function(flag, url, projectSelector, userSelector, inputProjectSelector, inputUserSelector   ){
	$.ajax({
		type: "POST",
		url: url,
		//data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			if (rslt_msg == "0") {
				//using json instead of 0 (success)
			} else if (rslt_msg == "1") {
				$.jGrowl("Data not processed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else if (rslt_msg == "2") {
				$.jGrowl("Session timed out. Try signing in again.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else if (rslt_msg == "3") {
				$.jGrowl("Failure in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else {
				$("#"+projectSelector+" option").remove();
				$("#"+userSelector+" option").remove();
				
				var epcSelectList = $("#sel_prjt_ctpt");
				var userSelectList = $("#sel_user_ctpt");
				
				
				
				var epcList = rslt_msg.epcList;
				var userList = rslt_msg.userList;
				
				var currentGroupEpcList = rslt_msg.currentGroupEpcList;
				var currentGroupUserList = rslt_msg.currentGroupUserList;
				
				
				if(epcList != undefined){				
					for(var i = 0; i < epcList.length; i ++){
						var groupId = epcList[i].model_id;
						//var groupName = epcList[i].model_name;					
						
						epcSelectList.append("<option value='" + groupId + "'>" + groupId + "</option>");
					}
				}
				
				if(userList != undefined){
				
					for(var i = 0; i < userList.length; i ++){
						var userId = userList[i].id;
						var userName = userList[i].user_name;					
						
						userSelectList.append("<option value='" + userId + "'>" + userName + " (" + userId + ")</option>");
					}
				}
				
				
				if(flag== "addGroup"){
					
					$("#"+projectSelector).multiSelect("refresh").multiSelect("deselect_all");
					//$("#sel_prjt_ctpt").multiSelect("deselect_all");
					
					$("#"+userSelector).multiSelect("refresh").multiSelect("deselect_all");
					//$("#sel_user_ctpt").multiSelect("deselect_all");
					
				}else{
					if(currentGroupEpcList != undefined){
						for(var j = 0; j < currentGroupEpcList.length; j ++){
							var currentGroupModelId = currentGroupEpcList[j].model_id;
							$("#" + projectSelector + " option[value='" + currentGroupModelId +"']").attr("selected", "selected");
						}
					}
					
					if(currentGroupUserList != undefined){
						for(var j = 0; j < currentGroupUserList.length; j ++){
							var currentGroupUserId = currentGroupUserList[j].id;
							var currentGroupUserName = currentGroupUserList[j].user_name;								
							$("#" + userSelector + " sel_user_ctpt option[value='" + currentGroupUserId +"']").attr("selected", "selected");
						}
					}
					
					$("#sel_prjt_ctpt").multiSelect("refresh");
					$("#sel_user_ctpt").multiSelect("refresh");
					
				}
				this.quickSearch(inputProjectSelector, projectSelector);
				this.quickSearch(inputUserSelector, userSelector);
				
				event.preventDefault();
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	});
};

Group.prototype.getProjectListJoin = function(){
	//var group_name = $(groupNameSelector).val();
	//selected 된 값을  가져 와서 , 를 붙임.  						
	var projectListJoin = $("#ms-sel_prjt_ctpt li.ms-elem-selection.ms-selected").map(function() {
			return this.children[0].innerHTML;
	}).get().join(",");
	return projectListJoin;
};

Group.prototype.getUserListJoin = function (){
	var userListJoin = $("#ms-sel_user_ctpt li.ms-elem-selection.ms-selected").map(function() {
		return this.id.replace("-selection","");
	}).get().join(",");
	return userListJoin;
};


Group.prototype.getSelectorValue = function(selector){
	 return $(selector).val();
};
Group.prototype.clearSelectorValue = function(selector){
	 $(selector).val("");
};
Group.prototype.quickSearch = function(inputSelector, focusSelector){
	$("#"+inputSelector).quicksearch($(".ms-elem-selectable", "#ms-"+focusSelector)).on("keydown", function(e){
		if (e.keyCode == 40){
			$(this).trigger("focusout");
			$("#"+focusSelector).focus();
			return false;
		}
	});
}