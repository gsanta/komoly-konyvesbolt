<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
	<s:layout-component name="body">
		<s:form beanclass="komoly.action.LoginActionBean" >
			<div class="errorDiv">
				<s:errors />
			</div>

			<div id="loginmain">
				<div id="inset">
				<p class="loginsign">Bejelentkezés</p>
			  	<p>
			      <s:text id="email" name="email" />
			    </p>
			    <p>
			      <s:password id="password" name="password" />
			      <s:submit name="login" />
			    </p>
			  </div>
			</div>

		</s:form>
	</s:layout-component>
</s:layout-render>
