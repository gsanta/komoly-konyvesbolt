<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-definition>

<s:layout-render name="/WEB-INF/web/common/${actionBean.context.baseLayout}" >

	<s:layout-component name="body">
	
		
		<s:form beanclass="komoly.action.BooksActionBean" >
			
			<div class="errorDiv">
				<s:errors />
			</div>
			<div id="kerszoveg">Kereső</div>
			
		<div id="kpanel">
			<table>
				<tr>
					<td>
						<s:checkbox name="searchData.titleSearch" class="enableCheckBox">

						</s:checkbox> 
					</td>
					<td>
						<s:select name="searchData.titleConcatenation" disabled="disabled">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.cim" for="cim"/>
					</td>
					<td>
						<s:text id="cim" name="searchData.title" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:checkbox name="searchData.publisherSearch" class="enableCheckBox">
						</s:checkbox> 
					</td>
					<td>
						<s:select name="searchData.publisherConcatenation" disabled="disabled">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.kiado" for="kiado" />
					</td>
					<td>
						<s:select name="searchData.publisherId" disabled="disabled">
							<s:option value="-1">Válassz...</s:option>
							<s:options-collection collection="${actionBean.publishers}" value="id" label="name" />
						</s:select>
					</td>
				</tr>
				<tr>
					<td>
						<s:checkbox name="searchData.mufajSearch" class="enableCheckBox">
						</s:checkbox> 
					</td>
					<td>
						<s:select name="searchData.mufajConcatenation" disabled="disabled">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.mufaj" for="mufaj" />
					</td>
					<td>
						<s:select name="searchData.mufajId" disabled="disabled">
							<s:option value="-1">Válassz...</s:option>
							<s:options-collection collection="${actionBean.mufajs}" value="id" label="name" />
						</s:select>
					</td>
				</tr>
				<tr>
					<td>
						<s:checkbox name="searchData.lengthSearch" class="enableCheckBox">
						</s:checkbox> 
					</td>
					<td>
						<s:select name="searchData.lengthConcatenation" disabled="disabled">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.hossz" for="hossz" />
					</td>
					<td>
						<s:text id="hossz" name="searchData.length" disabled="disabled"/>
					</td>
					<td>
						&lt;<s:radio name="searchData.lengthRelation" value="LESS_THAN" disabled="disabled"/>
						&gt;<s:radio name="searchData.lengthRelation" value="GREATER_THAN" disabled="disabled"/>
						=<s:radio class="equals" name="searchData.lengthRelation" value="{actionBean.dummyEquals}" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td>
						<s:checkbox name="searchData.priceSearch" class="enableCheckBox">
						</s:checkbox> 
					</td>
					<td>
						<s:select name="searchData.priceConcatenation" disabled="disabled">
							<s:options-enumeration enum="komoly.bean.SelectData.ConcatenationOperator"/>						
						</s:select> 
					</td>
					<td>
						<s:label name="label.ar" for="ar" />
					</td>
					<td>
						<s:text id="ar" name="searchData.price" disabled="disabled"/>
					</td>
					<td>
						&lt;<s:radio name="searchData.priceRelation" value="LESS_THAN" disabled="disabled"/>
						&gt;<s:radio name="searchData.priceRelation" value="GREATER_THAN" disabled="disabled"/>
						=<s:radio class="equals" name="searchData.priceRelation" value="EQUALS" checked="checked" disabled="disabled"/>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<s:submit name="search" value="Keres" disabled="disabled"/>
					</td>
				</tr>
			</table>
		</s:form>	
		
			<p class="alsoszoveg"> 
			* Kötelező : Ennek szerepelnie kell a keresésben<br>
			* Valamelyik : Ezekből legalább egynek kell szerepelnie a keresésben<br>
			* Ha -1 az értéke valamelyiknek, akkor nem fog szerepelni a keresésben<br>
			</p>
		</div>
		
		${bookList }
		<script>

		$(function() {
			$('.enableCheckBox').click(function() {
				if($(this).is(':checked')) {
					$(this)
						.parents('tr')
							.find(':input')
								.filter(function(index) {
									if($(this).hasClass('enableCheckBox')) {
										return false;
									}
									return true;
								})
								.attr("disabled",false);
					
					$('[name=search]').attr("disabled",false)
				} else {
					$(this)
					.parents('tr')
						.find(':input')
							.filter(function(index) {
								if($(this).hasClass('enableCheckBox')) {
									return false;
								}
								return true;
							})
						.attr("disabled",true);
					
					if($('.enableCheckBox').filter(':checked').size() == 0) {
						$('[name=search]').attr("disabled",true)
					}
				}
			})
		})
		</script>
		
	
	</s:layout-component>
	
</s:layout-render>
</s:layout-definition>