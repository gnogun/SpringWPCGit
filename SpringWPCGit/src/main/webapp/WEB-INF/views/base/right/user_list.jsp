<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input id="contentNav" type="hidden" value="userManage" />
			<div id="da-content-wrap" class="clearfix">
				<div id="da-content-area">
					<div class="row-fluid">		
						<div class="span12">
							<div class="da-panel collapsible">
								<div class="da-panel-header">
									<span class="da-panel-title">
										<i class="icol-user-business">
										</i>
										User List
									</span>									
								</div>
								<form id="frm_user_search" name="frm_user_search" method="post" action="#" onsubmit="javascript:return false;">
									<div id="user_width" class="da-panel-content da-form-container da-form" style="border-bottom:none">
										<div class="da-form-row">
											<div class="da-form-item inline-form-right">
												<span>												
													<select id="searchUserFilter" name="searchUserFilter" style="width:200px">
														<option value="id">ID</option>
														<option value="user_name">User Name</option>
														<option value="title">Title</option>
														<option value="department">Department</option>
														<option valye="manage_auth">Manage Auth</option>
													</select>
												</span>
												<span><img src="assets/images/bg/blank.png" width="10" height="1" /></span>
												<span>
													<input id="srch_user_kword" name="srch_user_kword" type="text" required="true" style="width:120px;" minlength="2" />
												</span>
												<span><img src="assets/images/bg/blank.png" width="4" height="1" /></span>
												<span>
													<button id="searchUserButton" class="btn"><i class="icon-search"></i>&nbsp;
														Search
													</button>
												</span>
												<span>
													<button id="reloadGridButton" class="btn"><i class="icon-repeat"></i>&nbsp;
														Cancel
													</button>
												</span>
											</div>
										</div>
									</div>
									<div class="da-form">
										<div style="width:100%;height:100%">
											<table id="user_grid"></table>
											<div id="user_grid_nav"></div>
										</div>
									</div>
									<div class="da-panel-content da-form-container da-form">
										<div class="da-form-row">
											<div class="da-form-item inline-form-right">
												<div class="btn-group" id="btns_user">
													<button id="addUser" class="btn"><i class="icol-add"></i> Add</button>
													<button id="editUser" class="btn"><i class="icol-pencil"></i> Edit</a></button>
													<button id="deleteUser" class="btn"><i class="icol-cross"></i> Delete</a></button>
													<!-- <a class="btn" href="javascript:showDeleteConfirmDialog()"><i class="icol-cross"></i> Delete</a> -->
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>


<div id="dialog_confirm" style="display:none;">
	<p>&nbsp;</p>
	<p>Are you sure?</p>
	<p>&nbsp;</p>
</div>

<script type="text/javascript">
(function ($) {
	$(document).ready(function (e) {		
		var currentGrid = gridInit();
		
		var user = new User(["#phone, #mobile"],"userForm","userFormError","dialog_confirm");
		
		var userDialog = setUserDialog(currentGrid, user);
		var confirmDialog = setConfirmDialog(currentGrid, user);
		
		setButtonListener(currentGrid,  userDialog, confirmDialog, user);
	
	});
})(jQuery);

function gridInit(){
	var userGrid = new WpcGrid("user_grid", "userList.do","user_grid_nav");
	
	var colNames = ["ID", "Name", "Mail", "Phone", "Mobile", "Title", "Department", "Manage Auth"];
	
	var colModel = [			
	    			{ name: "id", index: "id", width: 80, align: "center", sortable: true },
	    			{ name: "user_name", index: "user_name", width: 80, align: "center", sortable: true },
	    			{ name: "mail", index: "mail", width: 120, align: "center", sortable: true },
	    			{ name: "phone", index: "phone", width: 100, align: "center", sortable: true },
	    			{ name: "mobile", index: "mobile", width: 80, align: "center", sortable: true },
	    			{ name: "title", index: "title", width: 80, align: "center", sortable: true},
	    			{ name: "department", index: "department", width: 90, align: "center", sortable: true },
	    			{ name: "manage_auth", index: "manage_auth", width: 60, align: "center", sortable: true, formatter: manageAuthFormatter }			
	    		];
	
	userGrid.showGrid( colNames, colModel, ".da-panel");
	
	return userGrid;
}

function manageAuthFormatter ( cellvalue, options, rowObject ) {
	var returnVal = "";
	
	if(cellvalue == "a"){
		returnVal = "Admin";
	}else if(cellvalue == "s"){
		returnVal = "Super User";
	}else if(cellvalue == "u"){
		returnVal = "User";
	}
	
	return returnVal;
}

function setButtonListener(currentGrid, userDialog, confirmDialog,  user){
	
	
	$("#searchUserButton").bind("click", function(){
		
		
		var data = JSON.stringify({
			filter: $("#searchUserFilter").val(),
			keyword: $("#srch_user_kword").val()
		});
		currentGrid.reloadGrid("searchUser.do", data);
		
	});
	
	$("#reloadGridButton").bind("click", function(){
		//srchUser();
		//id ,url, data
		$("#srch_user_kword").val("");
		currentGrid.reloadGrid("userList.do","");
		
	});
	
	
	$("#addUser").bind("click", function(){
		//srchUser();
		//id ,url, data
		// href="javascript:showAddUserDialog()"
		var input = $("#dialog_profile_div input");
		$("input#id").attr("disabled", false);
		for(var i = 0; i < input.length; i ++){
			input[i].value = "";
		}
		
		userDialog.setSelectBoxDefaultValue("manage_auth");
		userDialog.dialogOpen();
		
		
	});
	
	
	$("#editUser").bind("click", function(e){
		var list = currentGrid.getCurrentRowData();
		if(list != null || list != undefined){
			userDialog.setData(list, "manage_auth");
			userDialog.dialogOpen();
			
		}
	});
	$("#deleteUser").bind("click", function(e){
		
		var selectedGridRowId = currentGrid.getCurrentRowData().id;
		//var selectedGridRowId = $("#user_grid").getGridParam( "selrow" );	
		if(selectedGridRowId != null){
			confirmDialog.dialogOpen();
		}else{
			//showUserGridWaringGrowl();
			$.jGrowl("You must select user in User Grid.", {header: "Select user.", position: "bottom-right",theme: "ylow_error1"});
		}
		
		
	});
}



function setUserDialog(currentGrid, user){
	
	var dialog = new Dialog();
	var buttonData = [{
		text: "Submit",
		click: function () {
			var str_data = {
					//protocolName: 'editUser',
					id: $("input#id").val(),
					pwd: $("input#pwd").val(),
					user_name: $("input#user_name").val(),
					mail: $("input#mail").val(),
					phone: $("input#phone").val(),
					mobile: $("input#mobile").val(),
					title: $("input#title").val(),
					department: $("input#department").val(),
					manage_auth: $("#manage_auth").val()
			};
			if($("#dialog_profile_div input#id").attr("disabled") == "disabled"){
				user.editUser(str_data, "editUser.do",currentGrid, "userList.do" );
			}else{
				//jsonData,url,gridObject,reloadUrl
				user.addUser(str_data, "addUser.do", currentGrid, "userList.do" );
			}
		}
	},
	{
		text: "Close",
		click: function () {
			$("#dialog_profile_div").dialog("close");
		}
	}];
	dialog.makeDialog("dialog_profile_div","Add User",440,buttonData);
	
	return dialog;
}
	
function setConfirmDialog(currentGrid, user){
	var dialog = new Dialog();
	
	var buttonData =[{
        text: "Submit",
        click: function () {  
        	var str_data = {
                    id: currentGrid.getCurrentRowData().id
                };
            user.deleteUser(str_data, "deleteUser.do",currentGrid, "userList.do");
        }
    },
    {
        text: "Close",
        click: function () {
            $("#dialog_confirm").dialog("close");
        }
    }];
	dialog.makeDialog("dialog_confirm","Delete User",440,buttonData);
	
	return dialog;
}



</script>