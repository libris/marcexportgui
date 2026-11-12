<%-- Statically include (after logincheck.jsp) in pages that only administrators may use. --%>
<%
        if (!"admin".equals(request.getSession().getAttribute("admin"))) {
            response.sendRedirect("logout.jsp");
            return;
        }
%>
