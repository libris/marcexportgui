<%@include file="util.jsp"%>
<%@include file="logincheck.jsp" %>
<%@page contentType="text/plain"%>
<%@page pageEncoding="UTF-8"%>

<%
        File logDir = getStore(application).getLogDir(request.getParameter("name"));
        File file = new File(logDir, request.getParameter("filename"));

        OutputStream os = response.getOutputStream();
        InputStream is = new FileInputStream(file);
        try {
            int n=0;
            while ((n = is.read()) != -1) {
                os.write(n);
            }
        }
        finally {
            is.close();
        }
%>