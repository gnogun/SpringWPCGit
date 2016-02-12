<%@ page language="java" contentType="text/html;charset=utf-8"%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]><html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]><html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en" xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<!--meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/-->
<!--meta charset="utf-8"-->
<meta http-equiv="Content-Language" content="en" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="description" content="Service WPC"/>
<meta name="author" content="Latisglobal.com"/>
<!-- Bootstrap Stylesheet -->
<link href="../bootstrap/css/bootstrap.min.css" media="screen" rel="stylesheet" type="text/css" />
<!-- Theme Stylesheet -->
<link href="../assets/css/dandelion.theme.css" media="screen" rel="stylesheet" type="text/css" />
<!-- Icon Stylesheet -->
<link href="../assets/css/fonts/glyphicons/style.css" media="screen" rel="stylesheet" type="text/css" />
<!-- Main Stylesheet -->
<link href="../assets/css/dandelion.css" media="screen" rel="stylesheet" type="text/css" />
<link href="../assets/css/dandelion.min.css" media="screen" rel="stylesheet" />
<!-- Demo Stylesheet -->
<link href="../assets/css/demo.css" media="screen" rel="stylesheet" type="text/css" />
<!-- Plugin Stylesheet -->
<link href="../assets/js/plugins/wizard/dandelion.wizard.css" media="screen" rel="stylesheet" type="text/css" />
<!-- JS Libs -->
<!-------Â°ï¿½S Script Â½ÄÍÙ­------------>
<!-- JS Libs -->
<script src="../assets/js/libs/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="../assets/jui/js/jquery-ui-1.10.4.custom.js" type="text/javascript"></script>
<script src="../assets/js/libs/jquery.placeholder.min.js" type="text/javascript"></script>
<script src="../assets/js/libs/jquery.mousewheel.min.js" type="text/javascript"></script>

<!-- JS Bootstrap -->
<script src="../bootstrap/js/bootstrap.min.js" type="text/javascript"></script>

<!-- jQuery-UI JavaScript Files -->
<script src="../assets/jui/jquery.ui.timepicker.min.js" type="text/javascript"></script>
<script src="../assets/jui/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<script src="../assets/jui/js/globalize/globalize.js" type="text/javascript"></script>
<script src="../assets/jui/js/globalize/cultures/globalize.culture.en-US.js" type="text/javascript"></script>
<link rel="stylesheet" href="../assets/jui/css/jquery.ui.all.css" media="screen" type="text/css"/>

<!-- JS Plugins -->
<!-- Autosize Plugin -->
<script src="../plugins/autosize/jquery.autosize.min.js" type="text/javascript"></script>

<!-- DataTables Plugin (not using)-->
<!--script src="plugins/datatables/jquery.dataTables.min.js" type="text/javascript"></script-->

<!-- iButton Plugin -->
<script src="../plugins/ibutton/jquery.ibutton.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../plugins/ibutton/jquery.ibutton.css" media="screen" type="text/css"/>

<!-- FilInput Plugin (not using) -->
<!-- script src="assets/js/plugins/fileinput/jquery.fileinput.js" type="text/javascript"></script -->

<!-- File Upload -->
<script src="../assets/js/plugins/upload/jquery.ui.widget.js"></script>
<script src="../assets/js/plugins/upload/jquery.iframe-transport.js"></script>
<script src="../assets/js/plugins/upload/jquery.fileupload.js"></script>
<link rel="stylesheet" href="../assets/css/dropzone.css" media="screen" type="text/css"/>

<!-- EasyTree -->
<script src="../assets/js/plugins/treeview/jquery.easytree.js"></script>
<link rel="stylesheet" href="../assets/js/plugins/treeview/skin-win7/ui.easytree.css" media="screen" type="text/css"/>

<!-- ContextMenu -->
<script src="../assets/js/plugins/context/jquery.contextmenu.js"></script>
<link rel="stylesheet" href="../assets/js/plugins/context/css/contextmenu.css" media="screen" type="text/css"/>

<!-- Spin -->
<script src="../assets/js/plugins/spin/spin.js"></script>


<!-- Flot Plugin -->
<!--[if lt IE 9]>
<script src="../assets/js/libs/excanvas.min.js" type="text/javascript"></script>
<![endif]-->
<script src="../plugins/flot/jquery.flot.min.js" type="text/javascript"></script>
<script src="../plugins/flot/plugins/jquery.flot.tooltip.min.js" type="text/javascript"></script>
<script src="../plugins/flot/plugins/jquery.flot.resize.min.js" type="text/javascript"></script>

<!-- Select2 Plugin -->
<script src="../plugins/select2/select2.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../plugins/select2/select2.css" media="screen" type="text/css"/>

<!-- Validation Plugin -->
<script src="../plugins/validate/jquery.validate.js" type="text/javascript"></script>

<!-- jGrowl Plugin -->
<script src="../plugins/jgrowl/jquery.jgrowl.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="../plugins/jgrowl/jquery.jgrowl.css" media="screen" type="text/css"/>

<!-- user script (symbol check)-->
<script src="../plugins/validate/jquery.validate.user.js" type="text/javascript"></script>
<script src="../assets/jui/jquery.ui.datepicker.validation.min.js" type="text/javascript"></script>

<!-- Wizard Plugin -->
<script src="../assets/js/plugins/wizard/dandelion.wizard.min.js" type="text/javascript"></script>
<script src="../assets/js/libs/jquery.form.min.js" type="text/javascript"></script>

<!-- Multi Select -->
<script src="../assets/js/plugins/picklist/jquery.multi-select.js" type="text/javascript"></script>
<script src="../assets/js/plugins/picklist/jquery.quicksearch.js" type="text/javascript"></script>

<link rel="stylesheet" href="../assets/js/plugins/picklist/multi-select.css" media="screen" type="text/css"/>

<!-- JS Template -->
<script src="../assets/js/core/dandelion.core.js" type="text/javascript"></script>

<!-- JS Customizer -->
<script src="../assets/js/core/dandelion.customizer.js" type="text/javascript"></script>

<!-- number currency formatter -->
<!--script src="plugins/autonumeric/jquery.number.min.js" type="text/javascript"></script-->
<script src="../plugins/autonumeric/jquery.autonumeric.min.js" type="text/javascript"></script>

<!-- mask -->
<script src="../plugins/autonumeric/jquery.mask.min.js" type="text/javascript"></script>

<!-- yellow user -->
<script src="../assets/js/plugins/yellow/yellow.user.js" type="text/javascript"></script>
<!-------Â°ï¿½S Script Â²ï¿½------------>

<!------- jqGrid -------->
<script src="../js/grid.locale-en.js" type="text/javascript"></script>
<script src="../js/jquery.jqGrid.js" type="text/javascript"></script>
<script src="../js/class/GridClass.js" type="text/javascript"></script>
<script src="../js/class/CustomDialog.js" type="text/javascript"></script>
<script src="../js/class/User.js" type="text/javascript"></script>
<script src="../js/class/Group.js" type="text/javascript"></script>

<!-- Grid Stylesheet  -->
<link href="../assets/jui/css/addon/ui.jqgrid.css" media="screen" rel="stylesheet" type="text/css" />
<!-- Fullcalendar Plugin -->
<script src="../plugins/fullcalendar/fullcalendar.min.js" type="text/javascript"></script>
<script src="../plugins/fullcalendar/gcal.js" type="text/javascript"></script>
<link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.css" media="screen" type="text/css"/>
<link rel="stylesheet" href="../plugins/fullcalendar/fullcalendar.print.css" media="print" type="text/css"/>

<title>Service WPC</title>

<script type="text/javascript">
function goLogout() {	
	var str_data = {
		protocolName:'logOut',
	};
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		contentType : 'application/json;charset=UTF-8', // ìë² ìì²­ì ì ì¡í  ë°ì´í°ê° UTF-8 íìì JSON ê°ì²´ìì ëªì
 		data : JSON.stringify(str_data),
		dataType: "text",
		success: function (rslt_msg) {				
			if (rslt_msg == "true") {		
				window.location.href = "index.html";
			} else if(rslt_msg == "false") {
				$.jGrowl("Error in 'not login'.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
				$("#dialog_login_div").dialog("option", { modal: true }).dialog("open");
			} else {
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});			
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
		}
	});
}


</script>

<script type="text/javascript">
(function ($) {
	$(document).ready(function (e) {
		//getUseInfo();
		//selMenuBold();
	/*
		$("#dialog_password_div").dialog({
			autoOpen: false,
			title: "Change Password",
			modal: true,
			width: "440",
			buttons: [{
				text: "Submit",
				click: function () {

					$("#frm_pswd").submit();
					//not display required field msg
					if($("#frm_pswd").valid()) {

						var str_data = {
							proc_kind: "P",							
							curr_pswd: $("#curr_pswd").val(),
							new_pswd: $("#new_pswd").val(),
							cnfm_pswd: $("#cnfm_pswd").val()
						};
						
					}//end of if valid()
				}
			},
			{
				text: "Close",
				click: function () {
					$("#dialog_password_div").dialog("close");
				}
			}]
		});

		$("#frm_pswd").validate({
			errorPlacement: $.datepicker.errorPlacement,
			rules: {
				curr_pswd: {
					required: true,
					skip_or_fill_minimum: [3,".pswdgroup"]
				},
				new_pswd: {
					required: true,
					skip_or_fill_minimum: [3,".pswdgroup"]
				},
				cnfm_pswd: {
					required: true,
					equalTo: "#new_pswd",
					skip_or_fill_minimum: [3,".pswdgroup"]
				},

			}
		});
		*/
		/*
		$("#dialog_profile_div").dialog({
			autoOpen: false,
			title: "View Profile",
			modal: true,
			width: "760",
			buttons: [{
				id: "btn_pf_submit",
				text: "Submit",
				click: function () {
					editUser();
				}
			},
			{
				text: "Close",
				click: function () {
					$("#dialog_profile_div").dialog("close");
				}
			}]
		});
		*/
		/*
		$("#dialog_login_div").dialog({
			autoOpen: false,
			title: "Login",
			modal: true,
			width: "300",
			buttons: [{
				text: "Login",
				click: function () {
					popup_reLogin();
				}
			},
			{
				text: "Close",
				click: function () {
					$("#dialog_login_div").dialog("close");
				}
			}]
		});
		*/
		//$("#da-sidebar, #da-sidebar-separator").hide();
		//$("#da-content-wrap").css("margin-left", "0px");
		

	});
})(jQuery);

var opts = {
	lines: 13, // The number of lines to draw
  	length: 20, // The length of each line
	width: 10, // The line thickness
	radius: 30, // The radius of the inner circle
	corners: 1, // Corner roundness (0..1)
	rotate: 0, // The rotation offset
	direction: 1, // 1: clockwise, -1: counterclockwise
	color: '#000', // #rgb or #rrggbb
	speed: 1, // Rounds per second
	trail: 60, // Afterglow percentage
	shadow: false, // Whether to render a shadow
	hwaccel: false, // Whether to use hardware acceleration
	className: 'spinner', // The CSS class to assign to the spinner
	zIndex: 2e9, // The z-index (defaults to 2000000000)
	top: 'auto', // Top position relative to parent in px
	left: 'auto' // Left position relative to parent in px
};
/*
function getUseInfo(){
	var str_data = JSON.stringify({
		protocolName: "getUseInfo"
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			//rslt_msg is result & json
			if(rslt_msg != "false"){
				var userId = rslt_msg.userId;
				var userName = rslt_msg.userName;
				var title = rslt_msg.userTitle;
				var deparment = rslt_msg.userDepartment;
				var userPermission = rslt_msg.userPermission;
				
				if(userPermission == "u"){
					$("#da-sidebar, #da-sidebar-separator").hide();
					$("#da-content-wrap").css("margin-left", "0px");
					
					userPermission = "User";
				} else if(userPermission == "a"){
					userPermission = "Admin";
				} else if(userPermission == "s"){
					userPermission = "Super user";
				}
				
				
				$("#da-user-info #header_name").text(userName + " (" + userId + ")");
				$("#da-user-info #header_cmpn").text(userPermission);
				
			}else{
				$.jGrowl("Error in 'not login'.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
				$("#dialog_login_div").dialog("option", { modal: true }).dialog("open");
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	});
}
*/
/*
function chngPswd() {
	document.frm_pswd.reset();
	$("#dialog_password_div").dialog("option", { modal: true }).dialog("open");
}

function selMenuBold() {
	
	var contentNav = $("#contentNav").val();
	
	$("#side_" + contentNav).addClass("active");
	$("#navi_" + contentNav).show();
	
}

function showProfileDialog(){
	var str_data = JSON.stringify({
		protocolName: "getUseInfo"
	});
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			//rslt_msg is result & json
			if(rslt_msg != "false"){
				$("#dialog_profile_div input#id").val(rslt_msg.userId);
				$("#dialog_profile_div input#id").attr("disabled",true);
				$("#dialog_profile_div input#user_name").val(rslt_msg.userName);
				$("#dialog_profile_div input#mail").val(rslt_msg.userMail);
				$("#dialog_profile_div input#phone").val(rslt_msg.userPhone);
				$("#dialog_profile_div input#mobile").val(rslt_msg.userMobile);
				$("#dialog_profile_div input#title").val(rslt_msg.userTitle);
				$("#dialog_profile_div input#department").val(rslt_msg.userDepartment);
				
				$("#manage_auth").select2().select2("val", rslt_msg.userPermission);
				if(rslt_msg.userPermission == 'u'){
					$("#manage_auth").attr("disabled",true);
				}
				
				$("#dialog_profile_div").dialog("open");
				
				maskTP($("#userForm input#phone"));
				maskTP($("#userForm input#mobile"));
				
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	});
}
*/
/*
function editUser(){
	$("#phone, #mobile").unmask();
	
	maskTP($("#userForm input#phone"));
	maskTP($("#userForm input#mobile"));
	
	if($("#userForm").valid()){
		var str_data = {
			protocolName: 'editUser',
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
		
		$.ajax({
			type: "POST",
			url: "AjaxAction.latis",
			contentType : 'application/json;charset=UTF-8', // 서버 요청시 전송할 데이터가 UTF-8 형식의 JSON 객체임을 명시
	 		data : JSON.stringify(str_data),
			dataType: "text",
			success: function (rslt_msg) {			
				if(rslt_msg != "false" && rslt_msg != ""){
					$("#dialog_profile_div").dialog("close");
					reloadGrid();
				}else{
					$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
				}
			},
			error: function (rslt_msg) {		
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});			
			}
		});
	}	
}

function maskTP(inputElem) {
	var v_len = inputElem.val().length;
	if(v_len < 10){
		inputElem.mask("99) 999-9999");
	}else if(v_len == 10){
		inputElem.mask("999) 999-9999");
	}else{
		inputElem.mask("999) 9999-9999");
	}
}
*/
function popup_reLogin() {
	var dialog_user_usid = $("#dialog_user_usid").val();
	var dialog_user_uspswd = $("#dialog_user_uspwd").val();
	var dialog_user_rmbr = "false";
	
	if($("input[name='dialog_user_rmbr']").is(':checked')){
		dialog_user_rmbr = "true";
	}

	var str_data = {
		protocolName:'isValidAccount',
		userid : dialog_user_usid,
		password : dialog_user_uspswd,
		rememberChk : dialog_user_rmbr
	};
		
	var str_msg = "";
	if($("#loginForm").valid()) {
		
		$.ajax({
			type: "POST",
			url: "AjaxAction.latis",
			contentType : 'application/json;charset=UTF-8', // ���� ��û�� ����� �����Ͱ� UTF-8 ����� JSON ��ü��; ���
  			data : JSON.stringify(str_data),
			dataType: "text",
			success: function (rslt_msg) {				
				if (rslt_msg == "0") {
					//window.location.href = "dashboard.aspx?cat1=DB&cat2=1";
				}else if (rslt_msg == "1") {
					str_msg = "<p>&nbsp;</p><p align=center>User not authorized.</p>";
					$.jGrowl( str_msg, {header: "Contact Administrator.",life: 5000,position: "bottom-right",theme: "ylow_beware1"});
				} else if (rslt_msg == "2") {
					str_msg = "<p>&nbsp;</p><p align=center>Check Password.</p>";
					$.jGrowl( str_msg, {header: "Contact Administrator.",life: 5000,position: "bottom-right",theme: "ylow_warn1"});
				}else {
					$.jGrowl("Failure in " + rslt_msg + ".", { header: "Contact Administrator.", position: "bottom-right", theme: "ylow_fail1" });
				}
			},
			error: function (rslt_msg) {
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
			}
		});
	}
}

function attachSidebarToggleButton() {
	var sideWidth = $("#da-content-wrap").css("margin-left").replace("px", "");
	if(sideWidth > 0) {
		$("#da-sidebar, #da-sidebar-separator").hide();
		$("#da-content-wrap").css("margin-left", "0px");
	} else {
		$("#da-sidebar ,#da-sidebar-separator").show();
		$("#da-content-wrap").css("margin-left", "250px");
	}
	
	jQuery('table[id$="grid"]').setGridWidth($('#da-content-area').width(), true);
}

</script>
</head>






<body onload="javascript:$(document.body).scrollTop(0)">


<div id="dialog_login_div" style="display:none">
	<form id="frm_dialog_login" name="frm_dialog_login" class="da-form" method="post" action="#" onsubmit="javascript:return false;">
		<div id="frm_dialog_login_error" class="da-message error" style="display:none;"></div>
		<div class="da-form-inline">
			<div class="da-form-row">
				<div class="da-form-cols">
					<input type="text" id="dialog_user_usid" name="dialog_user_usid" placeholder="Userid" readonly 
						minlength="2" maxlength="20" required="true" nosymbols="true" nowhitespace="true" runat="server"/>
				</div>
			</div>
			<div class="da-form-row">
				<div class="da-form-cols">
					<input type="password" id="dialog_user_pswd" name="dialog_user_pswd" placeholder="Password"
						minlength="6" maxlength="20" required="true" nosymbols2="true" nowhitespace="true" runat="server"/>
				</div>
			</div>
			<div class="da-form-row" style="border-top: none;padding-top: 0px;padding-bottom: 0px">
				<div class="da-form-cols">
					<input type="checkbox" id="dialog_user_rmbr" name="dialog_user_rmbr" value="CK" runat="server"/>
					<label for="dialog_user_rmbr">Remember me</label>
				</div>
			</div>
		</div>
	</form>
</div>

<!-- Dialog - change password -->
<div id="dialog_password_div" style="display:none">
	<form id="frm_pswd" name="frm_pswd" class="da-form" method="post" action="#" onsubmit="javascript:return false;">
		<input type="hidden" id="cat2"/>
		<div id="frm_pswd_error" class="da-message error" style="display:none;"></div>
		<div class="da-form-inline">
			<div class="da-form-row">
				<label class="da-form-label" style="cursor:default">Current Password<span class="required">*</span></label>
				<div class="da-form-item">
					<input type="password" id="curr_pswd" name="curr_pswd" class="pswdgroup" minlength="6" maxlength="20" nosymbols2="true" nowhitespace="true"/>
				</div>
			</div>
			<div class="da-form-row">
				<label class="da-form-label" style="cursor:default">New Password<span class="required">*</span></label>
				<div class="da-form-item">
					<input type="password" id="new_pswd" name="new_pswd" class="pswdgroup" minlength="6" maxlength="20" nosymbols2="true" nowhitespace="true" />
				</div>
			</div>
			<div class="da-form-row">
				<label class="da-form-label" style="cursor:default">Confirm Password<span class="required">*</span></label>
				<div class="da-form-item">
					<input type="password" id="cnfm_pswd" name="cnfm_pswd" class="pswdgroup" minlength="6" maxlength="20" nosymbols2="true" nowhitespace="true" />
				</div>
			</div>
		</div>
	</form>
</div>

<!-- profile dialog -->
<div id="dialog_profile_div" style="display:none">	
	<form autocomplete="off" id="userForm" name="userForm" class="da-form" method="post" action="#" onsubmit="javascript:return false">
		<div id="userFormError" class="da-message error" style="display:none;"></div>
		<div id="userFormInfo" class="da-message info" style="display:none;"></div>
		<div class="da-form-block">				
			<div class="da-form-row">
				<div class="da-form-cols">
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							ID
							<span class="required">*</span>
						</label>
						<input type="text" id="id" name="id" placeholder="ID" required="true" minlength="3" maxlength="20" />
					</div>
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Password
							<span class="required">*</span>
						</label>
						<input type="password" id="pwd" name="pwd" placeholder="Password" required="true" minlength="3" maxlength="20"/>							
					</div>
				</div>				
			</div>
			<div class="da-form-row">
				<div class="da-form-cols">
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Name
							<span class="required">*</span>
						</label>
						<input type="text" id="user_name" name="user_name" required="true" placeholder="Name" maxlength="20" />
					</div>
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Mail								
						</label>
						<input type="text" id="mail" name="mail" placeholder="Mail" maxlength="30" email="true"/>							
					</div>
				</div>
			</div>
			<div class="da-form-row">
				<div class="da-form-cols">
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Phone (No hyphen)
						</label>
						<input type="text" id="phone" name="phone" placeholder="Phone" />
					</div>
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Mobile (No hyphen)								
						</label>
						<input type="text" id="mobile" name="mobile" placeholder="Mobile" />							
					</div>
				</div>
			</div>
			<div class="da-form-row">
				<div class="da-form-cols">
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Title								
						</label>
						<input type="text" id="title" name="title" placeholder="Title" minlength="2" maxlength="20" />
					</div>
					<div class="da-form-item col-4-8">
						<label class="da-form-label" style="cursor:default">
							Department
						</label>
						<input type="text" id="department" name="department" placeholder="Department" minlength="2" maxlength="20" />							
					</div>
				</div>
			</div>
			<div class="da-form-row">
				<div class="da-form-cols">
					<div class="da-form-item col-8-8">
						<label class="da-form-label" style="cursor:default">
							Manage Auth
							<span class="required">*</span>
						</label>							
						<select class="da-form-item col-8-8" id="manage_auth" name="manage_auth">
							<option value="a">Admin</option>
							<option value="s">Super User</option>
							<option value="u">User</option>
						</select>
					</div>
				</div>
			</div>
		</div>
	</form>	
</div>
<!-- Dandelion Customizer (remove if not needed) -->
<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
<div id="da-wrapper">
	<!-- Header -->
	<div id="da-header">
		<div id="da-header-top">
			<!-- Container -->
			<div class="da-container clearfix">
				<!-- Logo Container. All images put here will be vertically centere -->
				<div id="da-logo-wrap">
					<div id="da-logo">
						<a href="#"><img alt="Latis Global Communications" src="../assets/images/latis_ci120_.png" style="width:120px;"/></a>
					</div>
				</div>
				<span id="span_reminder" style="display:inline-block;margin-top:20px;color:#fff"></span>
				<!-- Header Toolbar Menu -->
				<div id="da-header-toolbar" class="clearfix">					
					<div id="da-user-profile-wrap">
						<div id="da-user-profile" class="clearfix" data-toggle="dropdown">
							<div id="da-user-info">
								<span id="header_name">Name (Usid)</span>
								<span id="header_cmpn" class="da-user-title">Title (Dept)</span>
							</div>
						</div>						
						<ul class="dropdown-menu">							
							<li><a href="javascript:showProfileDialog()">Profile</a></li>							
							<li><a href="javascript:chngPswd()">Change Password</a></li>
							<li><a href="javascript:showCart()" id="showCartButton" style="display:none;">My Cart</a></li>
						</ul>						
					</div>
					<div id="da-header-button-container">
						<ul>
							<!--
							<logic:notEqual value="u" name="manageAuth" >
								<li class="da-header-button-wrap">
									<div class="da-header-button">
										<a href="javascript:attachSidebarToggleButton()"><i class="icon-settings"></i></a>
									</div>
								</li>
							</logic:notEqual>						
							-->
							<li class="da-header-button-wrap">
								<div class="da-header-button">
									<a href="../logout"><i class="icon-power"></i></a>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="da-header-bottom">
			<!-- Container -->
			<div class="da-container clearfix">					
				<!-- Breadcrumbs -->
				<div id="da-breadcrumb">
					<div id="searchWrap" style="display: none;">
						<input type="text" id="selectedCategory" value="---- Select Category ----" readonly="readonly" />
						<select id="search_column">
							<logic:iterate id="item" name="searchColumnArray">
								<option id=<bean:write name="item" property="searchColumn"/> name=<bean:write name="item" property="searchColumn"/> value=<bean:write name="item" property="searchColumn"/>><bean:write name="item" property="searchColumn"/></option>
					        </logic:iterate> 
						</select>
						<input type="text" id="search_text" placeholder="Search" onkeydown="javascript:if(event.keyCode==13){epcSearch();}" />
						<a href="#" class="btn" onclick="epcSearch()">
							<i class="icon-search"></i>
							Search
						</a>
					</div>
					<ul>
						<li id="navi_userManage" class="active" style="display:none"><i class="icol-user-business"></i> User Manage</li>
						<li id="navi_groupManage" class="active" style="display:none"><i class="icol-group"></i> Group Manage</li>
						<li id="navi_epcUpload" class="active" style="display:none"><i class="icol-doc-convert"></i> WPC Upload</li>
						<li id="navi_category" class="active" style="display:none"><i class="icol-text-list-bullets"></i> Category</li>
						<li id="navi_content" class="active" style="display:none"><i class="icol-layout-split"></i> Content</li>						
					 </ul>
				</div>
				<logic:notEqual value="u" name="manageAuth" >
					<button class="ui-button ui-widget ui-state-default ui-corner-all ui-button-icon-only" role="button" aria-disabled="false" title="Toggle Manage View" onclick="javascript:attachSidebarToggleButton()" id="manageToggle" style="margin-top: -31px;">
						<span class="icon-list"></span>
						<span class="ui-button-text">Toggle Manage View</span>
					</button>					
				</logic:notEqual>
			</div>
		</div>
	</div>