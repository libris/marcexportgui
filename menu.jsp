<%@include file="logincheck.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
                    &nbsp;<b>batchexport</b>&nbsp;<br>
                    &nbsp;&nbsp;-&nbsp;<a target="_new" href="https://www.kb.se/samverkan-och-utveckling/libris/att-anvanda-librisdata/postoverforing.html">hjälp</a><br>
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'editprofile'}">ändra profil</c:if><c:if test="${param.operation != 'editprofile'}"><a href="showprofile.jsp?operation=editprofile&name=${fn:escapeXml(param.name)}">ändra profil</a></c:if><br>
 <!--                   &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'testprofile'}">testa profil</c:if><c:if test="${param.operation != 'testprofile'}"><a href="showprofile.jsp?operation=testprofile&name=${fn:escapeXml(param.name)}">testa profil</a></c:if><br> -->
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'listfiles'}">visa filer</c:if><c:if test="${param.operation != 'listfiles'}"><a href="showprofile.jsp?operation=listfiles&name=${fn:escapeXml(param.name)}">visa filer</a></c:if><br>
                    <br>
                    &nbsp;<b>manuell export</b>&nbsp;<br>
			<!--ur funktion 2006-01-27<br>-->
			
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'fulldump'}">fullständigt uttag</c:if><c:if test="${param.operation != 'fulldump'}"><a href="showprofile.jsp?operation=fulldump&name=${fn:escapeXml(param.name)}">fullständigt uttag</a></c:if><br>
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'addjob'}">schemalägg uttag</c:if><c:if test="${param.operation != 'addjob'}"><a href="showprofile.jsp?operation=addjob&name=${fn:escapeXml(param.name)}">schemalägg uttag</a></c:if>&nbsp;<br>
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'listjobs'}">lista uttag</c:if><c:if test="${param.operation != 'listjobs'}"><a href="showprofile.jsp?operation=listjobs&name=${fn:escapeXml(param.name)}">lista uttag</a></c:if>&nbsp;<br>
		
                    <br>
                    &nbsp;<b>administration</b>&nbsp;<br>
<%      
    /* if (request.getRemoteAddr().equals("127.0.0.1") || request.getRemoteAddr().startsWith("193.10.75") || request.getRemoteAddr().startsWith("192.168.3") || request.getRemoteAddr().equals("193.10.249.131") || request.getRemoteAddr().startsWith("10.50.64") || request.getRemoteAddr().startsWith("10.50.67") || request.getRemoteAddr().startsWith("10.50.71") || request.getRemoteAddr().startsWith("10.50.79") || request.getRemoteAddr().startsWith("10.50.66")) { */
	if ( request.getSession().getAttribute("admin").equals("admin") ) {
%>
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'createprofile'}">skapa profil</c:if><c:if test="${param.operation != 'createprofile'}"><a href="showprofile.jsp?operation=createprofile&name=${fn:escapeXml(param.name)}">skapa profil</a></c:if><br>
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'chooseprofile'}">välj profil</c:if><c:if test="${param.operation != 'chooseprofile'}"><a href="showprofile.jsp?operation=chooseprofile&name=${fn:escapeXml(param.name)}">välj profil</a></c:if><br>
<%      
    }
%>
                    &nbsp;&nbsp;-&nbsp;<c:if test="${param.operation == 'changepassword'}">ändra lösenord</c:if><c:if test="${param.operation != 'changepassword'}"><a href="showprofile.jsp?operation=changepassword&name=${fn:escapeXml(param.name)}">ändra lösenord</a></c:if><br>
                    &nbsp;&nbsp;-&nbsp;<a href="logout.jsp">logga ut</a><br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
                    <br>
