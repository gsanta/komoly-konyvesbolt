<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
	<s:layout-component name="body">
		<c:forEach var="book" items="${actionBean.books}">
			Cím: ${book.title }<br>
			Ár: ${book.price }<br>
			Kiado: ${book.kiado }<br>
			Műfaj: ${book.mufaj }<br>
			Oldalszám: ${book.pageNum }<br>
			Kötés: ${book.kotes }<br>
			Méret: ${book.meret }<br>
			
			
			
			----------------------------<br><br>
		</c:forEach>
	</s:layout-component>
</s:layout-render>
