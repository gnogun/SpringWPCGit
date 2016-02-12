<%@ page language="java" contentType="text/html;charset=utf-8"%>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<h1>${manageAuth }</h1>
<div id="da-content">
	<!-- Container -->
	<div class="da-container clearfix">
		<!-- Sidebar Separator do not remove -->
		<div id="da-sidebar-separator"></div>
		<!-- Sidebar -->
		<c:if test="${manageAuth !='user'}">
			<div id="da-sidebar">
				<!-- Navigation Toggle for < 480px -->
				<div id="da-sidebar-toggle"></div>
				<!-- Main Navigation -->
				<div id="da-main-nav" class="btn-container">
					<ul>
						<c:if test="${manageAuth=='admin'}">
						
							<li id="side_userManage">
								<!-- <a href="wpc.latis?pageName=userManage" style="left: 0px; top: 0px" >--><!-- Icon Container -->
								<a href="userManage.do" style="left: 0px; top: 0px" >
									<span class="da-nav-icon" style="top: 65%;">
										<i class="icol-user-business">
										</i>
									</span>
									User Manage
								</a>
							</li>							
							<li id="side_groupManage">
								<!-- <a href="wpc.latis?pageName=groupManage" style="left: 0px; top: 0px" > --><!-- Icon Container -->
								<a href="groupManage.do" tyle="left: 0px; top: 0px" >
									<span class="da-nav-icon" style="top: 65%;">
										<i class="icol-group">
										</i>
									</span>
									Group Manage
								</a>
							</li>
							<li id="side_epcUpload">
								<!-- <a href="wpc.latis?pageName=upload" style="left: 0px; top: 0px" > --><!-- Icon Container -->
								<a href="upload.do" style="left: 0px; top: 0px" >
									<span class="da-nav-icon" style="top: 65%;">
										<i class="icol-doc-convert">
										</i>
									</span>
									WPC Upload
								</a>
							</li>
						</c:if>
						<li id="side_category">
							<!--<a href="wpc.latis?pageName=category" style="left: 0px; top: 0px" >--><!-- Icon Container -->
							<a href="category.do" style="left: 0px; top: 0px" >
								<span class="da-nav-icon" style="top: 65%;">
									<i class="icol-text-list-bullets">
									</i>
								</span>
								Category
							</a>
						</li>
						<li id="side_content">
							<!-- <a href="wpc.latis?pageName=index" style="left: 0px; top: 0px" > --><!-- Icon Container -->
							<a href="index.do" style="left: 0px; top: 0px" >
								<span class="da-nav-icon" style="top: 65%;">
									<i class="icol-layout-split">
									</i>
								</span>
								Contents
							</a>
						</li>						
					</ul>
				</div>
			</div>
		</c:if>