<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="logincheck.jsp"%>

<%
        File exportDir = getExportDir(request.getParameter("name"));
        File[] files = new File[0];
        
        if (exportDir.exists()) {
            files = exportDir.listFiles();
        }
%>
        <table width="100%" cellpadding="0" cellspacing="0">
            <tr bgcolor="#efefef">
                <td colspan="4"><img src="images/1trans.gif"/></td>
            </tr>
            <tr bgcolor="#dfdfdf">
                <td class="default">&nbsp;<b>filnamn</b></td>
                <td class="default"><b>exportdatum</b></td>
                <td class="default"><b>storlek</b></td>
                <td class="default"></td>
            </tr>
            <tr bgcolor="#7f7f7f">
                <td colspan="4"><img src="images/1trans.gif"/></td>
            </tr>
<%
        java.util.Set<java.io.File> set = new java.util.TreeSet<java.io.File>(new java.util.Comparator() { public int compare(Object o1, Object o2) { 
            java.io.File f1 = (java.io.File) o1, f2 = (java.io.File)o2;
                return f1.getName().compareTo(f2.getName());
            }});

        for (java.io.File f: files) {
            set.add(f);
        }

        for (java.io.File f: set) { %>
            <tr>
                <td class="default">&nbsp;<% out.print(f.getName()); %></td>
                <td class="default"><% out.print(new java.util.Date(f.lastModified())); %></td>
                <td class="default"><% out.print(f.length()); %></td>
                <td class="default"><a href="savefile.jsp?name=<%out.print(request.getParameter("name"));%>&file=<% out.print(java.net.URLEncoder.encode(f.getName())); %>">spara</a></td>
            </tr>
            <tr bgcolor="#dfdfdf">
                <td colspan="4"><img src="images/1trans.gif"/></td>
            </tr>
<%      } %>
        </table>