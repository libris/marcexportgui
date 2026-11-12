<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="logincheck.jsp" %>

<%
        Store store = getStore(application);
        Properties properties = store.loadProfile(request.getParameter("name"));
        String newPassword = request.getParameter("password");
        if (newPassword == null || newPassword.isEmpty()) {
            response.sendRedirect("showprofile.jsp?operation=changepassword&name=" + request.getParameter("name"));
            return;
        }
        properties.setProperty("password", newPassword);
        store.storeProfile(properties);
                
        response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("name"));
%>