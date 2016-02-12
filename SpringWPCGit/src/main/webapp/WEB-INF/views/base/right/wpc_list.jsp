<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input id="contentNav" type="hidden" value="epcUpload" />
<div id="da-content-wrap" class="clearfix">
	<div id="da-content-area">
		<div class="row-fluid">
			<div class="span12">
				<div class="da-panel collapsible">
					<div class="da-panel-header">
						<span class="da-panel-title">
							<i class="icol-doc-convert"></i> WPC Upload list
						</span>
					</div>
					<form id="frm_epc_search" name="frm_epc_search" method="post" action="#" onsubmit="javascript:return false;">
						<div id="epc_width" class="da-panel-content da-form-container da-form" style="border-bottom:none">
							<div class="da-form-row">
								<div class="da-form-item inline-form-right">									
									<span>
										<img src="assets/images/bg/blank.png" width="10" height="1" />
									</span>
									<span>
										<input id="srch_epc_kword" name="srch_epc_kword" type="text" style="width:120px;" minlength="2" />
									</span>
									<span>
										<img src="assets/images/bg/blank.png" width="4" height="1" />
									</span>
									<span>
										<button class="btn" onclick="javascript:srchEPC()"><i class="icon-search"></i>
											&nbsp;
											Search
										</button>
									</span>
								</div>
							</div>
						</div>
						<div class="da-form">
							<div style="width:100%;height:100%">
								<table id="epc_grid"></table>
								<div id="epc_grid_nav"></div>
							</div>
						</div>						
					</form>
				</div>
				
				<div class="da-panel collapsible collapsed">
					<div class="da-panel-header">
						<span class="da-panel-title">
							<i class="icol-application-get"></i> WPC Upload
						</span>
					</div>
					<form id="frm_epc_upload" name="frm_epc_upload" method="post" action="#" onsubmit="javascript:return false;">
						<div class="da-panel-content da-form-container da-form">					
							<div class="da-form-row">
								<div class="da-form-cols">
									<div class="da-form-item col-8-8">
										<label class="da-form-label" style="cursor:default">
											WPC Set upload (*.zip File) <span class="required"> *</span>
										</label>						
										<input id="epcupload" type="file" name="files[]" data-url="FileUploadAction.latis" required="true" multiple>
										<div id="progress" class="progress" style="margin: 5px 0 5px 0; height:30px; width:100%; ">
									    	<div class="bar" style="height:100%; width: 0%; background-color:lightgreen"></div>
									    	<div class="text" style="height: 100%; width: 100%; text-align:right;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<div class="da-panel-content da-form-container da-form">
						<div class="da-form-row">
							<div class="da-form-cols">
								<div class="da-form-item col-4-8">
									<table id="uploaded-files" class="table" style="width:100%">
										<tr>
											<th>File Name</th>
											<th>File Size</th>
											<th>File Type</th>
											<th>Upload Confirm</th>
										</tr>
									</table>
								</div>	
							</div>
						</div>
					</div>
				</div>
				
				<div class="da-panel collapsible collapsed">
					<div class="da-panel-header">
						<span class="da-panel-title">
							<i class="icol-page-white-stack"></i> WPC Tree view
						</span>
					</div>
					<form id="frm_epc_frag" name="frm_epc_frag" class="da-form" method="post" action="#" onsubmit="javascript:return false">
						<div class="da-panel-content da-form-container da-form">
							<div class="da-form-block">
								<div class="da-form-row">
									<div class="da-form-cols">
										<div class="da-form-item col-2-8">
											<label class="da-form-label" style="cursor:default">
												SVG, BOM Upload
											</label>
											<input id="svgBomUpload" type="file" name="files[]" data-url="FileUploadAction.latis" required="true" multiple>
										</div>
										<div class="da-form-item col-3-8">
											<label class="da-form-label" style="cursor:default">
												(Drag to target directory) 
											</label>
											<div id="uploadFileList">
												
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>
					<div class="da-panel-content da-form-container da-form">
						<div class="da-form-block">
							<div class="da-form-row">
								<div class="da-form-cols">									
									<div class="da-form-item col-3-8">
										<div id="graph_area">
        								</div>
        								<label class="da-form-label" style="cursor:default">
											Target Directory
										</label>
										<div id="epcDirectory">
											<ul>
								                <li></li>
								                <li class="isLazy isFolder"></li>
								            </ul>
										</div>
									</div>
									<div class="da-form-item col-2-8">
										<label class="da-form-label" style="cursor:default">
											Log Table
										</label>
								    	<div id="logTable" style="width:100%; height:200px; border: 1px solid rgba(0,0,0,0.25); overflow: auto;">
								    	
								    	</div>
								    	
								    	<div class="editpanel">											
								    		<input type="text" id="editInput" />
								    		<button onclick="editOk()">Edit Name</button>
								    	</div>
									</div>
								</div>
							</div>
						</div>
					</div>					
				</div>
			</div>
		</div>
	</div>
</div>

<div id="contenxtMenu"> </div>

<div id="dialog_confirm" style="display:none;">
	<p>&nbsp;</p>
	<p>Are you sure?</p>
	<p>&nbsp;</p>
</div>

<script type="text/javascript">
(function ($) {
	$(document).ready(function (e) {
		
	epcUpload = $('#epcupload').fileupload({
        dataType: 'json',        
        done: function (e, data) {
        	//$("tr:has(td)").remove();
            $.each(data.result, function (index, file) {
                $("#uploaded-files").append(
                		$('<tr style="text-align:center;" />')
                		.append($('<td/>').text(file.fileName))
                		.append($('<td/>').text(file.fileSize))
                		.append($('<td/>').text(file.fileType))
                		.append($('<td/>').html("<button class='btn' onclick=\"uploadEpcManageStart('" + file.fileName + "')\"><i class='icol-accept'></i>Confirm</button>"))
                )
            });
        },
        progressall: function (e, data) {
	        var progress = parseInt(data.loaded / data.total * 100, 10);
	        $('#progress .bar').css(
	            'width',
	            progress + '%'
	        );
	        
	        $('#progress .text').html(progress + " %");
   		},
   		beforeSend:function(){
   			 var files = this.files;
   			 for(var i = 0; i < files.length; i++){
   			 	var fileType = files[i].type;
   			 	
   			 	if(fileType.indexOf("zip") < 0){
   			 		alert("ZIP File only");
   			 		epcUpload.abort();
   			 		
   			 	}
   			 }
	    },
	    dropZone: null
    });
    
    
	    
	 svgBomUpload =  $('#svgBomUpload').fileupload({
	        dataType: 'json',        
	        done: function (e, data) {
	        	$.each(data.result, function (index, file) {
	        		var svgBomInfoObj = {}
	        		svgBomInfoObj.text = file.fileName;
	        		svgBomInfoObj.tooltip = file.fileName + "(" + file.fileType + ")";
	        		
	        		uploadJson.push(svgBomInfoObj);
	            });
        		easyTree2.rebuildTree();
				
	        },
	   		beforeSend:function(){
	   			 var files = this.files;
	   			 for(var i = 0; i < files.length; i++){
	   			 	var fileType = files[i].type;
	   			 	
	   			 	if(fileType.indexOf("svg") < 0){
	   			 		if(fileType.indexOf("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet") < 0){
		   			 		alert("SVG, BOM File only");
		   			 		svgBomUpload.abort();
	   			 		}
	   			 	}
	   			 }
		    },
		    dropZone: null
	    });
	    
		showGrid();
		
		easyTree1 = $('#epcDirectory').easytree({
			enableDnd: true,
            openLazyNode: openLazyNode,
            dataUrl: 'TreeAction.latis?protocolName=upload&path=root',
            stateChanged: stateChanged
        });
        
        
					    
	    easyTree2 = $('#uploadFileList').easytree({
	    	enableDnd: true,
	    	data : uploadJson,
	    	dropped: dropped2
	    });
        
	});
})(jQuery);
var easyTree1;
var easyTree2;
var epcUpload;
var svgBomUpload;

var uploadJson = [];

var option = { width: 150, items: [
        { text: "Create Folder", icon: "assets/js/plugins/context/sample-css/wi0126-16.gif", alias: "create", action: addItem },
        { type: "splitLine" },
        { text: "Delete Item", icon: "assets/js/plugins/context/sample-css/ac0036-16.gif", alias: "delete", action: deleteItem },
        { text: "Export Item", icon: "assets/js/plugins/context/sample-css/ac0036-16.gif", alias: "export", action: exportItem },
	],               
    onShow: applyrule
};

var whiteboardText = '';
function updateWhiteboard(text) {
    if (!text) { return; }
    whiteboardText = text + '<br />' + whiteboardText;
    $('#logTable').html(whiteboardText);
}

//var checkFile = false;


function stateChanged(nodes, jsonString){
	var currentId = $("#epcDirectory .easytree-drag-source").attr("id");
	if(currentId != undefined){
        $( "#"+currentId ).contextmenu(option);
        /*
        var className = $("#epcDirectory .easytree-active").attr("class");
        
        if(className != undefined && className.indexOf("easytree-ico-cf") < 0){
        	checkFile = true;
        }else{
        	checkFile = false;
        }
        */
		var node = easyTree1.getNode(currentId);
		$("#editInput").val(node.text); 
	}
}

function dropped2(event, nodes, isSourceNode, source, isTargetNode, target) {
	if(source.text != undefined){
		updateWhiteboard('drop2 - Upload ' + source.text + ' to ' + target.textContent);
		if (isSourceNode && !isTargetNode) { // Right to left drop
	        easyTree2.removeNode(source.id);
	        easyTree1.addNode(source, target.id);
	        easyTree1.rebuildTree(); // rebuild 'other' tree
	    }else{
	   		//alert("do not Dnd");
	    }
	    updateWhiteboard('Upload ' + source.text + ' to ' + target.textContent);
	    insertList(source);
	    
	    
	}else{
		updateWhiteboard('dont allow dir to dir');
		alert('dont allow dir to dir');
		
		return;
		/*
		easytree1 = null;
		easyTree1 = $('#epcDirectory').easytree({
			enableDnd: true,
            openLazyNode: openLazyNode,
            dataUrl: 'TreeAction.latis?path=root',
            stateChanged: stateChanged
        });
        */
	}
	
	
	//easyTree1.options.enableDnd = true;
	/*
    if (isSourceNode && !isTargetNode) { // Right to left drop
        easyTree2.removeNode(source.id);
        easyTree1.addNode(source, target.id);
        easyTree1.rebuildTree(); // rebuild 'other' tree
    }else{
   		//alert("do not Dnd");
    }
    
    updateWhiteboard('Upload ' + source.text + ' to ' + target.text);
    insertList(source);
    */
}

function insertList(source){
	var temp = currentNode(easyTree1.getAllNodes(), source, "");
	var str_data = JSON.stringify({
		protocolName: "uploadedSvgBomProcess",
		pathData: temp
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			document.getElementById('graph_area').innerHTML = "";
			easytree1 = null;
			easyTree1 = $('#epcDirectory').easytree({
				enableDnd: true,
	            openLazyNode: openLazyNode,
	            dataUrl: 'TreeAction.latis?path=root',
	            stateChanged: stateChanged
	        });
			$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
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

function applyrule(menu) {
	var node = easyTree1.getNode(this.id);
	if(node.isFolder == undefined || node.isFolder == false) {
		menu.applyrule({ name: this.id,
			disable: true,
			items: ["create"]
		});
	}else{	
		menu.applyrule({ name: this.id,
			disable: false,
			items: ["create","delete","export"]
		});
	}
	
}

function addItem(){
	var currentId = $("#epcDirectory .easytree-drag-source").attr("id");
	if(currentId != undefined){
		var sourceNode = {
			text: "New Item",
			isFolder: true
		};
		easyTree1.addNode(sourceNode, currentId);
		var currentChildren = easyTree1.getNode(currentId).children;
		var addedNode = currentChildren[currentChildren.length -1];
		
		var temp = currentNode(easyTree1.getAllNodes(), addedNode, "");
		
		var str_data = JSON.stringify({
			protocolName: "addNewFolder",
			pathData: temp
		});
		
		$.ajax({
			type: "POST",
			url: "AjaxAction.latis",
			data: str_data,
			dataType: "text",
			success: function (rslt_msg) {
				document.getElementById('graph_area').innerHTML = "";
				if(rslt_msg == "fail"){
					easyTree1.removeNode(currentId);
					$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
				}
				easyTree1.rebuildTree();
			},
			error: function (rslt_msg) {
				document.getElementById("graph_area").innerHTML = "";
				easyTree1.removeNode(currentId);
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
				easyTree1.rebuildTree();
			},
			beforeSend:function(){
				var target = document.getElementById('graph_area');
				var spinner = new Spinner(opts).spin(target);
		    }
		}); 
		
		easyTree1.rebuildTree();
	}
}

function showConfirmDialog(){
	
}

function deleteItem(){
	$("#dialog_confirm").dialog({
		autoOpen: false,
		title: "Delete Item",
		modal: true,
		width: "440",
		buttons: [{
			text: "Submit",
			click: function () {			
				var currentId = $("#epcDirectory .easytree-drag-source").attr("id");
				if(currentId != undefined){
					
					var temp = currentNode(easyTree1.getAllNodes(), easyTree1.getNode(currentId), "");
					
					var protocolName = "";
					
					if(temp.indexOf("/") > -1){
						protocolName = "deleteFile";
					}else{
						protocolName = "deleteEpc";
					}
					
					var str_data = JSON.stringify({
						protocolName: protocolName,
						pathData: temp
					});
					
					$.ajax({
						type: "POST",
						url: "AjaxAction.latis",
						data: str_data,
						dataType: "text",
						success: function (rslt_msg) {
							easyTree1.removeNode(currentId);
							easyTree1.rebuildTree();
							document.getElementById('graph_area').innerHTML = "";
						},
						error: function (rslt_msg) {
							document.getElementById("graph_area").innerHTML = "";
							$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
							easyTree1.rebuildTree();
						},
						beforeSend:function(){
							var target = document.getElementById('graph_area');
							var spinner = new Spinner(opts).spin(target);
					    }
					});
					
					easyTree1.rebuildTree();
					
				}
			}
		},
		{
			text: "Close",
			click: function () {
				$("#dialog_confirm").dialog("close");
			}
		}]
	});
	
	$("#dialog_confirm").dialog("open");
	
	
}

function exportItem(){
	
}

function editOk(){
	var currentId = $("#epcDirectory .easytree-drag-source").attr("id");
	if(currentId != undefined){
		var inputValue = $("#editInput").val();
		if(inputValue != ""){
			var nodes = easyTree1.getAllNodes();
			var node = easyTree1.getNode(currentId);
			var temp = currentNode(nodes, node, "");
			
			if(!node.isFolder || node.text == 'New Item'){
				var str_data = JSON.stringify({
					protocolName: "editPathName",
					path: temp,
					newName: inputValue
				});
			       
				$.ajax({
					type: "POST",
					url: "AjaxAction.latis",
					data: str_data,
					dataType: "text",
					success: function (rslt_msg) {
						var currentId = $("#epcDirectory .easytree-drag-source").attr("id");
						var node = easyTree1.getNode(currentId);
						updateWhiteboard("change name'" + node.text + "' to '" + $("#editInput").val() + "'");
						
						node.text = $("#editInput").val();
						easyTree1.rebuildTree();			
						$("#editInput").val("");
					},
					error: function (rslt_msg) {
						$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
					}
				});
			}else{
				alert("not allow edit directory name");
				updateWhiteboard("not allow edit directory name");
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
    
    node.lazyUrl = "TreeAction.latis?protocolName=upload&path=" + temp; // must be set here or when the tree is initialised
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

function showGrid() {

	var lastsel;
	var data = JSON.stringify({	protocolName: "loadUploadEpcStatList"});

	jQuery("#epc_grid").jqGrid({
		url: "AjaxAction.latis",
		datatype: "json",
		mtype: "POST",
		ajaxRowOptions: { async: false },
		postData: data,
		jsonReader: {
			page: "page",
			total: "total",
			root: "gridData",
			records: function (obj) { obj.length; },
			repeatitems: false,
			id: "user_seqn"
		},
		
		
		colNames: ["WPC Name", "User ID", "Create date", "Last modified data", "Status", ""],
		colModel: [
			{ name: "model_id", index: "model_id", width: 80, align: "center", sortable: true },
			{ name: "id", index: "id", width: 30, align: "center", sortable: true },
			{ name: "create_date", index: "create_date", width: 30, align: "center", sortable: true },	
			{ name: "create_date", index: "create_date", width: 30, align: "center", sortable: true },				
			{ name: "stat", index: "stat", width: 20, sortable: true, align: "center"},
			{ name: "act", index: "act", width: 20, sortable: true, align: "center"}
		],
		autowidth: true,
		caption: "",	//table title
		deepempty: true,
		editurl: "",
		gridComplete: function () {
			var ids = jQuery("#epc_grid").jqGrid("getDataIDs");
			for (var i = 0; i < ids.length; i++) {
				var id = ids[i];
				
				var deleteButton = "<a href='#' class='btn' onclick='deleteEpc(" + id + ")'><i class='icon-bin'></i></a>";
				jQuery("#epc_grid").jqGrid("setRowData", id, {act: deleteButton});
			}
		},
		grouping: false,
		height: "100%",
		loadonce: true,	
		pager: "#epc_grid_nav",
		rownumbers: true,
		rowNum: 20,
		rowList: [10, 20, 30, 50],
		scrollOffset: 0,
		shrinkToFit: false,
		sortorder: "desc",
		viewrecords: true
	});

	jQuery("#epc_grid").jqGrid(
		"navGrid",
		"#epc_grid_nav",
		{edit:false,add:false,del:false,
			beforeRefresh: function(){
		        jQuery("#epc_grid").jqGrid('setGridParam',
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
	   			
	   			var rowlist = jQuery("#epc_grid").jqGrid('getRowData');
	   			for(var i = 0; i < rowlist.length; i ++){
	   				var row = rowlist[i];
	   				
	   				var targetData = row[column];
	   				
	   				if(operator == "eq"){
	   					if(data != targetData){
		   					$('#epc_grid').jqGrid('delRowData', i+1);
	   					}
	   				}else if(operator == "cn"){
	   					if(targetData.indexOf(data) < 0){
		   					$('#epc_grid').jqGrid('delRowData', i+1);
	   					}
	   				}
	   			}
	   		}
	   	}
	);

	
	
	$(window).bind("resize", function () {
		jQuery("#epc_grid").setGridWidth($("#epc_width").width(), true);
		//$("#epc_grid").closest(".ui-jqgrid-bdiv").width($("#epc_grid").closest(".ui-jqgrid-bdiv").width());
	}).trigger("resize");

	$("#user_grid_rn").css("width", "23px");
}

function deleteEpc(idx){
	
	$("#dialog_confirm").dialog({
		autoOpen: false,
		title: "Delete WPC",
		modal: true,
		width: "440",
		buttons: [{
			text: "Submit",
			click: function () {			
				var list = jQuery("#epc_grid").jqGrid("getRowData", idx);
				
				var str_data = JSON.stringify({
					protocolName: "deleteEpc",
					pathData: list.model_id
				});
			       
				$.ajax({
					type: "POST",
					url: "AjaxAction.latis",
					data: str_data,
					dataType: "text",
					success: function (rslt_msg) {
						if (rslt_msg == "0") {
							//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
							reloadGrid();				
						} else if(rslt_msg == "1") {
							$.jGrowl("No Data.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
						} else if(rslt_msg == "2") {
							$.jGrowl("Session timed out. Try signing in again.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
						} else {
							//JSON2CSV(rslt_msg, "User List", true, false);
						}
					},
					error: function (rslt_msg) {
						$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
					}
				}); 
			}
		},
		{
			text: "Close",
			click: function () {
				$("#dialog_confirm").dialog("close");
			}
		}]
	});
	
	$("#dialog_confirm").dialog("open");
	
	
	
	
}

function uploadEpcManageStart(fileName){
	var str_data = JSON.stringify({
		protocolName: "uploadEpcManageStart",
		epcName: fileName
	});
       
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			if (rslt_msg == "0") {
				//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});
				reloadGrid();
				uploadEpcManageProgress(fileName);
			} else if(rslt_msg == "1") {
				$.jGrowl("No Data.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else if(rslt_msg == "2") {
				$.jGrowl("Session timed out. Try signing in again.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else {
				//JSON2CSV(rslt_msg, "User List", true, false);
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
}

function uploadEpcManageProgress(fileName){
	var str_data = JSON.stringify({
		protocolName: "uploadEpcManageProgress",
		epcName: fileName
	});
       
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			if (rslt_msg == "0") {
				//$.jGrowl("Successed.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_blue2"});				
			} else if(rslt_msg == "1") {
				$.jGrowl("No Data.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else if(rslt_msg == "2") {
				$.jGrowl("Session timed out. Try signing in again.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
			} else {
				//JSON2CSV(rslt_msg, "User List", true, false);
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	});
}

function srchEPC() {
	$("#frm_epc_search").submit();
	
	var data = JSON.stringify({
		protocolName: "searchEpcStatList",
		keyword: $("#srch_epc_kword").val()
	});
	
	jQuery("#epc_grid").jqGrid("setGridParam", {
		url: "AjaxAction.latis",
		datatype: "json",
		postData: data,
		page: 1
	}).trigger("reloadGrid");
	
}

function addEPC() {
	var v_dialog_title = "Upload EPC";
	//show dialog
	$("#dialog_add_epc_div").dialog("option", { title: v_dialog_title, modal: true }).dialog("open");
}

function uploadEpcManage(){
	var str_data = {protocolName: "uploadEpcManage"};
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		contentType : 'application/json;charset=UTF-8', // 서버 요청시 전송할 데이터가 UTF-8 형식의 JSON 객체임을 명시
 		data : JSON.stringify(str_data),
		dataType: "text",
		success: function (rslt_msg) {
			if(rslt_msg != "false" && rslt_msg != ""){				 
				//alert("!");
			}else{
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});
			}
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error1"});			
		}
	});
}

function reloadGrid(){
	$("#srch_epc_kword").val("");
	var data = JSON.stringify({	protocolName: "loadUploadEpcStatList"});
	jQuery("#epc_grid").jqGrid("setGridParam", {
		url: "AjaxAction.latis",
		datatype: "json",
		postData: data,
		page: 1
	}).trigger("reloadGrid");
}




</script>