<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        File file = getStore(application).getJobFile(request.getParameter("jobid"));

        if (file.exists()) {
            file.delete();
        }
        
        response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
%>    