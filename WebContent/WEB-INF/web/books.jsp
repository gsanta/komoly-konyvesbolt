<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<script>
	$(function() {
		alert("ok")
	})
</script>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp">
	<s:layout-component name="body">
		<s:form beanclass="komoly.action.BooksActionBean" >
			<s:errors />
			* Kötelező : Ennek szerepelnie kell a keresésben<br>
			* Valamelyik : Ezekből legalább egynek kell szerepelnie a keresésben<br>
			* Ha -1 az értéke valamelyiknek, akkor nem fog szerepelni a keresésben<br>
			---------------------------------------<br><br>
			
			<table>
				<tr>
					<td>
						<s:select name="searchData.titleConcatenation">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.cim" for="cim" />
					</td>
					<td>
						<s:text id="cim" name="searchData.title" />
					</td>
				</tr>
				<tr>
					<td>
						<s:select name="searchData.publisherConcatenation">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.kiado" for="kiado" />
					</td>
					<td>
						<s:select name="searchData.publisherId">
							<s:option value="-1">Válassz...</s:option>
							<s:options-collection collection="${actionBean.publishers}" value="id" label="name" />
						</s:select>
					</td>
				</tr>
				<tr>
					<td>
						<s:select name="searchData.mufajConcatenation">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.mufaj" for="mufaj" />
					</td>
					<td>
						<s:select name="searchData.mufajId">
							<s:option value="-1">Válassz...</s:option>
							<s:options-collection collection="${actionBean.mufajs}" value="id" label="name" />
						</s:select>
					</td>
				</tr>
				<tr>
					<td>
						<s:select name="searchData.lengthConcatenation">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.hossz" for="hossz" />
					</td>
					<td>
						<s:text id="hossz" name="searchData.length" />
					</td>
					<td>
						&lt;<s:radio name="searchData.lengthRelation" value="LESS_THAN"/>
						&gt;<s:radio name="searchData.lengthRelation" value="GREATER_THAN"/>
						=<s:radio class="equals" name="searchData.lengthRelation" value="{actionBean.dummyEquals}"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:select name="searchData.priceConcatenation">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.ar" for="ar" />
					</td>
					<td>
						<s:text id="ar" name="searchData.price" />
					</td>
					<td>
						&lt;<s:radio name="searchData.priceRelation" value="LESS_THAN"/>
						&gt;<s:radio name="searchData.priceRelation" value="GREATER_THAN"/>
						=<s:radio class="equals" name="searchData.priceRelation" value="EQUALS" checked="checked"/>
					</td>
				</tr>
				<tr>
					<td colspan="3">
						<s:submit name="search" value="Keres"/>
					</td>
				</tr>
			</table>
		</s:form>	
	
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
