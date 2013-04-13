<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-definition>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<link href='http://fonts.googleapis.com/css?family=Noto+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
			<link href='css/style.css' rel='stylesheet' type='text/css'>			
			<link href='css/menu.css' rel='stylesheet' type='text/css'>
			<link href='css/login.css' rel='stylesheet' type='text/css'>
												
			<script type="text/javascript" src="${contextPath}/js/jquery-1.7.1.js"></script>
  		</head>
		
		<body>
		<div id="fenticsik">
			
			<s:layout-component name="login">
							    	
				
				<div id="login">
					<span><s:link beanclass="komoly.action.RegistrationActionBean">regisztráció |</s:link></span>
					<s:form style="display:inline" beanclass="komoly.action.LoginActionBean">
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
		  		<nav>
					<ul>
						<li><s:link beanclass="komoly.action.HomeActionBean"><span>Főoldal</span></s:link></li>
						<li><s:link beanclass="komoly.action.BooksActionBean"><span>Könyvek</span></s:link></li>
						<li><s:link beanclass="komoly.action.OwnBookUploadActionBean"><span>Könyv feltöltése</span></s:link></li>	
						<li><s:link beanclass="komoly.action.UserDataActionBean"><span>Adatok</span></s:link></li>	

					</ul>
				</nav>

		  	</div>
			<s:layout-component name="body"></s:layout-component>
			
			<div id="footer"> 
		  	Adatb alapú házi. 
		  	</div>
		  </div>
		</body>
	</html>
</s:layout-definition>