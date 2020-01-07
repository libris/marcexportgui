<%@include file="util.jsp"%>
<%
    if (request.getParameter("file").endsWith("xml")) {
        response.setContentType("text/xml");
    } else {
        response.setContentType("application/x-download");
    }
    
    response.setHeader("Content-Disposition", "attachment; filename=" + request.getParameter("file"));

    File exportDir = getExportDir(request.getParameter("name"));
    File f = new File(exportDir, request.getParameter("file"));
    try (java.io.InputStream in = new java.io.FileInputStream(f)) {
        int i = 0;
        while ((i = in.read()) != -1) {
            out.write(i);
        }
    }
%>