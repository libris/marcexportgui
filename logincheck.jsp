<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%
        if ((request.getSession().getAttribute("group") == null || !request.getSession().getAttribute("group").equals(request.getParameter("name"))) && !(request.getSession().getAttribute("admin") != null && request.getSession().getAttribute("admin").equals("admin")) ) {
            response.sendRedirect("logout.jsp");
            return;
        }
%>
