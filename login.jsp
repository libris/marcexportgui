<%@include file="util.jsp"%>
<%
    Store store = getStore(application);
    String group = request.getParameter("group");
    String password = request.getParameter("password");
    String role = null;

    if (isValidName(group) && password != null && !password.isEmpty() && store.getProfileFile(group).isFile()) {
        String profilePassword = store.loadProfile(group).getProperty("password", "");
        if (!profilePassword.isEmpty() && profilePassword.equals(password)) {
            role = "";
        } else if (password.equals(store.getAdminPassword())) {
            role = "admin";
        }
    }

    if (role != null) {
        request.getSession().setAttribute("group", group);
        request.getSession().setAttribute("admin", role);
        response.sendRedirect("showprofile.jsp?operation=listfiles&name=" + group);
    } else {
        response.sendRedirect("index.jsp?error=invalidpassword");
    }
%>
