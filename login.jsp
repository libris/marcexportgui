<%@include file="util.jsp"%>
<%
    Store store = getStore(application);
	Properties properties = store.loadProfile(request.getParameter("group"));
    if (properties.getProperty("password", "").equals(request.getParameter("password"))) {
		request.getSession().setAttribute("group", request.getParameter("group"));
		request.getSession().setAttribute("admin", "");
		response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("group"));
	} else if (store.getAdminPassword().equals(request.getParameter("password"))) {
		// adminpass
		request.getSession().setAttribute("group", request.getParameter("group"));
		request.getSession().setAttribute("admin", "admin");
		response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + request.getParameter("group"));
	} else {
		response.sendRedirect("index.jsp?error=invalidpassword");
    }
%>
