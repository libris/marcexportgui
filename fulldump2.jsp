<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        Properties properties = new Properties();
        for (String key: (java.util.Set<String>)request.getParameterMap().keySet()) {
            properties.setProperty(key, request.getParameter(key));
        }

        getStore(application).storeJob(properties);
        
        response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
%>    