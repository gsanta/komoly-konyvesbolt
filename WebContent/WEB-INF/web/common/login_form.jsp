<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<div id="login">
	<s:form beanclass="komoly.action.LoginActionBean">
		<span><s:label name="label.email" for="email" /></span>
		<s:text id="email" name="email" />
		<span><s:label name="label.password" for="password"/></span>
		<s:password id="password" name="password" />
		<s:submit name="login" />
	</s:form>
</div>	