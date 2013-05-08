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
  	<div class="konyv" >
                <table >
                    <tr>
                        <td colspan="3">
                           <strong>${actionBean.book.title } </strong>
                        </td>
                      
                    </tr>
                    <tr>
                       <th rowspan="7" width="200px"><img src="book_pics/${actionBean.book.fileName}"/></th>
                        <td >
                            <strong> Ár:</strong>
                        </td>
                        <td>
                           ${actionBean.book.price }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Kiadó:</strong>
                        </td>
                        <td>
                           ${actionBean.book.kiado }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong>Műfaj: </strong>
                        </td>
                        <td>
                           ${actionBean.book.mufaj }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Oldalszám: </strong>
                        </td>
                        <td>
                           ${actionBean.book.pageNum }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Kötés: </strong>
                        </td>
                        <td>
                           ${actionBean.book.kotes }
                        </td>
                    </tr>
                  <tr>
                        <td >
                            <strong> Méret: </strong>
                        </td>
                        <td>
                           ${actionBean.book.meret }
                        </td>
                    </tr>
               
                    
                </table>
            </div>
    ${shops }
  	
  	<h2>Hozzászólások:</h2>
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