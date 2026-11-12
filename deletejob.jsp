<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        File file = getStore(application).getJobFile(request.getParameter("jobid"));

        // Only delete jobs that belong to the profile the user is logged in to.
        if (file.isFile() && loadProperties(file).getProperty("name", "").equals(request.getParameter("name"))) {
            file.delete();
        }
        
        response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
%>    