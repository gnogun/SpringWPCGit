<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<input id="contentNav" type="hidden" value="category" />
<div id="da-content-wrap" class="clearfix">
	<div id="da-content-area">
		<div class="row-fluid">
			<div class="span12">
				<div class="da-panel collapsible">
					<div class="da-panel-header">
						<span class="da-panel-title">
							<i class="icol-application-get"></i> Category Information Upload
						</span>
					</div>
					<form id="frm_epc_upload" name="frm_epc_upload" method="post" action="#" onsubmit="javascript:return false;">
						<div class="da-panel-content da-form-container da-form">					
							<div class="da-form-row">
								<div class="da-form-cols">
									<div class="da-form-item col-8-8">
										<label class="da-form-label" style="cursor:default">
											Category Information File (Office Excel File) <span class="required"> *</span>
										</label>						
										<input id="categoryUpload" type="file" name="files[]" data-url="FileUploadAction.latis" required="true" multiple>
										<div id="progress" class="progress" style="margin: 5px 0 5px 0; height:30px; width:100%; ">
									    	<div class="bar" style="height:100%; width: 0%; background-color:lightgreen"></div>
									    	<div class="text" style="height: 100%; width: 100%; text-align:right;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</form>				
				</div>
				<div class="da-panel collapsible">
					<div class="da-panel-header">
						<span class="da-panel-title">
							<i class="icol-page-white-stack"></i> Category Tree view
						</span>
					</div>
					<div class="da-panel-content da-form-container da-form">
						<div class="da-form-block">
							<div class="da-form-row">
								<div class="da-form-cols">									
									<div class="da-form-item col-3-8">
										<div id="categoryTree" style="height: 300px; oveflow-y:auto;">
											<ul>
								                <li></li>
								                <li class="isLazy isFolder"></li>
								            </ul>
										</div>
									</div>
									<div class="da-form-item col-5-8">
										<div class="da-form-row">
											<div class="da-form-cols" id="editCategoryNameDiv" style="display: none;">
												<div class="da-form-item col-4-8">
													<label class="da-form-label" style="cursor:default">
														Category Name
													</label>
													<input type="text" id="editCategoryInput" />
													<a href="#" class="btn" onclick="editCategoryName()"><i class="icon-pencil"></i> Rename</a>
													<a href="#" class="btn" onclick="deleteCategory()"><i class="icon-bin"></i> Delete</a>
													<a href="#" class="btn" onclick="addCategory()"><i class="icon-circle-plus"></i> Add Category</a>
													<a href="#" class="btn" onclick="showCategoryEpcList()"><i class="icon-book"></i> Set Wpc</a>
												</div>
												
											</div>
										</div>
										<div class="da-form-row">
											<div class="da-form-cols" id="editCategoryEpcDiv" style="display: none;">										
												<div class="da-form-item col-4-8">
													<label class="da-form-label" style="cursor:default">
														Wpc List
													</label>
													<select id="categoryEpcSelectList" name="categoryEpcSelectList" style="width:100%" multiple="multiple">
													</select>
													<a href="#" class="btn" onclick="setCategoryEpc()" style="float:right; margin-right:60px; margin-top:10px;"><i class="icon-circle-ok"></i> Submit</a>
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
	</div>
</div>

<div id="contenxtMenu"> </div>

<div id="dialog_confirm" style="display:none;">
	<p>&nbsp;</p>
	<p>Are you sure?</p>
	<p>&nbsp;</p>
</div>

<script type="text/javascript">

var categoryUpload = null;
var easyTree1 = null;

$(document).ready(function () {	
	setFileUpload();
	buildCategoryTree();
	
	$("#categoryEpcSelectList").multiSelect({
		selectableHeader: "<input type='text' id='categoryEpcSearch' autocomplete='off'/><p><img src='assets/images/bg/blank.png' height=10/></p>",
		selectionHeader: "<p>&nbsp;</p><p><img src='assets/images/bg/blank.png' height=10/></p>"
	});
    
});

function setFileUpload(){
	categoryUpload = $('#categoryUpload').fileupload({
        dataType: 'json',
        done: function (e, data) {
        	
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
   			if(!confirm("기존 카테고리 정보는 전부 사라지고 새로 설정 됩니다. 계속 하시겠습니까?")){
	   			categoryUpload.abort();
   			}
	    },
	    dropZone: null
    });
}

function buildCategoryTree(){
	easyTree1 = $('#categoryTree').easytree({
        dataUrl: 'TreeAction.latis?protocolName=category&path=category',
        stateChanged: stateChanged
    });
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
	var currentId = $("#categoryTree .easytree-active").attr("id");
	if(currentId != undefined){
		
		var node = easyTree1.getNode(currentId);
		
		if(node.isFolder){
			var categoryName = node.text;
			
			$("#editCategoryNameDiv").css("display", "block");
			
			$("#editCategoryInput").val(categoryName);
		}else{
			$("#editCategoryNameDiv").css("display", "none");
			$("#editCategoryInput").val("");
			
		}
		
		$("#editCategoryEpcDiv").css("display", "none");
		
	}
}

function editCategoryName(){
	var oldName = "";
	var newName = "";
	
	var currentId = $("#categoryTree .easytree-active").attr("id");
	if(currentId != undefined){		
		var node = easyTree1.getNode(currentId);
		oldName = node.text;
	}
	
	newName = $("#editCategoryInput").val();
	
	if(newName.length > 20){
		alert("category name must under 20 length");
		$("#editCategoryInput").val(oldName);
	}else{
	
		var str_data = JSON.stringify({
			protocolName: "editCategoryName",
			oldName: oldName,
			newName: newName
		});
		
		$.ajax({
			type: "POST",
			url: "AjaxAction.latis",
			data: str_data,
			dataType: "text",
			success: function (rslt_msg) {
				easyTree1 = null;
				easyTree1 = $('#categoryTree').easytree({
			        dataUrl: 'TreeAction.latis?protocolName=category&path=category',
			        stateChanged: stateChanged
			    });
			},
			error: function (rslt_msg) {
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
			}
		}); 
	}
	
	
	
}

function deleteCategory(){
	
	$("#dialog_confirm").dialog({
		autoOpen: false,
		title: "Delete Category",
		modal: true,
		width: "440",
		buttons: [{
			text: "Submit",
			click: function () {
				var categoryName = "";
				var currentId = $("#categoryTree .easytree-active").attr("id");
				if(currentId != undefined){		
					var node = easyTree1.getNode(currentId);
					categoryName = node.text;
				}
				
				var str_data = JSON.stringify({
					protocolName: "deleteCategory",
					categoryName: categoryName
				});
				
				$.ajax({
					type: "POST",
					url: "AjaxAction.latis",
					data: str_data,
					dataType: "text",
					success: function (rslt_msg) {
						easyTree1 = null;
						easyTree1 = $('#categoryTree').easytree({
					        dataUrl: 'TreeAction.latis?protocolName=category&path=category',
					        stateChanged: stateChanged
					    });
						$("#dialog_confirm").dialog("close");
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

function addCategory(){
	var categoryName = "";
	
	var newName = "";
	var parent = "";
	var index = "";
	newName = $("#editCategoryInput").val();
	
	var currentId = $("#categoryTree .easytree-active").attr("id");
	if(currentId != undefined){		
		var node = easyTree1.getNode(currentId);
		categoryName = node.text;
		index = node.children.length;
		parent = currentNode(easyTree1.getAllNodes(), node, "");
		parent = parent.substring(0, parent.lastIndexOf("/"));
		
	}
	
	if(newName.length > 20){
		alert("category name must under 20 length");
		$("#editCategoryInput").val(categoryName);
	}else{
		
		var str_data = JSON.stringify({
			protocolName: "addCategory",
			parentCategory: parent,
			oldName: categoryName,
			newName: newName,
			index: index
		});
		
		$.ajax({
			type: "POST",
			url: "AjaxAction.latis",
			data: str_data,
			dataType: "text",
			success: function (rslt_msg) {
				easyTree1 = null;
				easyTree1 = $('#categoryTree').easytree({
			        dataUrl: 'TreeAction.latis?protocolName=category&path=category',
			        stateChanged: stateChanged
			    });
			},
			error: function (rslt_msg) {
				$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
			}
		}); 
	}
	
}

function showCategoryEpcList(){
	$("#editCategoryEpcDiv").css("display", "block");
	
	var categoryName = "";
	var parent = "";
	
	var currentId = $("#categoryTree .easytree-active").attr("id");
	if(currentId != undefined){		
		var node = easyTree1.getNode(currentId);
		categoryName = node.text;
		parent = currentNode(easyTree1.getAllNodes(), node, "");
		parent = parent.substring(0, parent.lastIndexOf("/"));
	}
	
	var str_data = JSON.stringify({
		protocolName: "showCategoryEpcList",
		categoryName: categoryName,
		parent: parent
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "json",
		success: function (rslt_msg) {
			$("#categoryEpcSelectList option").remove();
			var selectList = $("#categoryEpcSelectList");
			
			var noCategoryEpcList = rslt_msg.noCategoryEpc;
			var currentCategoryEpcList = rslt_msg.currentCategoryEpc;
			
			for(var key in noCategoryEpcList){
				var epcName = key;
				selectList.append("<option value='" + epcName + "'>" + epcName + "</option>");
			}
			
			for(var j = 0; j < currentCategoryEpcList.length; j ++){
				
				var epcName = currentCategoryEpcList[j];
				selectList.append("<option value='" + epcName + "' selected='selected' >" + epcName + "</option>");
				
			}
			
			$("#categoryEpcSelectList").multiSelect("refresh");			
			
			$("#categoryEpcSearch").quicksearch($(".ms-elem-selectable", "#ms-categoryEpcSelectList")).on("keydown", function(e){
				if (e.keyCode == 40){
					$(this).trigger("focusout");
					$("#categoryEpcSelectList").focus();
					return false;
				}
			});
			
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
}

function setCategoryEpc(){
	var categoryName = "";
	var parent = "";
	var epcList = "";
	
	var currentId = $("#categoryTree .easytree-active").attr("id");
	if(currentId != undefined){		
		var node = easyTree1.getNode(currentId);
		categoryName = node.text;
		parent = currentNode(easyTree1.getAllNodes(), node, "");
		parent = parent.substring(0, parent.lastIndexOf("/"));
	}
	
	epcList = $("#ms-categoryEpcSelectList li.ms-elem-selection.ms-selected").map(function() {
		return this.children[0].innerHTML;
	}).get().join(",");
	
	var str_data = JSON.stringify({
		protocolName: "setCategoryEpc",
		categoryName: categoryName,
		parent: parent,
		epcList: epcList
	});
	
	$.ajax({
		type: "POST",
		url: "AjaxAction.latis",
		data: str_data,
		dataType: "text",
		success: function (rslt_msg) {
			$("#editCategoryNameDiv").css("display", "none");
			$("#editCategoryInput").val("");
			
			easyTree1 = null;
			easyTree1 = $('#categoryTree').easytree({
		        dataUrl: 'TreeAction.latis?protocolName=category&path=category',
		        stateChanged: stateChanged
		    });
			$("#editCategoryEpcDiv").css("display", "none");
			
		},
		error: function (rslt_msg) {
			$.jGrowl("Error in " + rslt_msg + ".", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_error2"});
		}
	}); 
	
	
}
	
function showConfirmDialog(){
	$("#dialog_confirm").dialog("open");
}

</script>