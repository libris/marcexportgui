<%@include file="util.jsp"%>
<%
        Properties properties = loadProfile(request.getParameter("group"));
        if (properties.getProperty("password", "").equals(request.getParameter("password"))) {
		request.getSession().setAttribute("group", request.getParameter("group"));
		request.getSession().setAttribute("admin", "");
		response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("group"));
	} else if (prop.getProperty("password", "").equals(request.getParameter("password"))) {
		// adminpass
		request.getSession().setAttribute("group", request.getParameter("group"));
		request.getSession().setAttribute("admin", "admin");
		response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("group"));
	} /* else if (request.getRemoteAddr().equals("127.0.0.1") || request.getRemoteAddr().startsWith("193.10.75") || request.getRemoteAddr().startsWith("192.168.3") || request.getRemoteAddr().startsWith("193.10.249.135") || request.getRemoteAddr().equals("193.10.249.131") || request.getRemoteAddr().startsWith("10.50.64") || request.getRemoteAddr().startsWith("10.50.67") || request.getRemoteAddr().startsWith("10.50.71") || request.getRemoteAddr().startsWith("10.50.79") || request.getRemoteAddr().startsWith("10.50.66") || request.getRemoteAddr().startsWith("10.50.255")) {
		request.getSession().setAttribute("group", request.getParameter("group"));
		response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("group"));
	} */ else {
		response.sendRedirect("index.jsp?error=invalidpassword");
        }
%>
