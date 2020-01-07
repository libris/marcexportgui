<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        File file = getJobFile(request.getParameter("jobid"));

        if (file.exists()) {
            file.delete();
        }
        
        response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
%>    