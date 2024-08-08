<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    if (request.getParameter("file").endsWith("xml")) {
        response.setContentType("text/xml");
    } else {
        response.setContentType("application/x-download");
    }
    
    response.setHeader("Content-Disposition", "attachment; filename=" + request.getParameter("file"));

    File exportDir =  getStore(application).getExportDir(request.getParameter("name"));
    File f = new File(exportDir, request.getParameter("file"));

    InputStream in = new FileInputStream(f);
    try {
        int i = 0;
        while ((i = in.read()) != -1) {
            out.write(i);
        }
    }
    finally {
        in.close();
    }
%>