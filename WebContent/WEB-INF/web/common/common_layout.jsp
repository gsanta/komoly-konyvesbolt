<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-definition>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<link href='http://fonts.googleapis.com/css?family=Noto+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
			<link href='css/style.css' rel='stylesheet' type='text/css'>			
			
			<script type="text/javascript" src="${contextPath}/js/jquery-1.7.1.js"></script>
  		</head>
		
		<body>
		<div id="fenticsik">
			<s:layout-component name="login">
				
			</s:layout-component>
		</div>
		  <div id="container">
		  	<div id="header"> 
		  	<img src="images/logo.png" alt="logo" />
		  	<img src="images/logo2.png" alt="logo" />
		  	</div>
			<s:layout-component name="body"></s:layout-component>
			
			<div id="footer"> 
		  	Adatb alapú házi. 
		  	</div>
		  </div>
		</body>
	</html>
</s:layout-definition>