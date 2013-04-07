<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>

<script>
	$(function() {
		alert("ok")
	})
</script>

<s:layout-render name="/WEB-INF/web/common/books_layout.jsp">
	<s:layout-component name="login">
		<div id="login">
			<span>${actionBean.context.user.name }</span>
			<s:form style="display:inline" beanclass="komoly.action.LoginActionBean">
				<s:submit name="logout" value="Kijelentkezés"/>
			</s:form>
		</div>
	</s:layout-component>
	<s:layout-component name="bookList">
		<c:forEach var="book" items="${actionBean.books}">
			Cím: ${book.title }<br>
			Ár: ${book.price }<br>
			Kiado: ${book.kiado }<br>
			Műfaj: ${book.mufaj }<br>
			Oldalszám: ${book.pageNum }<br>
			Kötés: ${book.kotes }<br>
			Méret: ${book.meret }<br>
			
			<s:form beanclass="komoly.action.BooksActionBean">
				<s:hidden name="basketData.id" value="${book.id }"/>
				<s:hidden name="basketData.title" value="${book.title }"/>
				Kosárba<s:text name="basketData.count" size="2">1</s:text>
				<s:submit name="toBasket" value="+" />
			</s:form>
			<br>	
			
			----------------------------<br><br>
		</c:forEach>
	</s:layout-component>
	
</s:layout-render>