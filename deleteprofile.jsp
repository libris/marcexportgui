<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
    getStore(application).getProfileFile(request.getParameter("name")).delete();
    response.sendRedirect("/exportgui");
%>
<html>
    <head><title>JSP Page</title></head>
    <body>
    </body>
</html>
