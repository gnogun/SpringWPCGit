<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!--[if lt IE 7]><html class="lt-ie9 lt-ie8 lt-ie7" lang="en"> <![endif]-->
<!--[if IE 7]><html class="lt-ie9 lt-ie8" lang="en"> <![endif]-->
<!--[if IE 8]><html class="lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--><html lang="en" xmlns="http://www.w3.org/1999/xhtml"><!--<![endif]-->
<head>
<!--meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/-->
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR"/>
<!--meta charset="utf-8"-->
<meta http-equiv="Content-Language" content="en" />
<meta content="width=device-width, initial-scale=1.0" name="viewport" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
<meta name="description" content="Service WPC"/>
<meta name="author" content="Latisglobal.com"/>
<!-- Bootstrap Stylesheet -->
<link href="bootstrap/css/bootstrap.min.css" media="screen" rel="stylesheet" />
<!-- Theme Stylesheet -->
<link href="assets/css/dandelion.theme.css" media="screen" rel="stylesheet" />
<!-- Icon Stylesheet -->
<link href="assets/css/fonts/glyphicons/style.css" media="screen" rel="stylesheet" />
<!-- Main Stylesheet -->
<link href="assets/css/dandelion.css" media="screen" rel="stylesheet" />
<link href="assets/css/dandelion.min.css" media="screen" rel="stylesheet" />
<!-- Demo Stylesheet -->
<link href="assets/css/demo.css" media="screen" rel="stylesheet" />
<!-- Plugin Stylesheet -->
<link href="assets/js/plugins/wizard/dandelion.wizard.css" media="screen" rel="stylesheet" />
<!-- Login Stylesheet -->
<link rel="stylesheet" href="assets/css/form.css" media="screen"/>
<link rel="stylesheet" href="assets/css/login.css" media="screen"/>
<link rel="stylesheet" href="plugins/zocial/zocial.css" media="screen"/>
<!-- jQuery-UI JavaScript Files (dialog) -->
<link rel="stylesheet" type="text/css" href="assets/jui/css/jquery.ui.all.css" media="screen"/>
<title>Latis Global - WPC</title>
</head>

<body onload="javascript:preload()">
<div id="da-home-wrap">
	<div id="da-home-wrap-inner">
		<div id="da-home-inner">
			<div id="da-home-box">
				<div id="da-home-box-header">
					<p style="margin-left: 60px"><img alt="Latis Global Communications" id="ci_logo" src="assets/images/latis_ci250.png" style="width:120px;padding-bottom:10px"/></p>
					<span class="da-home-box-title" id="da_home_box_title" runat="server">Service WPC - Login</span>
				</div>
				<form id="loginForm" class="da-form da-home-form" method="post" action="loginProcess" runat="server">
					<div class="da-form-row">
						<div class=" da-home-form-big">
							<input type="text" id="username" name="username" placeholder="Userid" minlength="3" maxlength="20" required="true" nosymbols="true" nowhitespace="true" runat="server" />
						</div>
						<div class=" da-home-form-big">
							<input type="password" id="password" name="password" placeholder="Password" minlength="3" maxlength="20" required="true" nosymbols2="true" nowhitespace="true" runat="server" />
						</div>
					</div>
					<div class="da-form-row">
						<ul class="da-form-list inline">
							<li><input type="checkbox" id="vdbrown_rmbr" name="vdbrown_rmbr" value="CK" runat="server"/> <label for="vdbrown_rmbr">Remember me</label></li>
						</ul>
					</div>
					<div class="da-home-form-btn-big">
						<!-- <input type="submit" value="Login" id="da-login-submit" class="btn btn-danger btn-block" onclick="javascript:goLogin();" />-->
						<input type="submit" value="Login" id="da-login-submit" class="btn btn-danger btn-block" />
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- JS Libs -->
<script src="assets/js/libs/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="assets/js/libs/jquery.placeholder.min.js" type="text/javascript"></script>
<script src="plugins/validate/jquery.validate.min.js" type="text/javascript"></script>
<!-- JS Login -->
<script src="assets/js/core/dandelion.login.js" type="text/javascript"></script>
<!-- JS Template -->
<script src="assets/js/core/dandelion.core.js" type="text/javascript"></script>
<!-- user script (symbol check)-->
<script src="plugins/validate/jquery.validate.user.js" type="text/javascript"></script>
<!-- jQuery-UI JavaScript Files (dialog) -->
<script src="assets/jui/js/jquery-ui-1.9.2.min.js" type="text/javascript"></script>
<script src="assets/jui/jquery.ui.timepicker.min.js" type="text/javascript"></script>
<script src="assets/jui/jquery.ui.touch-punch.min.js" type="text/javascript"></script>
<!-- JS Demo -->
<script src="assets/js/demo/demo.ui.js" type="text/javascript"></script>
<!-- jGrowl Plugin -->
<script src="plugins/jgrowl/jquery.jgrowl.min.js" type="text/javascript"></script>
<link rel="stylesheet" href="plugins/jgrowl/jquery.jgrowl.css" media="screen" type="text/css"/>

<script type="text/javascript">

function preload(){
	var v_image = $("#ci_logo").attr("src", "assets/images/latis_ci250.png");
	/*
	var str_data = {
		protocolName:'loadRememberId'		
	};
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		contentType : 'application/json;charset=UTF-8', // ���� ��û�� ����� �����Ͱ� UTF-8 ����� JSON ��ü��; ���
 		data : JSON.stringify(str_data),
		dataType: "text",
		success: function (rslt_msg) {			
			if(rslt_msg != "false" && rslt_msg != ""){				
				$("#vdbrown_usid").val(rslt_msg);
			}
		},
		error: function (rslt_msg) {		
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});			
		}
	});
	*/
}
/*
//da-login-submit
var element = document.getElementById("da-login-submit");
element.addEventListener("click", function () {
    goLogin();
}, false);

*/
$("#da-login-submit").bind("click",function(){
	 //goLogin();
});
function goLogin() {	
	var vdbrown_usid = $("#vdbrown_usid").val();
	var vdbrown_pswd = $("#vdbrown_pswd").val();
	var vdbrown_rmbr = "false";
	
	if($("input[name='vdbrown_rmbr']").is(':checked')){
		vdbrown_rmbr = "true";
	}

	var str_data = {
		protocolName:'isValidAccount',
		userid : vdbrown_usid,
		password : vdbrown_pswd,
		rememberChk : vdbrown_rmbr
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
					window.location.href = "wpc.latis";
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

function frgtPW() {
	$.jGrowl("<p>&nbsp;</p><p align=center>#8542</p>", {header: "Contact Administrator.",position: "bottom-right",life: 5000,theme: "ylow_fab241"});
}
</script>

</body>
</html>