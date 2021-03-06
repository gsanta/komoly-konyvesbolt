<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-definition>
	<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv='Content-Type' content='text/html; charset=utf-8'>
			<link href='http://fonts.googleapis.com/css?family=Noto+Sans&subset=latin,latin-ext' rel='stylesheet' type='text/css'>
			<link href='css/style.css' rel='stylesheet' type='text/css'>			
			<link href='css/menu.css' rel='stylesheet' type='text/css'>
			<link href='css/login.css' rel='stylesheet' type='text/css'>
			<link href='css/table.css' rel='stylesheet' type='text/css'>
															
			<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
			<script> 
				$(document).ready(function(){
				  $("#kerszoveg").click(function(){
				    $("#kpanel").slideToggle("slow");
				  });
				});
			</script>

  		</head>
		
		<body>
		<div id="fenticsik">
			
			<s:layout-component name="login">
							    	
				
				<div id="login">
					<span><s:link beanclass="komoly.action.RegistrationActionBean">Regisztráció |</s:link></span>
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
		  		<s:layout-component name="nav">
		  			<nav>
						<ul>
							<li><s:link beanclass="komoly.action.HomeActionBean"><span>Főoldal</span></s:link></li>
							<li><s:link beanclass="komoly.action.BooksActionBean"><span>Könyvek</span></s:link></li>
						</ul>
					</nav>
		  		</s:layout-component>
		  		
		  	</div>
			<s:layout-component name="body"></s:layout-component>
			
			<div id="footer"> 
				<div id="foot"> 
		  			<img src="images/book.png" alt="Books" />
		  			<img src="images/movie.png" alt="Movies" />
		  			<img src="images/music.png" alt="Music" />
		  			Komoly könyvesbolt nem csak profiknak!
		  		</div>
		  	</div>
		  </div>
		</body>
	</html>
</s:layout-definition>
