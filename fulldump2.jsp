<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        Properties properties = new Properties();
        for (String key: (java.util.Set<String>)request.getParameterMap().keySet()) {
            properties.setProperty(key, request.getParameter(key));
        }
        
        storeJob(properties);
        
        response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
%>    