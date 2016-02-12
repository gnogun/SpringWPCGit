<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input id="contentNav" type="hidden" value="content" />
	<div id="da-content-wrap" class="clearfix">
		<div id="da-content-area">
			<div class="row-fluid">
				<div class="span3">
					<div class="da-panel">
						<div class="da-panel-header">
							<span class="da-panel-title">
								<i class="icol-text-list-bullets"></i> Cetegory
							</span>
						</div>
						<div id="epc_width" class="da-panel-content" style="border-bottom:none">
							<div class="da-form-row">
								<div id="categoryDiv">
									<div class="selectList">
										<label class="da-form-label" style="cursor:default">
											Category 1
										</label>
										<select id="categorySelect1" onchange="selectCategory(this)">
											<option>---- Select Category ----</option>
										</select>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="da-panel" id="treePanel">
						<div class="da-panel-header">
							<span class="da-panel-title">
								<i class="icol-page-white-stack"></i> Parts List
							</span>
						</div>						
						
						<div class="da-form-row">
							<div class="row-fluid">
								<div class="toc">
									<div id="epcDirectory" style="height: 430px; oveflow-y:auto; display:none;">
										<ul>
							                <li></li>
							                <li class="isLazy isFolder"></li>
							            </ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="span9">
					<div class="da-panel">
						<div class="da-panel-header">
							<span class="da-panel-title" id="contentTitle">
								<!-- 
								<i class="icol-text-list-bullets"></i> SVG
								 -->
							</span>
						</div>
						<div id="epc_width" class="da-panel-content" style="border-bottom:none">
							<div class="da-form-row">
								<div class="content">
									<div id="svgIframeDiv">
										<div id="searchResult">
											<table id="search_grid">
											</table>
											<div id="search_grid_nav"></div>
											
										</div>							
										<iframe scrolling="no" src="" id="svgIframe" style="display: none;">
			              				</iframe>
									</div>
									<div id="graph_area"></div>
									<div id="svgDetailTable">
										<table id="bom_data_grid">
										</table>
										<div id="bom_data_grid_nav"></div>
			              			</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<style>
#svgIframe {
  width: 100%;
  height: 500px;
}

#searchResult{
	width: 100%;
  	height: 500px;
}

#svgIframeDiv {
	background-color: #ffffff;
	width: 100%;
  	height: 500px;
}

#da-header{
	margin-bottom: 0px;
}

#da-header-bottom{
	//background: none;
	padding-bottom: 0px;
}

#da-breadcrumb .active {
	border: none;
}

#da-breadcrumb .active:after {
	display: none;
}

#da-breadcrumb .active:before {
	display: none;
}

#da-breadcrumb ul, #da-breadcrumb ul li{
	float: right;
}

#searchWrap {
	display: block !important;
	//border-bottom: 1px black solid;	
	padding: 5px;
}

#showCartButton{
	display:block !important;
}

</style>
	
<script type="text/javascript">
$(document).ready(function (e) {
	//loadBomColumnDef();
	//loadCategoyInfo();	
});

var easyTree1 = null;
var highlightRow = -1;
var bomGridObj = {
		url: "AjaxAction.latis",
		datatype: "json",
		mtype: "POST",
		//postData: str_data,
		
		/*
		colNames: ["EPC Name", "PART CODE", "NAME", "svg_id"],
		colModel: [
			{ name: "model_id", index: "model_id", width: 100, align: "center", sortable: true },
			{ name: "column_2", index: "column_2", width: 150, align: "center", sortable: true },
			{ name: "column_4", index: "column_4", width: 150, align: "center", sortable: true },
			{ name: "svg_id", index: "svg_id", width: 150, align: "center", sortable: true, hidden: true }
		],
		*/
		autowidth: true,
		jsonReader: {
			page: "page",
			total: "total",
			root: "gridData",
			records: function (obj) { obj.length; },
			repeatitems: false,
			id: "user_seqn"
		},
		//caption: "",	//table title
		
		
		/*
		gridComplete: function () {
		},
		*/
		//grouping: false,
		search: true,
		height: "100%",
		loadonce: true,
		/*
		ondblClickRow: function (id) {
			//$("[id^=btn_edit_]").hide();
			if(id && id !== lastsel) {
				var list = $("#search_grid").getRowData( id );
				
				
				var svgId = list.svg_id;
				
				
				//alert(svgId);
				
				getSelectSvg(svgId);
				
				
			}
		},
		
		onSelectRow: function (id) {
			if(id) {
				if(id !== lastsel) {
					lastsel = id;
				} else {
					lastsel = "";
				}
			}
		},
		pager: "#search_grid_nav",
		*/
		rownumbers: true,
		//rowNum: 20,
		rowList: [10, 20, 30, 50],
		scrollOffset: 0,
		//shrinkToFit: false,
		sortorder: "asc",
		sortname: 'column_1',
		viewrecords: true
	};

function loadBomColumnDef(){
	var str_data = JSON.stringify({
		protocolName: "loadBomColumnDef",
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			var gridColumn = rslt_msg;
			
			var columnIndexArray = [];
			var columnNameArray = [];
			var colModelArray = [];
			
			for(var key in gridColumn){
				var columnIndex = key;
				columnIndexArray.push(key);
			}
			
			columnNameArray.push("SVG");
			colModelArray.push({
				name: "svg_id",
				index: "svg_id",
				hidden: true
			});
			
			columnNameArray.push("SVG NAME");
			colModelArray.push({
				name: "svg_name",
				index: "svg_name",
				width: 180,
				align: "center",
				hidden: true
			});
			
			for(var i = 0; i < columnIndexArray.length; i++){
				var key = columnIndexArray[i];
				
				var colModel = {};
				
				colModel.name = "column_" + key;
				colModel.index = "column_" + key;
				colModel.width = 100;
				colModel.align = "center";
				colModel.sortable = true;
				colModel.search = true;
				colModel.searchoptions = {sopt: ['eq', 'cn']}; 
				
				columnNameArray.push(gridColumn[key]);
				colModelArray.push(colModel);
			}
			
			columnNameArray.push("CART");
			colModelArray.push({
				name: "cart",
				index: "cart",
				width: 50,
				align: "center",
				search: false,
				hidden: true,			
			});
			
			
			
			bomGridObj.colNames = columnNameArray;
			bomGridObj.colModel = colModelArray;			
			//alert("!");
			
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
}

function loadCategoyInfo(){
	var str_data = JSON.stringify({
		protocolName: "loadCategoyInfo",
		parent: "root"
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			var categoryList = rslt_msg.selectList;
			var epcList = rslt_msg.treeList;
			var optionText = "";
			
			if(categoryList.length > 0){
				
				for(var i = 0; i < categoryList.length; i ++){
					
					optionText += 
						"<option id='" + categoryList[i] + "' name='" + categoryList[i] + "'>" +
						categoryList[i] +
						"</option>";
					
				}
				$("#categorySelect1").append(optionText);
			}
			
			if(epcList.length > 0){
				selectEpc(epcList);
			}
			
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
}

function selectCategory(option){
	
	if(option.id == "categorySelect1"){
		while(true){
			if($("#categoryDiv select").size() == 1){
				break;
			}else{
				$(".selectList").eq($("#categoryDiv select").size() -1).remove();
			}
		}		
	}
	
	var selectList = $("#categoryDiv select");
	
	var selectValue = ""; 
	var current = "";
	for(var i = 0; i < selectList.size(); i ++){
		if(i != selectList.size()-1){
			selectValue += selectList.get(i).value;
		}else{
			current = selectList.get(i).value;
		}
		
		if(i != selectList.size()-1 && i != selectList.size()-2){
			selectValue += "/";
		}
	}
	
	var currentSelectListIndex = option.id.replace(/[A-Za-z]+/g, '');
	
	$("#selectedCategory").val(current);
	
	var str_data = JSON.stringify({
		protocolName: "loadCategoyInfo",
		parent: selectValue,
		current: current
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			$("#contentTitle").html("");
			document.getElementById("searchResult").style.display = "none";
			$("#epcDirectory").css("display", "none");
			easyTree1 = null;
			
			document.getElementById("svgIframe").style.display = "none";
			document.getElementById("svgIframe").src = "";
			document.getElementById("svgDetailTable").style.display = "none";						
			
			var selectListNum = Number(currentSelectListIndex) + 1;
			
			var categoryList = rslt_msg.selectList;
			var epcList = rslt_msg.treeList;
			
			if(categoryList.length > 0){
				if($("#categorySelect" + selectListNum).size() == 0){
					var newSelectList = "<div class='selectList'>" + 
						"<label class='da-form-label' style='cursor:default'>" +
						"Category " + selectListNum + " "+
						" </label>"+
						" <select id='categorySelect" + selectListNum + "' onchange='selectCategory(this)'>"+
						"<option>---- Select Category ----</option>"+
						"</select>" +
						"</div>";						
					$("#categoryDiv").append(newSelectList);
				}
				
				var optionText = "";
				for(var i = 0; i < categoryList.length; i ++){
					
					optionText += "<option id='" + categoryList[i] + "' name='" + categoryList[i] + "'>" +
						categoryList[i] +
						"</option>";
					
				}
				$("#categorySelect" + selectListNum).append(optionText);
			}else{
				if($("#categorySelect" + selectListNum).size() != 0){
					while(true){
						if($(".selectList").size() != selectListNum -1){
							$(".selectList").eq($(".selectList").size()-1).remove();
						}else{
							break;
						}
					}
				}
			}
			
			if(epcList.length > 0){
				selectEpc(epcList);
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
};

function selectEpc(epcList){
		
	var str_data = JSON.stringify({
		protocolName: "getMainSvgName",
		epcName: epcList[0]
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			epcList[0] = rslt_msg;
			
			var path = "";
			for(var i in epcList){
				path += epcList[i];
				if(i != epcList.length-1){
					path += "|";
				}
			}
			
			makeEpcList(path);
			//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
		},
		error: function (rslt_msg) {
			document.getElementById("graph_area").innerHTML = "";
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
	
}


function makeEpcList(path){
	//document.getElementById("treePanel").display = "block";
	
	
	
	$("#epcDirectory").css("display", "block");
	easyTree1 = $('#epcDirectory').easytree({
        openLazyNode: openLazyNode,
        dataUrl: 'TreeAction.latis?protocolName=initList&path=' + path,
        stateChanged: stateChanged,
        opened: opened
    });
}

function opened(event, nodes, node) {
	for(var i = 0; i < node.children.length; i ++){
		var textnode = node.children[i];
		if(!textnode.isFolder){
			if(textnode.text.indexOf(".svg") < 0){
				easyTree1.removeNode(textnode.id);
	         	easyTree1.rebuildTree();			
			}
		}
	}
}

function openLazyNode(event, nodes, node, hasChildren) {
    if (hasChildren) { // don't call ajax if lazy node already has children
        return false;
    }
    
    var temp = currentNode(nodes, node, "");
    
    temp = encodeURIComponent(temp);
    
    node.lazyUrl = "TreeAction.latis?protocolName=lazyList&path=" + temp; // must be set here or when the tree is initialised
    
}
       
function currentNode(nodes, currentNodeId, currentPath) {
	var returnVal = "";
	for (var i = 0; i < nodes.length; i++) {
		if(nodes[i].id == currentNodeId.id){
			returnVal = currentPath + nodes[i].text;
			break;
		}
		if(returnVal == ""){
			if (nodes[i].children && nodes[i].children.length > 0) {
				var temp = currentPath + nodes[i].text+"/"; 
          	 		//currentPath +=nodes[i].text+"/";
              		returnVal = currentNode(nodes[i].children, currentNodeId,temp);
          		}
		}	
     }
     return returnVal;
}

function stateChanged(nodes, jsonString){
	var currentId = $("#epcDirectory .easytree-active").attr("id");
	if(currentId != undefined){
		var node = easyTree1.getNode(currentId);
		var temp = currentNode(nodes, node, "");

		if(node.text.indexOf(".svg") > -1){
			
			loadSvgToFrame(temp);
			
		}
		
		//$("#editInput").val(node.text); 
	}
}

function loadSvgToFrame(pathData){
	pathData = pathData.substring(pathData.indexOf("/")+1)
	var breadrumbsText = "<i class=\"icol-layout-split\"></i> Content > " + pathData.replace(/\//gi, " > ");
	$("#navi_content").html(breadrumbsText);
	document.getElementById("searchResult").style.display = "none";
	var str_data = JSON.stringify({
		protocolName: "loadSvgToFrame",
		pathData: pathData
	});
	
	$("#contentTitle").html("<i class='icol-text-list-bullets'></i> SVG");
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			document.getElementById('graph_area').innerHTML = "";
			
			var svgPath = rslt_msg.svgPath;
			//var gridColumn = rslt_msg.gridColumn;
			//var gridData = rslt_msg.gridData;
			
			document.getElementById("svgIframe").src = svgPath;
			if(document.getElementById("svgIframe").style.display == "none"){
				document.getElementById("svgIframe").style.display = "";						
			}
			if(document.getElementById("svgDetailTable").style.display == "none"){
				document.getElementById("svgDetailTable").style.display = "";						
			}
			
			showBomDataGrid(rslt_msg.svgId);
			
			//$("#svgDetailTable").html(tableHtml);
						
			//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
		},
		error: function (rslt_msg) {
			document.getElementById("graph_area").innerHTML = "";
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		},
		beforeSend:function(){
			var target = document.getElementById('graph_area');
			var spinner = new Spinner(opts).spin(target);
	    }
	}); 
}

function tableHighlight(textVal){
	
	//alert(Math.ceil(textVal/5));
	$("#bom_data_grid").trigger("reloadGrid",[{page: Math.ceil(textVal/5)}]);
	
	jQuery('#bom_data_grid').jqGrid('setSelection', textVal);
	return false;
}

function epcSearch(){	
	$("#navi_content").html("");
	$("#contentTitle").html("<i class='icol-text-list-bullets'></i>Search");
	//$("#epcDirectory").css("display", "none");
	easyTree1 = null;
	
	document.getElementById("svgIframe").style.display = "none";
	document.getElementById("svgIframe").src = "";
	document.getElementById("svgDetailTable").style.display = "none";		
	
	var selectList = $("#categoryDiv select");
	
	
	var searchText = $("#search_text").val();
	var searchColumn = $("#search_column option:selected").text();
	var parent = ""; 
	var current = $("#selectedCategory").val();
	
	for(var i = 0; i < selectList.size(); i ++){
		if(i != selectList.size()-1){
			parent += selectList.get(i).value;
		}
		
		if(i != selectList.size()-1 && i != selectList.size()-2){
			parent += "/";
		}
	}
	
	if(parent == current){
		parent = "null";
	}
	
	if(searchText != ""){
		if(document.getElementById("searchResult").style.display == "none"){
			document.getElementById("searchResult").style.display = "";						
		}
		
		$("#search_grid").jqGrid("GridUnload");

		var lastsel;
		var str_data = JSON.stringify({
			protocolName: "epcSearch",
			searchText: searchText,
			searchColumn: searchColumn,
			parent: parent,
			current: current
		});
		bomGridObj.postData = str_data;
		bomGridObj.rowNum = 20;
		bomGridObj.onSelectRow = function (id) {
			if(id) {
				if(id !== lastsel) {
					lastsel = id;
				} else {
					lastsel = "";
				}
			}
		};
		bomGridObj.ondblClickRow = function (id) {
			//$("[id^=btn_edit_]").hide();
			if(id && id !== lastsel) {
				var list = $("#search_grid").getRowData( id );
				var svgId = list.svg_id;
				var col1 = list.column_1;
				
				highlightRow = col1;
				getSelectSvg(svgId);
				getCurrentEpcCategory(svgId);
			}
		};
		
		bomGridObj.onSelectRow = function (id) {
			return false;
		};
		
		
		bomGridObj.gridComplete = function(){
			var ids = jQuery("#search_grid").jqGrid('getDataIDs');
			for(var i=0;i < ids.length;i++){
				var id = ids[i];
				
				var list = jQuery("#search_grid").jqGrid('getRowData', id);
				var svg_id = list.svg_id;
				var col1 = list.column_1 *1;
				var col6 = list.column_6 *1;
				
				svg_id = svg_id.split("|")[svg_id.split("|").length-1];
				
				
				jQuery("#search_grid").jqGrid('setRowData', id,{svg_name: svg_id, column_1: col1, column_6: col6});
			}
			document.getElementById("graph_area").innerHTML = "";
		};
		
		var colModel = bomGridObj.colModel;
		for(var i = 0 ; i < colModel.length; i ++){
			if(colModel[i].name == "column_1"){
				colModel[i].sorttype = 'int';
			}
			
			if(colModel[i].name == "cart"){
				colModel[i].hidden = true;
			}
			
			if(colModel[i].name == "svg_name"){
				colModel[i].hidden = false;
			}
			
		}
		
		//jQuery("#search_grid").jqGrid(obj);
		bomGridObj.pager = "#search_grid_nav",
		jQuery("#search_grid").jqGrid(bomGridObj);

		jQuery("#search_grid").jqGrid(
			'navGrid',
			'#search_grid_nav',
			{edit:false,add:false,del:false,
				beforeRefresh: function(){
			        jQuery("#search_grid").jqGrid('setGridParam',
	    			 {
	    			 	url : "AjaxAction.latis",
			        	datatype: "json",
			        	mtype: "POST",
			        	postData: str_data,
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
		   			
		   			var rowlist = jQuery("#search_grid").jqGrid('getRowData');
		   			for(var i = 0; i < rowlist.length; i ++){
		   				var row = rowlist[i];
		   				
		   				var targetData = row[column];
		   				
		   				if(operator == "eq"){
		   					if(data != targetData){
			   					$('#search_grid').jqGrid('delRowData', i+1);
		   					}
		   				}else if(operator == "cn"){
		   					if(targetData.indexOf(data) < 0){
			   					$('#search_grid').jqGrid('delRowData', i+1);
		   					}
		   				}
		   			}
		   		}
		   	}
		);
		
		$(window).bind("resize", function () {
			jQuery("#search_grid").setGridWidth($("#svgIframeDiv").width(), true);
			//$("#epc_grid").closest(".ui-jqgrid-bdiv").width($("#epc_grid").closest(".ui-jqgrid-bdiv").width());
		}).trigger("resize");
		
	}
}

function showBomDataGrid(svgId){
	$("#bom_data_grid").jqGrid("GridUnload");
	var lastsel;
	var str_data = JSON.stringify({
		protocolName: "loadSelectedSvgBomData",
		svgId: svgId
	});
	
	var colModel = bomGridObj.colModel;
	for(var i = 0 ; i < colModel.length; i ++){
		if(colModel[i].name == "column_1"){
			colModel[i].sorttype = 'int';
		}
		
		if(colModel[i].name == "cart"){
			colModel[i].hidden = false;
		}
		if(colModel[i].name == "svg_name"){
			colModel[i].hidden = true;
		}
	}
	
	bomGridObj.postData = str_data;
	bomGridObj.rowNum = 5;
	bomGridObj.ondblClickRow = function(id) {
		return false;
	}
	
	bomGridObj.onSelectRow = function (id) {
		if(id) {
			//scrollToFrame();
			var iframe = document.getElementById("svgIframe").contentWindow;
			if(typeof iframe.moveSvg == "function"){
					iframe.moveSvg(id);
			}
		}
	}
	
	bomGridObj.gridComplete = function(){
		var ids = jQuery("#bom_data_grid").jqGrid('getDataIDs');
		for(var i=0;i < ids.length;i++){
			var id = ids[i];
			
			var list = jQuery("#bom_data_grid").jqGrid('getRowData', id);
			var col1 = list.column_1 *1;
			var col6 = list.column_6 *1;
			
			var buttonHtml = "<a href='#' class='btn' onclick='addcart(" + id + ")'><i class='icon-shopping-cart'></i></a>";
				
				
			
		
			
			jQuery("#bom_data_grid").jqGrid('setRowData', id,{column_1: col1, column_6: col6, cart : buttonHtml});
		}
		
		
			$('#svgIframe').load(function(){
			    //your code (will be called once iframe is done loading)
			    if(highlightRow != -1){
					tableHighlight(highlightRow);
					var iframe = document.getElementById("svgIframe").contentWindow;
					if(typeof iframe.moveSvg == "function"){
						iframe.moveSvg(highlightRow);
						highlightRow = -1;
					}
			    }
			});
		
		document.getElementById("graph_area").innerHTML = "";
	};
	
	bomGridObj.pager = "#bom_data_grid_nav";
	
	//jQuery("#search_grid").jqGrid(obj);
	
	jQuery("#bom_data_grid").jqGrid(bomGridObj);

	jQuery("#bom_data_grid").jqGrid(
		'navGrid',
		'#bom_data_grid_nav',
		{edit:false,add:false,del:false,
			beforeRefresh: function(){
		        jQuery("#bom_data_grid").jqGrid('setGridParam',
    			 {
    			 	url : "AjaxAction.latis",
		        	datatype: "json",
		        	mtype: "POST",
		        	postData: str_data,
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
	   			
	   			var rowlist = jQuery("#bom_data_grid").jqGrid('getRowData');
	   			for(var i = 0; i < rowlist.length; i ++){
	   				var row = rowlist[i];
	   				
	   				var targetData = row[column];
	   				
	   				if(operator == "eq"){
	   					if(data != targetData){
		   					$('#bom_data_grid').jqGrid('delRowData', i+1);
	   					}
	   				}else if(operator == "cn"){
	   					if(targetData.indexOf(data) < 0){
		   					$('#bom_data_grid').jqGrid('delRowData', i+1);
	   					}
	   				}
	   					
	   				
	   			}
	   		}
	   	}
	);
	
	
	
	$(window).bind("resize", function () {
		jQuery("#bom_data_grid").setGridWidth($("#svgIframeDiv").width(), true);
		//$("#epc_grid").closest(".ui-jqgrid-bdiv").width($("#epc_grid").closest(".ui-jqgrid-bdiv").width());
	}).trigger("resize");
}

function addcart(id){
	var rowdata = $("#bom_data_grid").getRowData( id );
	
	var str_data = JSON.stringify({
		protocolName: "addCart",
		rowdata: rowdata
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			
			alert("Add part to My Cart");
			//alert(rslt_msg);
			//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
		},
		error: function (rslt_msg) {
			//document.getElementById("graph_area").innerHTML = "";
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
	
}

function getSelectSvg(svgId){
	var str_data = JSON.stringify({
		protocolName: "getSelectSvg",
		svgId: svgId
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			var path = rslt_msg;
			makeEpcList(path);
			
			//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
		},
		error: function (rslt_msg) {
			//document.getElementById("graph_area").innerHTML = "";
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
}

function getCurrentEpcCategory(svgId){
	var str_data = JSON.stringify({
		protocolName: "getCurrentEpcCategory",
		svgId: svgId
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			
			var selectHtml = rslt_msg.selectHtml;
			
			$("#categoryDiv").html(selectHtml);
			
			/*
			var categoryList = rslt_msg.split("/");
			for(var i = 0; i < categoryList.length; i++){
				var selectList = $("#categoryDiv select");
				//var categoryName = categoryList[i];
				for(var j = 0; j < selectList.size(); j ++){
					var selectBox = selectList.eq(i);
					var categoryName = categoryList[i];
					selectBox.val(categoryName);
					selectCategory(selectBox[0]);
				}
			}
			*/
			
		},
		error: function (rslt_msg) {
			//document.getElementById("graph_area").innerHTML = "";
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
}

function showCart(){
	$("#navi_content").html("");
	$("#contentTitle").html("<i class='icol-text-list-bullets'></i> Cart");
	//$("#epcDirectory").css("display", "none");
	document.getElementById("svgIframe").style.display = "none";
	document.getElementById("svgIframe").src = "";
	document.getElementById("svgDetailTable").style.display = "none";
	
	if(document.getElementById("searchResult").style.display == "none"){
		document.getElementById("searchResult").style.display = "";						
	}
	var str_data = JSON.stringify({
		protocolName: "showCart"
	});
	$("#search_grid").jqGrid("GridUnload");

	var lastsel;
	
	bomGridObj.postData = str_data;
	bomGridObj.rowNum = 20;
	bomGridObj.onSelectRow = function (id) {
		if(id) {
			if(id !== lastsel) {
				lastsel = id;
			} else {
				lastsel = "";
			}
		}
	};
	bomGridObj.ondblClickRow = function (id) {
		//$("[id^=btn_edit_]").hide();
		if(id && id !== lastsel) {
			var list = $("#search_grid").getRowData( id );
			var svgId = list.svg_id;
			var col1 = list.column_1;
			
			highlightRow = col1;
			getSelectSvg(svgId);
			getCurrentEpcCategory(svgId);
		}
	};
	
	bomGridObj.onSelectRow = function (id) {
		return false;
	};
	
	
	bomGridObj.gridComplete = function(){
		var ids = jQuery("#search_grid").jqGrid('getDataIDs');
		for(var i=0;i < ids.length;i++){
			var id = ids[i];
			
			var list = jQuery("#search_grid").jqGrid('getRowData', id);
			var svg_id = list.svg_id;
			var col1 = list.column_1 *1;
			var col6 = list.column_6 *1;
			
			svg_id = svg_id.split("|")[svg_id.split("|").length-1];
			
			
			jQuery("#search_grid").jqGrid('setRowData', id,{svg_name: svg_id, column_1: col1, column_6: col6});
		}
		document.getElementById("graph_area").innerHTML = "";
	};
	
	var colModel = bomGridObj.colModel;
	for(var i = 0 ; i < colModel.length; i ++){
		
		if(colModel[i].name == "column_1"){
			colModel[i].sorttype = 'int';
		}
		if(colModel[i].name == "cart"){
			colModel[i].hidden = true;
		}
		
		if(colModel[i].name == "svg_name"){
			colModel[i].hidden = false;
		}
	}
	
	bomGridObj.pager = "#search_grid_nav";
	
	//jQuery("#search_grid").jqGrid(obj);
	
	jQuery("#search_grid").jqGrid(bomGridObj);

	jQuery("#search_grid").jqGrid(
		"navGrid",
		"#search_grid_nav",
		{edit:false,add:false,del:false,
			beforeRefresh: function(){
		        jQuery("#search_grid").jqGrid('setGridParam',
    			 {
    			 	url : "AjaxAction.latis",
		        	datatype: "json",
		        	mtype: "POST",
		        	postData: str_data,
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
	   			
	   			var rowlist = jQuery("#search_grid").jqGrid('getRowData');
	   			for(var i = 0; i < rowlist.length; i ++){
	   				var row = rowlist[i];
	   				
	   				var targetData = row[column];
	   				
	   				if(operator == "eq"){
	   					if(data != targetData){
		   					$('#search_grid').jqGrid('delRowData', i+1);
	   					}
	   				}else if(operator == "cn"){
	   					if(targetData.indexOf(data) < 0){
		   					$('#search_grid').jqGrid('delRowData', i+1);
	   					}
	   				}
	   			}
	   		}
	   	}
	);
	
	$(window).bind("resize", function () {
		jQuery("#search_grid").setGridWidth($("#svgIframeDiv").width(), true);
		//$("#epc_grid").closest(".ui-jqgrid-bdiv").width($("#epc_grid").closest(".ui-jqgrid-bdiv").width());
	}).trigger("resize");
}

</script>