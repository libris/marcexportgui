<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <title>export</title>
        <style type="text/css">
            .default { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 80%; }
            .rubrik { font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 120%; }
        </style>
    </head>
    <body>
<%      
 if (request.getSession().getAttribute("group") != null) {
                response.sendRedirect("showprofile.jsp?name=" + request.getSession().getAttribute("group"));
            } else {
                Map<String, Properties> fileMap = getStore(application).loadAllProfiles();
%>
            <table width="100%">
                <tr height="300">
                    <td height="100%" align="center" valign="middle">
                        <form method="POST" action="login.jsp">
                        <table>
                            <tr>
                                <td class="default">exportgrupp:</td>
                                <td>
                                    <select name="group">
<%
                                    for (Properties properties: fileMap.values()) {
%>
                                        <option value="<%out.print(properties.getProperty("name"));%>"><%out.print(properties.getProperty("longname"));%></option>
<%
                                    }
%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="default">lösenord:</td>
                                <td><input name="password" type="password"/></td>
                            </tr>
                            <% if (request.getParameter("error") != null) {
                                if (request.getParameter("error").equals("invalidpassword")) { %>
                                <tr>
                                    <td></td>
                                    <td class="default"><font color="#ff0000">felaktigt lösenord</td>
                                </tr>
                            <% } 
                            }%>
                            <tr>
                                <td></td>
                                <td><input type="submit" value="logga in"/></td>
                            </tr>
                        </table>
                        </form>
                    </td>
                </tr>
            </table>
        <%  }  %>
    </body>
</html>
