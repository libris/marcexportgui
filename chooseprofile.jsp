<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@include file="admincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:if test="${not empty param.group}">
<%
        String chosenGroup = request.getParameter("group");
        if (isValidName(chosenGroup) && getStore(application).getProfileFile(chosenGroup).isFile()) {
            request.getSession().setAttribute("group", chosenGroup);
            response.sendRedirect("showprofile.jsp?name=" + chosenGroup);
        } else {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
        }
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
                <td class="default">&nbsp;<% out.println("<a href=\"chooseprofile.jsp?group=" + esc(properties.getProperty("name")) + "\">" + esc(properties.getProperty("name")) + "</a>"); %></td>
                <td class="default"><% out.println(esc(properties.getProperty("longname"))); %></td>
                <td class="default"><% out.println(esc(properties.getProperty("status"))); %></td>
                <td class="default">
		<%
		String profileName = properties.getProperty("name");
		long l_time = isValidName(profileName) ? store.getProfileFile(profileName).lastModified() : 0;
		java.text.DateFormat df = new java.text.SimpleDateFormat("yy.MM.dd HH:mm:ss");
		out.println(df.format(new java.util.Date(l_time)));
		%></td>
            </tr>
<%          } %>
        </table>
</c:if>
