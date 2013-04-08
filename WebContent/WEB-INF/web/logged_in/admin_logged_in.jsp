<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>

Könyv hozzáadása:

<s:form beanclass="komoly.action.AdminActionBean">
	<span><s:label name="label.cim" for="cim" /></span>
	<s:text id="cim" name="book.title" />
	Ár:
	<s:text id="price" name="book.price" />
	Oldalszám:
	<s:text id="pageNum" name="book.pageNum" />
	Ebook: Igen <s:radio name="book.ebook" value="true"/>
	Nem <s:radio name="book.ebook" value="false" checked="checked"/>
	<br>
	Kötés: <s:text id="pageNum" name="book.kotes" />
	Méret: <s:text id="pageNum" name="book.meret" />
	Kiadó:
	<s:select name="book.kiadoId">
		<s:option value="-1">Válassz...</s:option>
		<s:options-collection collection="${actionBean.publishers}" value="id" label="name" />
	</s:select>
	Műfaj:
	<s:select name="book.mufajId">
		<s:option value="-1">Válassz...</s:option>
		<s:options-collection collection="${actionBean.mufajs}" value="id" label="name" />
	</s:select>
	<br>
	<s:submit name="addBook" value="Hozzáad"/>
</s:form>