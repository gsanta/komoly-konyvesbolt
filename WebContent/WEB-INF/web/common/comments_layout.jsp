<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://stripes.sourceforge.net/stripes.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>


<s:layout-definition>

<s:layout-render name="/WEB-INF/web/common/${actionBean.context.baseLayout}"
  title="Comment list">
  <s:layout-component name="body">
  	<c:forEach var="comment" items="${actionBean.comments}">
	  	<div class="comment">
			<div class="comment-header">${comment.userName} | ${comment.date}</div>  	
	  		<div class="comment-body">
	  			${comment.comment}
	  		</div>
	  	</div>
  	</c:forEach>
  	
    ${form }
    
    <s:link beanclass="komoly.action.BooksActionBean">vissza</s:link>
  </s:layout-component>
</s:layout-render>
</s:layout-definition>