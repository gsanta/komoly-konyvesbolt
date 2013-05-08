<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<s:layout-render name="/WEB-INF/web/common/comments_layout.jsp"
  title="Comment list">
  <s:layout-component name="shops">
  	<s:errors globalErrorsOnly="true"></s:errors>

  	<c:forEach var="shop" items="${actionBean.shopList }">
  		<s:form beanclass="komoly.action.CommentsActionBean" class="basket">
			<s:hidden name="book.id" value="${actionBean.book.id }"/>
			<s:hidden name="book.title" value="${actionBean.book.title }"/>
			<s:hidden name="book.price" value="${actionBean.book.price }"/>
			<s:hidden name="index" value="${shop.boltId }"/>

			${shop.boltName } <s:text name="book.count" size="2">1</s:text>
			<s:submit name="toBasket" value="Kosárba" />
		</s:form>
  		
  	
  	</c:forEach>

  </s:layout-component>
  
  
  <s:layout-component name="form">
    <s:form beanclass="komoly.action.CommentsActionBean">
    	<s:hidden name="actComment.bookID" value="${actionBean.bookId}"></s:hidden>
      <table class="form">
        <tr>
          <td>Comment</td>
          <td><s:textarea rows="4" cols="50" name="actComment.comment"/></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
            <s:submit name="addComment" value="Küldés"/>
          </td>
        </tr>
      </table>
    </s:form>
  </s:layout-component>
</s:layout-render>
