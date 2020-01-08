<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty param.group}">
<%
        request.getSession().setAttribute("group", request.getParameter("group"));
        response.sendRedirect("showprofile.jsp?name=" + request.getParameter("group"));
%>    
</c:if>
<c:if test="${empty param.group}">
<%
        Store store = getStore(application);
        Map<String, Properties> fileMap = store.loadAllProfiles();
%>

        <table width="100%" cellpadding="0" cellspacing="0">
            <tr bgcolor="#efefef">
                <td colspan="4"><img src="images/1trans.gif"/></td>
            </tr>
            <tr bgcolor="#dfdfdf">
                <td class="default">&nbsp;<b>kortnamn</b></td>
                <td class="default"><b>namn</b></td>
                <td class="default"><b>status</b></td>
                <td class="default"><b>last changed</b></td>
            </tr>
            <tr bgcolor="#7f7f7f">
                <td colspan="4"><img src="images/1trans.gif"/></td>
            </tr>
<%          for (Properties properties: fileMap.values()) { %>
            <tr>
                <td class="default">&nbsp;<% out.println("<a href=\"chooseprofile.jsp?group=" + properties.getProperty("name") + "\">" + properties.getProperty("name") + "</a>"); %></td>
                <td class="default"><% out.println(properties.getProperty("longname")); %></td>
                <td class="default"><% out.println(properties.getProperty("status")); %></td>
                <td class="default">
		<%
		long l_time = store.getProfileFile(properties.getProperty("name")).lastModified();
		java.text.DateFormat df = new java.text.SimpleDateFormat("yy.MM.dd HH:mm:ss");
		out.println(df.format(new java.util.Date(l_time)));
		%></td>
            </tr>
<%          } %>
        </table>
</c:if>
