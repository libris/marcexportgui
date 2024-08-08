<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        java.util.Set<String> parameterKeys = request.getParameterMap().keySet();
        // Rudimentary sanity check
        if (parameterKeys.contains("name") && parameterKeys.contains("exporttype")) {
            Properties job = new Properties();
            for (String key: parameterKeys) {
                job.setProperty(key, request.getParameter(key));
            }
            getStore(application).storeJob(job);
            response.sendRedirect("/exportgui/showprofile.jsp?operation=listjobs&name=" + request.getParameter("name"));
        } else {
            response.sendRedirect("/exportgui/");
        }
%>    