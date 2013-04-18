<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/WEB-INF/web/common/taglibs.jsp"%>

<s:layout-render name="/WEB-INF/web/common/common_layout.jsp"
  title="Contact Information">
  <s:layout-component name="body">

    <s:form beanclass="stripesbook.action.ContactFormActionBean">
      <table class="form">
        <tr>
          <td>Comment</td>
          <td><s:textarea rows="4" cols="50" name="comment.comment"/></td>
        </tr>
        <tr>
          <td>Date</td>
          <td><s:text name="comment.date"/></td>
        </tr>
        <tr>
          <td>UserID</td>
          <td><s:text name="comment.userID"/></td>
        </tr>
        <tr>
          <td>BookID</td>
          <td><s:text name="comment.bookID"/></td>
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
