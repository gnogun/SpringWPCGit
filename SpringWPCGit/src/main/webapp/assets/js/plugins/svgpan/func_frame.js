var root = document.getElementsByTagName("svg")[0];
function selectText(gElement){
	var nodes = gElement.childNodes;
	for(var i=0; i < nodes.length; i++){		
		if(nodes[i].nodeName != "#text"){
			if(nodes[i].textContent !=""){
				var textVal = nodes[i].textContent;
				svgHighlight(nodes[i]);
				parent.tableHighlight(textVal);				
				break;
			}
		}
	}
}

function moveSvg(textVal){
	var textTags = document.getElementsByTagName("text");
	
	var matrix = getRoot(root).getCTM();
	//matrix.a - x축 확대
	//matrix.b - x축 비틀림
	//matrix.c - y축 비틀림
	//matrix.d - y축 확대
	//matrix.e - x좌표값
	//matrix.f - y좌표값
	
	var xVal = "";
	var yVal = "";
	
	for(var i = 0; i < textTags.length; i ++){
		var textTag = textTags[i];		
		if(textVal == textTag.firstChild.nodeValue){
			var transform = textTag.getAttribute("transform");
			if(transform != null){
				var start = transform.lastIndexOf("(") + 1;
				var end = transform.lastIndexOf(")");
				
				transform = transform.substring(start, end);
				
				var transformArr = transform.split(" ");
				xVal = transformArr[4];
				yVal = transformArr[5];	
			}else{
				xVal = textTag.getAttribute("x");
				yVal = textTag.getAttribute("y");
			}
			svgHighlight(textTag);
			break;
		}
	}
	
	//var svgWidth = $("#svgDiv").width();
	//var svgHeight = $("#svgDiv").height();
	
	var svgWidth = 800;
	var svgHeight = 600;
	
	xVal = xVal * matrix.a;		
	yVal = yVal * matrix.d; 

	xVal = (svgWidth/2) - xVal;
	yVal = (svgHeight/2) - yVal;
		
	matrix.e = xVal; 
	matrix.f = yVal;
	
	setCTM(getRoot(root), matrix);
}

function svgHighlight(textTag){
	removeSvgHighlight();
	var className = textTag.getAttribute("class");
	className = "svgHighlight " + className;
	textTag.setAttribute("class", className);
	/*
	var gElemnt = textTag.parentNode;
	var gChilds = gElemnt.childNodes;
	for(var i = 0; i < gChilds.length; i ++){
		if(gChilds[i].nodeName == "path" || gChilds[i].nodeName == "rect" || gChilds[i].nodeName == "polygon"){
			gChilds[i].setAttribute("class", "svgHighlight");
			break;
		}
	}
	*/
}

function removeSvgHighlight(){
	if($(".svgHighlight").length != 0){
		var className = $(".svgHighlight")[0].getAttribute("class");
		className = className.replace("svgHighlight ", "");
		$(".svgHighlight")[0].setAttribute("class", className);	
	}	
}
