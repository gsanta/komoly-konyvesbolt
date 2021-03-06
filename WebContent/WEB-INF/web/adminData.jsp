<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/${actionBean.context.baseLayout}">
	<s:layout-component name="body">
		<s:form beanclass="komoly.action.UserDataActionBean" >
			<s:errors />
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
					<td colspan="2">
						<s:submit name="changeAdmin" value="Elfogad"/>
					</td>
				</tr>
			</table>
		</s:form>
	</s:layout-component>
</s:layout-render>
	