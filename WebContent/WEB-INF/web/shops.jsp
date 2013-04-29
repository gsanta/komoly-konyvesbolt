<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@include file="/WEB-INF/web/common/taglibs.jsp" %>
<s:layout-render name="/WEB-INF/jsp/common/layout_main.jsp" title="Shop list" >
<s:layout-component name="body">
<table>
  <tr>
		<th>ShopID</th>
		<th>Name</th>
		<th>Address</th>
		<th>Contact</th>
		<th>Tel</th>
	</tr>
<c:forEach var="shops" items="${actionBean.shopsData}">
	<tr>
			<td>${shopsData.shopID}</td>
			<td>${shopsData.name}</td>
			<td>${shopsData.address}</td>
			<td>${shopsData.contact}</td>
			<td>${shopsData.tel}</td>
	</tr>
</c:forEach>
</table>
</s:layout-component>
</s:layout-render>
