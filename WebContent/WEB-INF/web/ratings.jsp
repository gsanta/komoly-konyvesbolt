<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<s:layout-render name="/WEB-INF/jsp/common/common.layout.jsp"
  title="Ratings list">
  <s:layout-component name="body">
    <table>
      <tr>
        <th>ID</th>
        <th>BookID</th>
        <th>UserID</th>
        <th>Rating</th>
        <th>Date</th>
      </tr>
      <c:forEach var="ratings" items="${actionBean.ratings}">
        <tr>
          <td>${ratings.ID}</td>
          <td>${ratings.bookID}</td>
          <td>${ratings.userID}</td>
          <td>${ratings.rating}</td>
          <td>${ratings.date}</td>
        </tr>
      </c:forEach>
    </table>
  </s:layout-component>
</s:layout-render>
