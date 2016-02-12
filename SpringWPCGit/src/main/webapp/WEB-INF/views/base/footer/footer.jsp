<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<% 
	String manageAuth = request.getParameter("manageAuth");
	if(manageAuth.equals("a")){
%>
		<%@include file="footer1.jsp" %>	
<%
	} else if(manageAuth.equals("s")){
%>
<%
	} else if(manageAuth.equals("u")){
%>

<%
	}
%>