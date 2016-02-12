function Dialog(){
    var dialog;
    var id;
    var data;
};


Dialog.prototype.makeDialog = function(id,title,width,buttonData){

    var data = {
        autoOpen: false,
        title: title,
        modal: true,
        width: "440",
        buttons: buttonData,
        close: function( event, ui ) {
			$("#"+id).dialog("close");
		}

    }

    if(width != null){
        data.width = width;
    }
    $("#"+id).dialog(data);
    this.dialog = $("#"+id);
    this.id = id;
    this.data = data;
    
};
//$('.selectorUsedToCreateTheDialog').dialog('option', 'title', 'My New title');

Dialog.prototype.setOption= function (optionName, optionValue){
	$("#"+this.id).dialog("option",optionName, optionValue);
};

Dialog.prototype.dialogOpen = function (){
    this.dialog.dialog("open");
};

Dialog.prototype.setData = function(currentRowData, selectBoxId){
	
	
	/**
	 * $("#dialog_profile_div input#id").val(list.id);
		$("#dialog_profile_div input#id").attr("disabled",true);
		$("#dialog_profile_div input#user_name").val(list.user_name);
		$("#dialog_profile_div input#mail").val(list.mail);
		$("#dialog_profile_div input#phone").val(list.phone);
		$("#dialog_profile_div input#mobile").val(list.mobile);
		$("#dialog_profile_div input#title").val(list.title);
		$("#dialog_profile_div input#department").val(list.department);
	 */
	this.data.title = "Edit User";
	var id = this.id;
	for(var key in currentRowData){
		$("#"+id+" input#"+key).val(currentRowData[key]);
		if(key == "id"){
			$("#"+id+" input#"+key).attr("disabled",true);
		}
		
		if(key == "manage_auth"){
			if(currentRowData.manage_auth == "Admin"){
				currentRowData.manage_auth = "a"
			}else if(currentRowData.manage_auth == "Super User"){
				currentRowData.manage_auth = "s"
			}else if(currentRowData.manage_auth == "User"){
				currentRowData.manage_auth = "u"
			}
			
		}
	}
	$("#"+ selectBoxId).select2().select2("val", currentRowData.manage_auth);
};


Dialog.prototype.setSelectBoxDefaultValue = function(selectId){
	$("#"+selectId).select2({
			//초기 select box의 개수를 정함. -1일 경우. 무한대로 보여줌. 만약 개수보다 작으면 검색 창으로 제공. 
			minimumResultsForSearch: -1 
	}).select2("val", "a");
};


Dialog.prototype.close = function(){
	$("#"+this.id).dialog("close");
}

Dialog.prototype.getId = function(){
	return this.id;
};