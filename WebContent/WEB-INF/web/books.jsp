<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/books_layout.jsp">
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
	
	<s:layout-component name="bookList">
		<c:forEach var="book" items="${actionBean.books}">
		
		
		<div class="konyv" >
                <table >
                    <tr>
                        <td colspan="3">
                           <strong>${book.title } </strong>
                        </td>
                      
                    </tr>
                    <tr>
                                       <th rowspan="6" width="200px"><img src="book_pics/${book.fileName}"/></th>
                        <td >
                            <strong> Ár:</strong>
                        </td>
                        <td>
                           ${book.price }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Kiadó:</strong>
                        </td>
                        <td>
                           ${book.kiado }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong>Műfaj: </strong>
                        </td>
                        <td>
                           ${book.mufaj }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Oldalszám: </strong>
                        </td>
                        <td>
                           ${book.pageNum }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Kötés: </strong>
                        </td>
                        <td>
                           ${book.kotes }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Méret: </strong>
                        </td>
                        <td>
                           ${book.meret }
                        </td>
                    </tr>
                </table>
            </div>

			<br>
		</c:forEach>
		
			<c:choose>
		<c:when test="${actionBean.prevData == true && fn:length(actionBean.books) > 0 }">
			<s:link beanclass="komoly.action.BooksActionBean" event="changePage">
				&lt;prev
				<s:param name="pagerId" value="${actionBean.books.get(0).getId() }"></s:param>
				<s:param name="direction" value="LEFT"></s:param>
			</s:link>
		</c:when>
		<c:otherwise>&lt;prev</c:otherwise>
	</c:choose>
	
	<c:choose>
		<c:when test="${actionBean.nextData && fn:length(actionBean.books) > 0 }">
			<s:link beanclass="komoly.action.BooksActionBean" event="changePage">
				next&gt;
				<s:param name="pagerId" value="${actionBean.books.get(fn:length(actionBean.books) - 1).getId() }"></s:param>
				<s:param name="direction" value="RIGHT"></s:param>
			</s:link>
		</c:when>
		<c:otherwise>next&gt;</c:otherwise>
	</c:choose>
	</s:layout-component>	
</s:layout-render>