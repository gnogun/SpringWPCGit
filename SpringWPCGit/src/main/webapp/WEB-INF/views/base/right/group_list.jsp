<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input id="contentNav" type="hidden" value="groupManage" />
	<div id="da-content-wrap" class="clearfix">
		<div id="da-content-area">
			<div class="row-fluid">
				<div class="span12">
					<div class="da-panel collapsible">
						<div class="da-panel-header">
							<span class="da-panel-title">
								<i class="icol-group"></i> Group List
							</span>
						</div>
						<form id="frm_group_search" name="frm_group_search" method="post" action="#" onsubmit="javascript:return false;">
							<div id="group_width" class="da-panel-content da-form-container da-form" style="border-bottom:none">
								<div class="da-form-row">
									<div class="da-form-item inline-form-right">
										<span>
											<input id="srch_group_kword" name="srch_group_kword" type="text" style="width:120px;" minlength="4" />
										</span>
										<span><img src="assets/images/bg/blank.png" width="4" height="1" /></span>
										<span>
											<button class="btn" onclick="javascript:srchGroup()">
												<i class="icon-search"></i>
												&nbsp;
												Search
											</button>
										</span>
									</div>
								</div>
							</div>
							<div class="da-form">
								<div style="width:100%;height:100%">
									<table id="group_grid"></table>
									<div id="group_grid_nav"></div>
								</div>
							</div>
							<div class="da-panel-content da-form-container da-form">
								<div class="da-form-row">
									<div class="da-form-item inline-form-right">
										<div class="btn-group" id="btns_group">
											<!-- <a class="btn" href="javascript:addGroup()"><i class="icol-add"></i> Add</a> -->
											<button class="btn" id="addGroup"><i class="icol-add"></i>Add</button>
											<a class="btn" href="javascript:editGroup('UPDATE')"><i class="icol-pencil"></i> Edit</a>
											<a class="btn" href="javascript:editGroup('DELETE')"><i class="icol-cross"></i> Delete</a>
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
<!-- Dialog - Add Project -->
<div id="dialog_add_group_div" class="da-panel-content da-form-container" style="display:none">
	<form id="frm_group" name="frm_group" class="da-form" method="post" action="#" onsubmit="javascript:return false">
		<div id="frm_group_error" class="da-message error" style="display:none;"></div>
		<div class="da-form-block">
			<div class="da-form-cols">
				<div class="da-form-row">
					<div class="da-form-cols">
						<div class="da-form-item col-6-8">
							<label class="da-form-label" style="cursor:default">Group Name<span class="required">*</span></label>
							<input type="text" id="group_name" name="group_name" required="true" minlength="4" maxlength="50"/>
							<input type="hidden" id="groupEditMode" />
						</div>
					</div>
				</div>
				<div class="da-form-row">
					<div class="da-form-cols">
						<div class="da-form-item col-6-12">
							<label class="da-form-label" style="cursor:default">WPC List</label>
							<select id="sel_prjt_ctpt" name="sel_prjt_ctpt" style="width:100%" multiple="multiple">
							</select>
						</div>						
						<div class="da-form-item col-6-12">
							<label class="da-form-label" style="cursor:default">All User List</label>
							<select id="sel_user_ctpt" name="sel_user_ctpt" style="width:100%" multiple="multiple">
							</select>
						</div>
					</div>
				</div>
			</div>				
		</div>
	</form>
</div>


<div id="dialog_confirm" style="display:none;">
	<p>&nbsp;</p>
	<p>Are you sure?</p>
	<p>&nbsp;</p>
</div>

<script type="text/javascript">
(function ($) {
	$(document).ready(function (e) {
		
		var groupGrid = gridInit();
		var group = new Group("frm_group","#frm_group_error,#frm_tab2_error,#frm_tab3_error");
		var dialog = setGroupDialog(groupGrid,group);
		
		
		setButtonListener(groupGrid, dialog, group);
		
		$("#sel_prjt_ctpt").multiSelect({
			selectableHeader: "<input type='text' id='srch_prjt_ctpt' autocomplete='off'/><p><img src='assets/images/bg/blank.png' height=10/></p>",
			selectionHeader: "<p>&nbsp;</p><p><img src='assets/images/bg/blank.png' height=10/></p>"
		});
		
		$("#sel_user_ctpt").multiSelect({
			selectableHeader: "<input type='text' id='srch_user_ctpt' autocomplete='off'/><p><img src='assets/images/bg/blank.png' height=10/></p>",
			selectionHeader: "<p>&nbsp;</p><p><img src='assets/images/bg/blank.png' height=10/></p>"
		});
		
		//showGrid();

	});
})(jQuery);


function setButtonListener(groupGrid, dialog, group){
	$("#addGroup").bind("click", function(){
		//srchUser();
		//id ,url, data
		// href="javascript:showAddUserDialog()"
		$("#groupEditMode").val("");
		
		group.loadWpcList("addGroup", "loadWpcList.do" , "sel_prjt_ctpt", "sel_user_ctpt", "srch_prjt_ctpt", "srch_user_ctpt");
		
	});
}

function setGroupDialog(groupGrid,group){
	var dialog = new Dialog();
	var buttonData = [{
		text: "Submit",
		click: function () {
			var str_msg = "Contact Administrator.";
			//var projectList =  group.getProjectListJoin();
			//var userList = group.getUserListJoin();
			if(group.formValidator() ){
				var str_data = {
						groupName: group.getSelectorValue("#dialog_add_group_div #group_name"),
						groupEditMode: group.getSelectorValue("#groupEditMode"), 
						selectedEpc: group.getProjectListJoin(),
						selectedUser: group.getUserListJoin()
					};
				group.addGroup(str_data, "addGroup",dialog, "#srch_group_kword", groupGrid, "groupList.do");
			}
			
		}
	},
	{
		text: "Close",
		click: function () {
			dialog.close();
		}
	}];
	
	dialog.makeDialog("dialog_add_group_div","Add Group",950,buttonData);
	return dialog;
}

function gridInit(){
	var groupGrid = new WpcGrid("group_grid", "groupList.do","user_grid_nav");
	
	var colNames = ["Group Name", "Group Create date", "Group Last modified date", "Creator"];
	
	var colModel = [
	    			{ name: "group_id", index: "group_id", width: 60, align: "center", sortable: true },
	    			{ name: "create_date", index: "last_modiefied_date", width: 30, align: "center", sortable: true },			
	    			{ name: "last_modiefied_date", index: "last_modiefied_date", width: 30, align: "center", sortable: true },
	    			{ name: "id", index: "id", width: 30, align: "center", sortable: true }
	    		];
	
	groupGrid.showGrid( colNames, colModel, "#group_width");
	
	
	var options =	{edit:false,add:false,del:false,
						beforeRefresh: function(){
							groupGrid.reloadGrid("groupList.do", null);
					        
				    	}
					};
	var searchOption = {	
	   		width:580,
	   		onSearch: function(){
	   			var column = $(".searchFilter .columns option:selected").val();
	   			var operator = $(".searchFilter .operators option:selected").val();
	   			var data = $(".searchFilter .data input").val();
	   			
	   			var rowlist = groupGrid.getRowDataList();
	   			for(var i = 0; i < rowlist.length; i ++){
	   				var row = rowlist[i];
	   				
	   				var targetData = row[column];
	   				
	   				if(operator == "eq"){
	   					if(data != targetData){
	   						groupGrid.removeRowGrid(i+1);
		   					//$('#group_grid').jqGrid('delRowData', i+1);
	   					}
	   				}else if(operator == "cn"){
	   					if(targetData.indexOf(data) < 0){
		   					//$('#group_grid').jqGrid('delRowData', i+1);
	   						groupGrid.removeRowGrid(i+1);
	   					}
	   				}
	   			}
	   		}
	   	};
	groupGrid.gridNav (options,null, null, null, searchOption);
	
	return groupGrid;
	
	
	
}

function showGrid() {

	var lastsel;
	var data = JSON.stringify({	protocolName: "group_grid_nav"});
	
	jQuery("#group_grid").jqGrid({
		url: "AjaxAction.latis",
		datatype: "json",
		mtype: "POST",
		ajaxRowOptions: { async: false },
		ajaxGridOptions: { contentType: "application/json; charset=utf-8" },
		postData: data,
		jsonReader: {
			page: "page",
			total: "total",
			root: "gridData",
			records: function (obj) { obj.length; },
			repeatitems: false,
			id: "user_seqn"
		},
		colNames: ["Group Name", "Group Create date", "Group Last modified date", "Creator"],
		colModel: [
			{ name: "group_id", index: "group_id", width: 60, align: "center", sortable: true },
			{ name: "create_date", index: "last_modiefied_date", width: 30, align: "center", sortable: true },			
			{ name: "last_modiefied_date", index: "last_modiefied_date", width: 30, align: "center", sortable: true },
			{ name: "id", index: "id", width: 30, align: "center", sortable: true }
		],
		sortable : true,
		autowidth: true,
		caption: "",	//table title
		deepempty: true,
		editurl: "",
		gridComplete: function () {
			var ids = jQuery("#group_grid").jqGrid("getDataIDs");
			var v_btn = "";
			for (var i = 0; i < ids.length; i++) {
				var sel_val = jQuery("#group_grid").jqGrid("getRowData", ids[i]);
				var group_id = sel_val.group_id;
				v_btn = "<span id='btn_edit_" + group_id + "' ><a href=\"javascript:showGroupInfo('" + group_id + "')\"><i class='icon-circle-info'></i></a></span>";
				jQuery("#group_grid").jqGrid("setRowData", ids[i], {action: v_btn});
			}
		},
		grouping: false,
		height: "100%",
		loadonce: true,
		pager: "#group_grid_nav",
		rownumbers: true,
		rowNum: 20,
		rowList: [10, 20, 30, 50],
		scrollOffset: 0,
		shrinkToFit: false,
		sortorder: "desc",
		viewrecords: true
	});

	jQuery("#group_grid").jqGrid(
		"navGrid",
		"#group_grid_nav",
		{edit:false,add:false,del:false,
			beforeRefresh: function(){
		        jQuery("#group_grid").jqGrid('setGridParam',
    			 {
    			 	url : "AjaxAction.latis",
		        	datatype: "json",
		        	mtype: "POST",
		        	postData: data,
					page: 1
    			 }).trigger('reloadGrid');
	    	}
		},
		{},
		{},
	   	{},
	   	{	
	   		width:580,
	   		onSearch: function(){
	   			var column = $(".searchFilter .columns option:selected").val();
	   			var operator = $(".searchFilter .operators option:selected").val();
	   			var data = $(".searchFilter .data input").val();
	   			
	   			var rowlist = jQuery("#group_grid").jqGrid('getRowData');
	   			for(var i = 0; i < rowlist.length; i ++){
	   				var row = rowlist[i];
	   				
	   				var targetData = row[column];
	   				
	   				if(operator == "eq"){
	   					if(data != targetData){
		   					$('#group_grid').jqGrid('delRowData', i+1);
	   					}
	   				}else if(operator == "cn"){
	   					if(targetData.indexOf(data) < 0){
		   					$('#group_grid').jqGrid('delRowData', i+1);
	   					}
	   				}
	   			}
	   		}
	   	}
	);

	

	//jQuery("#group_grid").hideCol("user_seqn");

	$(window).bind("resize", function () {
		jQuery("#group_grid").setGridWidth($("#group_width").width(), true);
		//$("#group_grid").closest(".ui-jqgrid-bdiv").width($("#group_grid").closest(".ui-jqgrid-bdiv").width());
	}).trigger("resize");

	$("#user_grid_rn").css("width", "23px");
}






function editGroup(proc_kind) {

	//select grid check
	var id = jQuery("#group_grid").jqGrid("getGridParam", "selrow");

	if(id) {	
		var list = $("#group_grid").getRowData( id );
		//reset field
		document.frm_group.reset();
		
		$("#dialog_add_group_div input#group_name").val(list.group_id);
		
		var list = $("#group_grid").getRowData( id );

		$("#groupEditMode").val(proc_kind);

		if (proc_kind == "UPDATE") {

			//"A" is not allowed
			var str_data = JSON.stringify({
				protocolName : "loadEditGroupEpcList",
				groupId : list.group_id				
			});
			
			$.ajax({
				type: "POST",
				url: "AjaxAction.latis",
				data: str_data,
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
						$("#sel_prjt_ctpt option").remove();
						
						var ownEpcList = rslt_msg.ownEpcList;
						var currentGroupEpcList = rslt_msg.currentGroupEpcList;
						
						var epcSelectList = $("#sel_prjt_ctpt");
						for(var i = 0; i < ownEpcList.length; i ++){
							var ownModelId = ownEpcList[i].model_id;
							epcSelectList.append("<option value='" + ownModelId + "'>" + ownModelId + "</option>");
						}
						
						for(var j = 0; j < currentGroupEpcList.length; j ++){
							var currentGroupModelId = currentGroupEpcList[j].model_id;
							$("#sel_prjt_ctpt option[value='" + currentGroupModelId +"']").attr("selected", "selected");
						}
						
						$("#sel_prjt_ctpt").multiSelect("refresh");
						//$("#sel_prjt_ctpt").multiSelect("deselect_all");
						
						$("#srch_prjt_ctpt").quicksearch($(".ms-elem-selectable", "#ms-sel_prjt_ctpt")).on("keydown", function(e){
							if (e.keyCode == 40){
								$(this).trigger("focusout");
								$("#sel_prjt_ctpt").focus();
								return false;
							}
						});
						
						$("#sel_user_ctpt option").remove();
				
						var userArray = rslt_msg.userArray;
						var currentGroupUserArray = rslt_msg.currentGroupUserArray;
						
						var userSelectList = $("#sel_user_ctpt");
						
						for(var i = 0; i < userArray.length; i ++){
							var userId = userArray[i].id;
							var userName = userArray[i].user_name;
							userSelectList.append("<option value='" + userId + "'>" + userName + " (" + userId + ")</option>");
							
						}
						
						for(var j = 0; j < currentGroupUserArray.length; j ++){
							var currentGroupUserId = currentGroupUserArray[j].id;
							var currentGroupUserName = currentGroupUserArray[j].user_name;								
							$("#sel_user_ctpt option[value='" + currentGroupUserId +"']").attr("selected", "selected");
						}
						
						$("#sel_user_ctpt").multiSelect("refresh");
						//$("#sel_prjt_ctpt").multiSelect("deselect_all");
						
						$("#srch_user_ctpt").quicksearch($(".ms-elem-selectable", "#ms-sel_user_ctpt")).on("keydown", function(e){
							if (e.keyCode == 40){
								$(this).trigger("focusout");
								$("#sel_user_ctpt").focus();
								return false;
							}
						});
									
						event.preventDefault();
					}
				},
				error: function (rslt_msg) {
					$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
				}
			});
			var v_dialog_title = "Edit Group";
			$("#dialog_add_group_div").dialog("option", { title: v_dialog_title, modal: true }).dialog("open");
		} else {
			//delete
			//really delete? dialog
			$("#dialog_confirm").dialog({
				title: "Delete Group",
				autoOpen: true,
				width: "300",
				resizable: true,
				modal: true,
				buttons: {
					"Confirm": function() {
						//window close
						$("#dialog_confirm").dialog("close");
						//ajax
						var str_data = JSON.stringify({
							protocolName: "deleteGroup",							
							groupName: list.group_id
						});
						
						
						$.ajax({
							type: "POST",
							url: "AjaxAction.latis",
							data: str_data,
							dataType: "text",
							success: function (rslt_msg) {
								if (rslt_msg == "0") {
									
								} else if(rslt_msg == "1") {
									$.jGrowl("Data not processed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
								} else if(rslt_msg == "2") {
									$.jGrowl("Session timed out. Try signing in again.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
								} else {
									$.jGrowl("Failure in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
								}								
								reloadGrid();
							},
							error: function (rslt_msg) {
								$.jGrowl("Error in asdf" + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
							}
						});
					},
					Cancel: function() {
						$("#dialog_confirm").dialog("close");
					}
				}
			});
		}
	} else {
		$.jGrowl("<p>&nbsp;</p><p align=center>Select group.</p>", {life: 5000,position: "bottom-right",theme: "ylow_beware2"});
	}
}



function editGroupUser(groupId){
	$("#dialog_add_user_div #group_name").val(groupId);
	
	var str_data = JSON.stringify({
		protocolName : "loadCurrentGroupUserList",
		groupId : groupId	
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
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
				$("#sel_user_ctpt option").remove();
				
				var userArray = rslt_msg.userArray;
				var currentGroupUserArray = rslt_msg.currentGroupUserArray;
				
				var wholeList = $("#sel_user_ctpt");
				for(var i = 0; i < userArray.length; i ++){
					var userId = userArray[i].id;
					var userName = userArray[i].user_name;
					
					wholeList.append("<option value='" + userId + "'>" + userName + " (" + userId + ")</option>");
					
				}
				
				for(var j = 0; j < currentGroupUserArray.length; j ++){
					var currentGroupUserId = currentGroupUserArray[j].id;
					var currentGroupUserName = currentGroupUserArray[j].user_name;								
					$("#sel_user_ctpt option[value='" + currentGroupUserId +"']").attr("selected", "selected");
				}
				
				$("#sel_user_ctpt").multiSelect("refresh");
				//$("#sel_prjt_ctpt").multiSelect("deselect_all");
				
				$("#srch_user_ctpt").quicksearch($(".ms-elem-selectable", "#ms-sel_user_ctpt")).on("keydown", function(e){
					if (e.keyCode == 40){
						$(this).trigger("focusout");
						$("#sel_user_ctpt").focus();
						return false;
					}
				});
							
				event.preventDefault();
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	});
	
	$("#dialog_add_user_div").dialog({
			autoOpen: true,
			title: "Group Member",
			modal: true,
			width: "450",
			buttons: [{
				text: "Submit",
				click: function () {
					var str_msg = "Contact Administrator.";
					//validate form
					$("#frm_group").submit();
					//not display required field msg
					if($("#frm_group").valid()) {
						var group_name = $("#dialog_add_user_div #group_name").val();						
						var v_user_ctpt = $("#ms-sel_user_ctpt li.ms-elem-selection.ms-selected").map(function() {
								return this.id.replace("-selection","");
						}).get().join(",");
						
						if(v_user_ctpt != ""){
							var str_data = {
								protocolName: "editGroupMember",																						
								groupName: group_name,
								selectedUser: v_user_ctpt						
							};
							
							$.ajax({
								type: "POST",
								url: "AjaxAction.latis",
								contentType : 'application/json;charset=UTF-8', // 서버 요청시 전송할 데이터가 UTF-8 형식의 JSON 객체임을 명시
						 		data : JSON.stringify(str_data),
								dataType: "text",
								success: function (rslt_msg) {			
									if(rslt_msg != "false" && rslt_msg != ""){
										$("#dialog_add_user_div").dialog("close");
										reloadGrid();
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
							$("#frm_group_error,#frm_tab2_error,#frm_tab3_error").html(str_msg).show();
							setTimeout("$('#frm_group_error,#frm_tab2_error,#frm_tab3_error').hide(300)",5000);
						}
						
					}else{
						str_msg = "Sum of tollgates do not match the quotation price.";
						$("#frm_group_error,#frm_tab2_error,#frm_tab3_error").html(str_msg).show();
						setTimeout("$('#frm_group_error,#frm_tab2_error,#frm_tab3_error').hide(300)",5000);
					}				
				}
			},
			{
				text: "Close",
				click: function () {
					$("#dialog_add_user_div").dialog("close");
				}
			}],
			close: function( event, ui ) {
				$("#dialog_add_user_div").dialog("close");
			}
		});
}

function showGroupGridWaringGrowl(){
	$.jGrowl("You must select group in Group Grid.", {header: "Select group.", position: "bottom-right",theme: "ylow_error1"});
}
</script>