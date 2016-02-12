/*
* Copyright (c) 2013
* Left() & Right() by Latisglobal.com
*/

function Left(str, n){
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else
		return String(str).substring(0,n);
}

function Right(str, n){
	if (n <= 0)
		return "";
	else if (n > String(str).length)
		return str;
	else {
		var iLen = String(str).length;
		return String(str).substring(iLen, iLen - n);
	}
}

function setZero(month){
	return month < 10 ? "0" + month : month;
}

function currFormat(v_proc, v_price) {

	var v_str = v_price == "" ? "" : v_price.toString();

	if(v_proc == 0) {
		if(v_str.length > 3) {
			return v_str.replace(/,/g,"");
		} else {
			return v_str;
		}
	} else {
		if(v_str.length > 3) {
			return v_str.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		} else {
			return v_str;
		}
	}
}

function getStrByte(str) {
	var p, len = 0;
	for(p=0; p<str.length; p++) {
		(str.charCodeAt(p) > 255) ? len+=2 : len++;
	}
	return len;
}

function chkHan(v_str) {
	//if(v_str == null) return false;
	for(var i=0; i<v_str.length;i++) {
		var c = v_str.charCodeAt(i);
		//자음 모음
		if(0x3131 <=c && c <= 0x318E) {
			return 1;
		}
		//초중성 한글자
		if(0xAC00 <= c && c <= 0xD7A3) {
			return 2;
		}
	}
	return 0;
}

function monthDiff(user_begin) {

	var d1 = new Date(user_begin);
	var d2 = new Date();

	var d1Y = d1.getFullYear();
	var d2Y = d2.getFullYear();

	var d1M = d1.getMonth();
	var d2M = 12;

	return (d2M + 12 * d2Y) - (d1M + 12 * d1Y);
}

function JSON2CSV(JSONData, ReportTitle, ShowLabel, v_enc_yn) {
	//If JSONData is not an object then JSON.parse will parse the JSON string in an Object
	var arrData = typeof JSONData != "object" ? JSON.parse(JSONData) : JSONData;

	var v_esc_line;

	if(v_enc_yn) {
		v_esc_line = "\r\n";
	} else {
		v_esc_line = escape("\r\n");
	}

	var CSV = "";
	//Set Report title in first row or line
	//CSV += ReportTitle + "\r\n";

	//This condition will generate the Label/Header
	if(ShowLabel) {
		var row = "";
		//This loop will extract the label from 1st index of on array
		for (var index in arrData[0]) {
			//Now convert each value to string and comma-seprated
			row += index + ",";
		}
		row = row.slice(0, -1);
		//append Label row with line break
		CSV += row + v_esc_line;
	}

	//1st loop is to extract each row
	for (var i = 0; i < arrData.length; i++) {
		var row = "";

		//2nd loop will extract each column and convert it in string comma-seprated
		for (var index in arrData[i]) {
			row += "\"" + arrData[i][index] + "\",";
		}

		row.slice(0, row.length - 1);

		//add a line break after each row
		CSV += row + v_esc_line;
	}

	if (CSV == "") {
		$.jGrowl("Invalid data.", {header: "Contact Administrator.", position: "bottom-right",theme: "ylow_fail2"});
		return;
	}

	//Generate a file name
	var fileName = "";
	//this will remove the blank-spaces from the title and replace it with an underscore
	fileName += ReportTitle.replace(/ /g, "_");

	if(v_enc_yn) {
		CSV = escape(CSV);
	}

	//Initialize file format you want csv or xls
	var uri = "data:text/csv;charset=utf-8," + CSV;

	// Now the little tricky part.
	// you can use either>> window.open(uri);
	// but this will not work in some browsers
	// or you will not get the correct file extension
	//this trick will generate a temp <a /> tag
	var link = document.createElement("a");
	link.href = uri;

	//set the visibility hidden so it will not effect on your web-layout
	link.style = "visibility:hidden";

	var now = new Date();
	var v_now = now.getFullYear() + "" + (now.getMonth()+1) + "" + now.getDate();

	link.download = fileName + "_" + v_now + ".csv";

	//this part will append the anchor tag and remove it after automatic click
	document.body.appendChild(link);
	link.click();
	document.body.removeChild(link);
}