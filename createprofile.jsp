<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@include file="admincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String createError = null;
    String shortname = request.getParameter("shortname");
    String longname = request.getParameter("longname");
    String newPassword = request.getParameter("password");

    if (shortname != null || longname != null || newPassword != null) {
        Store store = getStore(application);
        if (!isValidName(shortname)) {
            createError = "ogiltigt profilnamn (endast a-z, 0-9)";
        } else if (longname == null || longname.trim().isEmpty()) {
            createError = "långt namn saknas";
        } else if (newPassword == null || newPassword.isEmpty()) {
            createError = "lösenord saknas";
        } else if (store.getProfileFile(shortname).exists()) {
            createError = "profilen finns redan";
        } else {
            try {
                Properties properties = new Properties();
                properties.setProperty("name", shortname);
                properties.setProperty("longname", longname);
                properties.setProperty("password", newPassword);
                store.storeProfile(properties);

                request.getSession().setAttribute("group", shortname);
                response.sendRedirect("showprofile.jsp?operation=editprofile&name=" + shortname);
                return;
            } catch (IOException e) {
                application.log("Could not create profile " + shortname, e);
                createError = "profilen kunde inte sparas";
            }
        }
    }
%>
<html>
<body>
<table width="100%">
    <tr height="300">
        <td height="100%" align="center" valign="middle">
            <form method="GET" action="createprofile.jsp">
            <table>
<% if (createError != null) { %>
                <tr>
                    <td></td>
                    <td class="default"><font color="#ff0000"><% out.print(createError); %></font></td>
                </tr>
<% } %>
                <tr>
                    <td class="default">profilnamn (endast a-z,0-9):</td>
                    <td><input name="shortname"/></td>
                </tr>
                <tr>
                    <td class="default">långt namn:</td>
                    <td><input name="longname"/></td>
                </tr>
                <tr>
                    <td class="default">lösenord:</td>
                    <td><input name="password"/></td>
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
