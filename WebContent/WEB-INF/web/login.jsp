<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
	<s:layout-component name="body">
		<s:form beanclass="komoly.action.LoginActionBean" >
			<s:errors />
			
			<table>
				<tr>
					<td>
						<s:label name="label.email" for="email" />
					</td>
					<td>
						<s:text id="email" name="email" />
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.password" for="password"/>
					</td>
					<td>
						<s:password id="password" name="password" />
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<s:submit name="login" />
					</td>
				</tr>
			</table>
		</s:form>
	</s:layout-component>
</s:layout-render>
