<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<s:layout-render name="/WEB-INF/jsp/common/common.layout.jsp"
  title="Comment list">
  <s:layout-component name="body">
    <table>
      <tr>
        <th>Text</th>
        <th>Date</th>
        <th>ID</th>
        <th>bookID</th>
        <th>userID</th>
      </tr>
      <c:forEach var="comments" items="${actionBean.comments}">
        <tr>
          <td>${comment.comment}</td>
          <td>${comment.date}</td>
          <td>${comment.ID}</td>
          <td>${comment.bookID}</td>
          <td>${comment.userID}</td>
        </tr>
      </c:forEach>
    </table>
  </s:layout-component>
</s:layout-render>