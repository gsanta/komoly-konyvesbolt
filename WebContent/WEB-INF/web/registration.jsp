<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
	<s:layout-component name="body">
		<s:form beanclass="komoly.action.RegistrationActionBean" >
			<div class="errorDiv">
				<s:errors globalErrorsOnly="true"/>
			</div>
			<div class="konyv">
			<table>
			<tr>
					<td colspan="3"> Regisztráció
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.email" for="email" />
					</td>
					<td>
						<s:text id="email" name="userData.email" />
					</td>
					<td>
						 <s:errors field="userData.email"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.name" for="name"/>
					</td>
					<td>
						<s:text id="name" name="userData.name" />
					</td>
					<td>
						 <s:errors field="userData.name"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.irsz" for="irsz"/>
					</td>
					<td>
						<s:text id="irsz" name="userData.irsz" />
					</td>
					<td>
						 <s:errors field="userData.irsz"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.utca" for="utca"/>
					</td>
					<td>
						<s:text id="utca" name="userData.utca" />
					</td>
					<td>
						 <s:errors field="userData.utca"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.hazszam" for="hazszam"/>
					</td>
					<td>
						<s:text id="hazszam" name="userData.hazSzam" />
					</td>
					<td>
						 <s:errors field="userData.hazSzam"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:label name="label.varos" for="varos"/>
					</td>
					<td>
						<s:text id="varos" name="userData.varos" />
					</td>
					<td>
						 <s:errors field="userData.varos"/>
					</td>
				</tr>
				<tr>
					<td>
						Jelszó:
					</td>
					<td>
						<s:text name="userData.password" />
					</td>
					<td>
						 <s:errors field="userData.password"/>
					</td>
				</tr>
				<tr>
					<td>
						Jelszó újra:
					</td>
					<td>
						<s:text name="password" />
					</td>
					<td>
						 <s:errors field="password"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<p align="center"> <s:submit name="register" value="Regisztrálok"/> </p>
					</td>
				</tr>
			</table>
			</div>
		</s:form>
	</s:layout-component>
</s:layout-render>
