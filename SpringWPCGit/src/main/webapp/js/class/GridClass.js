function WpcGrid(id, url, navId) {
	
	 
	this.gridId = id;
	this.url = url;
	this.navId = navId;
	this.defaultData = {
		// url: "AjaxAction.latis",
		// postData: data,
		/*
		 * colNames: ["ID", "Name", "Mail", "Phone", "Mobile", "Title",
		 * "Department", "Manage Auth"], colModel: [ { name: "id", index: "id",
		 * width: 80, align: "center", sortable: true }, { name: "user_name",
		 * index: "user_name", width: 80, align: "center", sortable: true }, {
		 * name: "mail", index: "mail", width: 120, align: "center", sortable:
		 * true }, { name: "phone", index: "phone", width: 100, align: "center",
		 * sortable: true }, { name: "mobile", index: "mobile", width: 80,
		 * align: "center", sortable: true }, { name: "title", index: "title",
		 * width: 80, align: "center", sortable: true}, { name: "department",
		 * index: "department", width: 90, align: "center", sortable: true }, {
		 * name: "manage_auth", index: "manage_auth", width: 60, align:
		 * "center", sortable: true, formatter:manageAuthFormatter } ],
		 */
		/* external parameter info start */
		url : url,
		postData : "",
		colNames : [],
		colModel : [],
		/* external parameter info end */
		datatype : "json",

		mtype : "POST",
		ajaxRowOptions : {
			async : false
		},
		ajaxGridOptions : {
			contentType : "application/json; charset=utf-8"
		},

		jsonReader : {
			page : "page",
			total : "total",
			root : "gridData",
			records : function(obj) {
				obj.length;
			},
			repeatitems : false,
			id : "user_seqn"
		},
		sortable : true,
		autowidth : true,
		caption : "", // table title
		deepempty : true,
		editurl : "",
		grouping : false,
		height : "100%",
		loadonce : true,
		pager : "#"+navId,
		rownumbers : true,
		rowNum : 20,
		rowList : [ 10, 20, 30, 50 ],
		scrollOffset : 0,
		shrinkToFit : false,
		sortorder : "desc",
		viewrecords : true
	}
};

WpcGrid.prototype.setGridData = function(data){
	
	//$("#"+this.id).jqGrid('setGridParam', {gridComplete: makeGridRowsDraggable($("#" + this.id))});
	$("#"+this.gridId).jqGrid('setGridParam', data);
};

WpcGrid.prototype.showGrid = function(colNames, colModel, selector) {
	//this.defaultData.url = url;
	this.defaultData.colNames = colNames;
	this.defaultData.colModel = colModel;

	jQuery("#" + this.gridId).jqGrid(this.defaultData);
	 
	$(window).bind("resize",{id:this.getId()}, function(e) {
		//jQuery("#user_grid").setGridWidth($("#user_width").width(), true);
		jQuery("#" + e.data.id).setGridWidth($(selector).width(), true);
		// $("#user_grid").closest(".ui-jqgrid-bdiv").width($("#user_grid").closest(".ui-jqgrid-bdiv").width());
	}).trigger("resize");

	$("#" + this.gridId + "_rn").css("width", "23px");
}

WpcGrid.prototype.gridNav = function(options, editOption, addOption, delOption, searchOptions) {
	
	if(options == null){
		options = {};
	}
	
	var edit = {};
	if(editOption != null){
		edit = editOption;
	}
	
	var add = {};
	if(addOption != null){
		add = addOption;
	}
	
	var del = {};
	if(delOption != null){
		del = delOption;
	}
	var search = {};
	if(searchOptions != null){
		search = searchOptions;
	}
	
	
	jQuery("#" + this.gridId).jqGrid(
		"navGrid", 
		"#" + this.gridId + "_nav", 
		options,
		edit, //edit
		add, //add
		del, //del
		search	
	);
};

//idx는 parameter에서 idx+1된 값을 넘겨받아야 한다. 
WpcGrid.prototype.removeRowGrid = function(idx){

	$('#'+this.gridId).jqGrid('delRowData', idx);
}

WpcGrid.prototype.reloadGrid = function(url, data){
	var currentUrl;
	if(url != null || url != undefined){
		currentUrl = url;
	}else{
		currentUrl = this.url;
	}
	jQuery("#" + this.gridId).jqGrid('setGridParam', {
		url : currentUrl,
		datatype : "json",
		mtype : "POST",
		postData : data,
		page : 1
	}).trigger('reloadGrid');	
};

WpcGrid.prototype.getCurrentRowData = function(){
	var selectedGridRowId = $("#"+this.gridId).getGridParam( "selrow" );
	return $("#"+ this.gridId).getRowData( selectedGridRowId );		
};

WpcGrid.prototype.getCurrentRowId = function(){
	return $("#"+this.gridId).getGridParam( "selrow" );
			
};
WpcGrid.prototype.getRowDataList = function(){
	return jQuery("#"+this.gridId).jqGrid('getRowData');
}

WpcGrid.prototype.getId = function(){
	return this.gridId;
}


