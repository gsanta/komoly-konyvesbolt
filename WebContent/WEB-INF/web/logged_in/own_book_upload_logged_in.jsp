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
		<s:form beanclass="komoly.action.OwnBookUploadActionBean">
			<div class="errorDiv">
				<s:errors></s:errors>
			</div>
			<table>
				<tr>
					<td>Cím:</td>
					<td><s:text id="title" name="book.title" /></td>
				</tr>
				<tr>
					<td>Oldalszám:</td>
					<td><s:text id="pageNum" name="book.pageNum" /></td>
				</tr>
				<tr>
					<td>Ár:</td>
					<td><s:text id="price" name="book.price" /></td>
				</tr>
				<tr>
					<td>Műfaj:</td>
					<td>
						<s:select name="book.mufajId">
							<s:option value="-1">Válassz...</s:option>
							<s:options-collection collection="${actionBean.mufajs}" value="id" label="name" />
						</s:select>
					</td>
				</tr>
				<tr>
					<td>
						Kép feltöltés:
					</td>
					<td>
						<s:file name="book.image"/>
					</td>
				</tr>
				<tr>
					<td>
						PDF feltöltés:
					</td>
					<td>
						<s:file name="book.pdf"/>
					</td>
				</tr>					
				<tr>
					<td colspan="2">
						<s:submit name="upload"/>
					</td>
				</tr>
			</table>
		</s:form>
	</s:layout-component>
</s:layout-render>