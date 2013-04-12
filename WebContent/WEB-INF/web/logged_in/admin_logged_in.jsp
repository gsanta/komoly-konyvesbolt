<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>
<c:set var="prefix" value="${actionBean.getClass().name}"/>

<s:layout-render name="/WEB-INF/web/common/${actionBean.context.baseLayout}">
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

Könyv hozzáadása:

<s:form beanclass="komoly.action.AdminActionBean">
	<div class="errorDiv">
		<s:errors></s:errors>
	</div>
	<table>
		<tr>
			<td>
				<s:label name="label.cim" for="cim" />
			</td>
			<td colspan="2">
				<s:text id="cim" name="book.title" size="30"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>Ár:</td>
			<td><s:text id="price" name="book.price" size="10"/></td>
			<td>Oldalszám:</td>
			<td><s:text id="pageNum" name="book.pageNum" size="10"/></td>
		</tr>
		<tr>
			<td>Kötés:</td>
			<td><s:text id="pageNum" name="book.kotes" size="10"/></td>
			<td>Méret:</td>
			<td><s:text id="pageNum" name="book.meret" size="10" /></td>
		</tr>
		<tr>
			<td>Kiadó:</td>
			<td>
				<s:select name="book.kiadoId">
					<s:option value="-1">Válassz...</s:option>
					<s:options-collection collection="${actionBean.publishers}" value="id" label="name" />
				</s:select>	
			</td>
			<td>Műfaj:</td>
			<td>
				<s:select name="book.mufajId">
					<s:option value="-1">Válassz...</s:option>
					<s:options-collection collection="${actionBean.mufajs}" value="id" label="name" />
				</s:select>	
			</td>
		</tr>
		<tr>
			<td>Ebook:</td>
			<td colspan="2">
				Igen <s:radio name="book.ebook" value="true"/>
				Nem <s:radio name="book.ebook" value="false" checked="checked"/>
			</td>
			<td></td>
		</tr>
		<tr>
			<td>
				Fájl feltöltés:
			</td>
			<td colspan="2">
				 <s:file name="book.image"/>
			</td>
			<td></td>
		</tr>
		
		<tr>
			<td colspan="2">
				<s:submit name="addBook" value="Hozzáad"/>
			</td>
		</tr>
	</table>
</s:form>
	</s:layout-component>
</s:layout-render>