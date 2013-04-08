<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
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
	
	<s:layout-component name="body">
		<c:forEach var="item" items="${actionBean.basketList}">
				${item.title } Mennyiség: ${item.count }
				<s:link beanclass="komoly.action.BasketActionBean" event="deleteItem" >
					<s:param name="deleteItemId" value="${ item.id}"></s:param>
					töröl
				</s:link>
				<br>
		</c:forEach>
		<s:link beanclass="komoly.action.BasketActionBean" event="deleteAll" >
			Mindet töröl
		</s:link>
	</s:layout-component>
</s:layout-render>