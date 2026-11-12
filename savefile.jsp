<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@ page trimDirectiveWhitespaces="true" %>
<%
    String fileName = request.getParameter("file");
    if (!isValidFileName(fileName)) {
        response.sendError(HttpServletResponse.SC_BAD_REQUEST);
        return;
    }

    File exportDir =  getStore(application).getExportDir(request.getParameter("name"));
    File f = new File(exportDir, fileName);
    if (!f.isFile()) {
        response.sendError(HttpServletResponse.SC_NOT_FOUND);
        return;
    }

    if (fileName.endsWith("xml")) {
        response.setContentType("text/xml");
    } else {
        response.setContentType("application/x-download");
    }

    response.setHeader("Content-Disposition", "attachment; filename=" + fileName);

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