<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="logincheck.jsp" %>

<%
        java.util.Properties properties = loadProfile(request.getParameter("name"));
        properties.setProperty("password", request.getParameter("password"));
        storeProfile(properties);
                
        response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("name"));
%>