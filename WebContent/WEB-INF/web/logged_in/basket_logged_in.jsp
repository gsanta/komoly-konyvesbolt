<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>

<s:layout-render name="/WEB-INF/web/common/${actionBean.context.baseLayout}">
	
	<s:layout-component name="body">
		<div class="konyv" >
			<table>
			<tr>
				 <td>Megnevezés </td>
				 <td>Mennyiség </td>
				 <td>Törlés </td>
			</tr>
			<c:forEach var="item" items="${actionBean.basketList}">
			<tr>
				<td>${item.title }</td>	
				<td>${item.count } db</td>
				<td>
					<s:link beanclass="komoly.action.BasketActionBean" event="deleteItem" >
					<s:param name="deleteItemId" value="${ item.id}"></s:param>
					töröl	</s:link>
				</td>
			</tr>
					</c:forEach>
			</table>
		</div>
		 <br />  <br />
		<div class="konyv" >
			<table>
			<tr>
			<td> Összesen:  ${actionBean.allPrice } Ft </td>
			<td>
				<s:link beanclass="komoly.action.BasketActionBean" event="pay">
					Fizet
					<c:forEach var="item" items="${actionBean.basketList}">
						<s:param name=""></s:param>
						<tr>
							<td>${item.title }</td>	
							<td>${item.count } db</td>
							<td>
								<s:link beanclass="komoly.action.BasketActionBean" event="deleteItem" >
								<s:param name="deleteItemId" value="${ item.id}"></s:param>
								töröl	</s:link>
							</td>
						</tr>
					</c:forEach>
				</s:link>
			</td>
			<td> 		<s:link beanclass="komoly.action.BasketActionBean" event="deleteAll" >
			Mindet töröl
		</s:link></td>	
			</tr>
			</table>
		</div>

	</s:layout-component>
</s:layout-render>