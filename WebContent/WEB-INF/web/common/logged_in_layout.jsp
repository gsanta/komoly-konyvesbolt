<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>


<s:layout-definition>
<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
	<s:layout-component name="login">
		<s:link beanclass="komoly.action.BasketActionBean">
	  			Kosár
	  	</s:link>
		<s:link beanclass="komoly.action.UserDataActionBean">
	  			Adatok
	  	</s:link>
		<div id="login">
			<span>${actionBean.context.user.name }</span>
			<s:form style="display:inline" beanclass="komoly.action.LoginActionBean">
				<s:submit name="logout" value="Kijelentkezés"/>
			</s:form>
		</div>
	</s:layout-component>
	
	<s:layout-component name="nav">
		<nav>
			<ul>
				<li><s:link beanclass="komoly.action.HomeActionBean"><span>Főoldal</span></s:link></li>
				<li><s:link beanclass="komoly.action.BooksActionBean"><span>Könyvek</span></s:link></li>
				<li><s:link beanclass="komoly.action.OwnBookUploadActionBean"><span>Könyv feltöltése</span></s:link></li>	
			</ul>
		</nav>
	</s:layout-component>
	
	<s:layout-component name="body">
		${body }
	</s:layout-component>
</s:layout-render>
</s:layout-definition>