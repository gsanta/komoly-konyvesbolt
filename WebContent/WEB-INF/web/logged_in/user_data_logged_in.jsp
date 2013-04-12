<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/${actionBean.context.baseLayout}">
	<s:layout-component name="body">
		<s:form beanclass="komoly.action.UserDataActionBean" >
			<div class="errorDiv">
				<s:errors />
			</div>
			<table>
				<tr>
					<td>
						<s:label name="label.email" for="email" />
					</td>
					<td>
						<s:text id="email" name="userData.email" />
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.name" for="name"/>
					</td>
					<td>
						<s:text id="name" name="userData.name" />
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.irsz" for="irsz"/>
					</td>
					<td>
						<s:text id="irsz" name="userData.irsz" />
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.utca" for="utca"/>
					</td>
					<td>
						<s:text id="utca" name="userData.utca" />
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.hazszam" for="hazszam"/>
					</td>
					<td>
						<s:text id="hazszam" name="userData.hazSzam" />
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.varos" for="varos"/>
					</td>
					<td>
						<s:text id="varos" name="userData.varos" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<s:submit name="change" value="Elfogad"/>
					</td>
				</tr>
			</table>
		</s:form>
	</s:layout-component>
</s:layout-render>
	