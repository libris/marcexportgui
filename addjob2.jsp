<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        Properties job = new Properties();
        for (String key: (java.util.Set<String>)request.getParameterMap().keySet()) {
            job.setProperty(key, request.getParameter(key));
        }

        getStore(application).storeJob(job);

        response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
%>    