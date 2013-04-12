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
				<div id="login">
					<s:form beanclass="komoly.action.LoginActionBean">
						<span><s:label name="label.email" for="email" /></span>
						<s:text id="email" name="email" />
						<span><s:label name="label.password" for="password"/></span>
						<s:password id="password" name="password" />
						<s:submit name="login" />
					</s:form>
				</div>
			</s:layout-component>
		</div>
		  <div id="container">
		  	<div id="header"> 
		  		<img src="images/logo.png" alt="logo" />
		  		<img src="images/logo2.png" alt="logo" />
		  		<br>
		  		<s:link beanclass="komoly.action.HomeActionBean">
		  			Főoldal
		  		</s:link>
		  		<s:link beanclass="komoly.action.BooksActionBean">
		  			Könyvek
		  		</s:link>
		  		<s:link beanclass="komoly.action.OwnBookUploadActionBean">
		  			Könyv feltöltés
		  		</s:link>
		  	</div>
			<s:layout-component name="body"></s:layout-component>
			
			<div id="footer"> 
		  	Adatb alapú házi. 
		  	</div>
		  </div>
		</body>
	</html>
</s:layout-definition>