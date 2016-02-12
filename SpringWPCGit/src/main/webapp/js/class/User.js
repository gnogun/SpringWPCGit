function User(maskingArray,formId, formErrorId, deleteFormId){
	for(var i = 0; i < maskingArray.length; i++){
        var inputElem = $(maskingArray[i]);
        var v_len = inputElem.val().length;
        if(v_len < 10){
            inputElem.mask("99) 999-9999");
        }else if(v_len == 10){
            inputElem.mask("999) 999-9999");
        }else{
            inputElem.mask("999) 9999-9999");
        }
    }
	
	this.formId = formId;
	this.formErrorId = formErrorId;
	this.deleteFormId = deleteFormId;
    this.formValidator();
};

User.prototype.addUser = function(jsonData,url,gridObject,reloadUrl){
    this.isValid(jsonData, url, gridObject,reloadUrl);
};

User.prototype.editUser = function(jsonData, url, gridObject, reloadUrl){
	this.isValid(jsonData, url, gridObject,reloadUrl);
};

User.prototype.deleteUser = function(jsonData, url, gridObject, reloadUrl){
	this.isValid(jsonData, url, gridObject,reloadUrl);
};


User.prototype.formValidator = function(){
	$("#"+this.formId).validate({
		rules: {
			id: {
				required: true
			},
			pwd: {
				required: true
			},
			manage_auth: {
				required: true
			}
		},		
		invalidHandler: function(form, validator) {
		//invalidHandler: function() {
			var errors = validator.numberOfInvalids();
			if (errors) {
					var str_msg = errors == 1
					? "You missed 1 field. It has been highlighted."
					: "You missed " + errors + " fields. They have been highlighted.";
					$("#"+this.formErrorId).html(str_msg).show();
					setTimeout("$('#'"+this.formErrorId+"').hide(300)",5000);
				} else {
					//$("#frm_tab1_error").hide();
					//$("#frm_tab1_info").hide();
					$("#"+this.formId+" label.error").hide();
				}
		}
	});	
}

User.prototype.isValid = function(jsonData,url,gridObject,reloadUrl){
	
	
	
    if($("#"+this.formId).valid()){
        $.ajax({
            type: "POST",
            url: url,
            contentType : 'application/json;charset=UTF-8', // 서버 요청시 전송할 데이터가 UTF-8 형식의 JSON 객체임을 명시
            data : JSON.stringify(jsonData),
            context : this,
            dataType: "text",
            success: function (rslt_msg) {          
                if(rslt_msg != "false" && rslt_msg != ""){
                	if(url == "deleteUser.do"){
                		$("#"+this.deleteFormId).dialog("close");
                	}else{
                		$("#"+this.formId).dialog("close");
                		
                	}
                    //reloadGrid();
                    //"user_grid","userList.do",""
                    
                    
                    gridObject.reloadGrid( reloadUrl,"" );
                }else{
                    $.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
                }
            },
            error: function (rslt_msg) {        
                $.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});          
            }
        });
    }
};

User.prototype.manageAuthFormatter = function( cellvalue, options, rowObject ) {
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
