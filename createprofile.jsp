<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${not empty param.shortname and not empty param.longname}">
    <%
    try {
        Properties properties = new Properties();
        properties.setProperty("name", request.getParameter("shortname"));
        properties.setProperty("longname", request.getParameter("longname"));
        getStore(application).storeProfile(properties);

        request.getSession().setAttribute("group", request.getParameter("shortname"));
        response.sendRedirect("showprofile.jsp?operation=editprofile&name=" + request.getParameter("shortname"));
    } catch (Exception e) {%>
<html>
<body>
    <% 
        out.println(e.getMessage());
        out.println("<br>");
        java.io.PrintWriter pw = new java.io.PrintWriter(out);
        e.printStackTrace(pw);
    %>
</body>
</html>
    
    <%
    }
    %>
</c:if>
<html>
<body>
<table width="100%">
    <tr height="300">
        <td height="100%" align="center" valign="middle">
            <form method="GET" action="createprofile.jsp">
            <table>
                <tr>
                    <td class="default">profilnamn (endast a-z,0-9):</td>
                    <td><input name="shortname"/></td>
                </tr>
                <tr>
                    <td class="default">långt namn:</td>
                    <td><input name="longname"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td><input type="submit" value="skapa profil"/></td>
                </tr>
            </table>
            </form>
        </td>
    </tr>
</table>
</body>
</html>

