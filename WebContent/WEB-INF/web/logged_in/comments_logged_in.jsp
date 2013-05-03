<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<s:layout-render name="/WEB-INF/web/common/comments_layout.jsp"
  title="Comment list">
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
