<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp"
  title="Ratings">
  <s:layout-component name="body">

    <s:form beanclass="stripesbook.action.RatingActionBean">
      <table class="form">
        <tr>
          <td>UserID</td>
          <td><s:text name="rating.userID"/></td>
        </tr>
        <tr>
          <td>Date</td>
          <td><s:text name="rating.date"/></td>
        </tr>
        <tr>
          <td>BookID</td>
          <td><s:text name="rating.bookID"/></td>
        </tr>
        <tr>
          <td>Rating</td>
          <td><s:select name="fruit">
    				<option value="1">1</option>
  					<option value="2">2</option>
  					<option value="3">3</option>
  					<option value="4">4</option>
  					<option value="5">5</option>
  					<option value="6">6</option>
  					<option value="7">7</option>
  					<option value="8">8</option>
  					<option value="9">9</option>
  					<option value="10">10</option>
				</s:select>
        </tr>
        <tr>
        <td>&nbsp;</td>
          <td>
            <s:submit name="kuldes" value="Küldés"/>
          </td>
        </tr>
      </table>
    </s:form>

  </s:layout-component>
</s:layout-render>
