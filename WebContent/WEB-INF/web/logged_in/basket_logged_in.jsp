<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>

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