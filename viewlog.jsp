<%@include file="util.jsp"%>
<%@page contentType="text/plain"%>
<%@page pageEncoding="UTF-8"%>

<%
        File file = new File(getLogDir(request.getParameter("name")), request.getParameter("filename"));

        OutputStream os = response.getOutputStream();
        try (FileInputStream is = new FileInputStream(file)) {
            int n=0;
            while ((n = is.read()) != -1) {
                os.write(n);
            }
        }
%>