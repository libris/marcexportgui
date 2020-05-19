<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
    <%
        Properties properties = getStore(application).loadProfile(request.getParameter("name"));
    %>
    
        <form action="addjob2.jsp">
            <input type="hidden" name="name" value="<% out.print(properties.getProperty("name", "")); %>">
            <input type="hidden" name="exporttype" value="manual">
            <table width="100%">
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;urval - tidsintervall</b></td>
                </tr>
                <tr>
                  <td colspan="2">
                  <font color="#ff0000">OBS! Lägg inte ett startdatum som är äldre än två år. Sökningen blir då för tung och kommer inte att fungera. Använd "fullständigt uttag" i vänstermenun om det är det ni vill ha.</font></td></tr>
                 <tr>
                    <td nowrap class="default">&nbsp;&nbsp;start (yyyy-mm-dd):</td>
                    <td><input type="text" size="10" name="start"/></td>
                </tr>
                <tr>
                    <td nowrap class="default">&nbsp;&nbsp;stop (yyyy-mm-dd):</td>
                    <td><input type="text" size="10" name="stop"/></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;urval - beståndsposter</b></td>
                </tr>
                <tr>
                    <td colspan="2" class="default">
                        &nbsp;&nbsp;exportera bibliografiska poster när tillhörande beståndspost: <input type="checkbox" name="holdcreate" <% if (properties.getProperty("holdcreate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>skapas&nbsp;<input type="checkbox" name="holdupdate" <% if (properties.getProperty("holdupdate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/> ändras&nbsp;<input type="checkbox" name="holddelete" <% if (properties.getProperty("holddelete", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/> tas&nbsp;bort
                    </td>
                </tr>
                <tr>
                    <td nowrap class="default">&nbsp;&nbsp;begränsa operatörer:</td>
                    <td><input type="text" size="30" name="holdoperators" value="<% out.print(properties.getProperty("holdoperators", "")); %>"/></td>
                </tr>
                <tr>
                    <td class="default">&nbsp;&nbsp;begränsa sigler:</td>
                    <td><input type="text" size="50" name="locations" value="<% out.print(properties.getProperty("locations", "")); %>"/></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;urval - bibliografisk post</b></td>
                </tr>
                <tr>
                    <td colspan="2" class="default">
                        &nbsp;&nbsp;exportera bibliografiska poster när de: <input type="checkbox" name="bibcreate" <% if (properties.getProperty("bibcreate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>skapas&nbsp;<input type="checkbox" name="bibupdate" <% if (properties.getProperty("bibupdate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/> ändras<br/>
                    </td>
                </tr>
                <tr>
                    <td nowrap class="default">&nbsp;&nbsp;begränsa operatörer:</td>
                    <td><input type="text" size="30" name="biboperators" value="<% out.print(properties.getProperty("biboperators", "")); %>"/></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;urval - auktoritetsposter</b></td>
                </tr>
                <tr>
                    <td colspan="2" class="default">
                        &nbsp;&nbsp;exportera bibliografiska poster när länkad auktoritetspost: <input type="checkbox" name="authcreate" <% if (properties.getProperty("authcreate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>skapas&nbsp;<input type="checkbox" name="authupdate" <% if (properties.getProperty("authupdate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/> ändras<br/>
                    </td>
                </tr>
                <tr>
                    <td nowrap class="default">&nbsp;&nbsp;begränsa operatörer:</td>
                    <td><input type="text" size="30" name="authoperators" value="<% out.print(properties.getProperty("authoperators", "")); %>"/></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;bearbetning</b></td>
                </tr>
                <tr>
                    <td class="default" colspan="2">
                        &nbsp;&nbsp;<input type="checkbox" name="sab" <% if (properties.getProperty("sab", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>SAB-rubriker
                        &nbsp;&nbsp;<input type="checkbox" name="generatesab" <% if (properties.getProperty("generatesab", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>Generera SAB från Dewey
                        &nbsp;&nbsp;<input type="checkbox" name="generatedewey" <% if (properties.getProperty("generatedewey", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>Generera Dewey från SAB
                        &nbsp;&nbsp;<input type="checkbox" name="lcsh" <% if (properties.getProperty("lcsh", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>LC subject headings
                        &nbsp;&nbsp;<input type="checkbox" name="isbndehyphenate" <% if (properties.getProperty("isbndehyphenate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>ta bort streck i ISBN
                        &nbsp;&nbsp;<input type="checkbox" name="isbnhyphenate" <% if (properties.getProperty("isbnhyphenate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>lägg till streck i ISBN<br>
                        &nbsp;&nbsp;<input type="checkbox" name="issndehyphenate" <% if (properties.getProperty("issndehyphenate", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>ta bort streck i ISSN
                        &nbsp;&nbsp;<input type="checkbox" name="move0359" <% if (properties.getProperty("move0359", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>035$9 -> 035$a
                        &nbsp;&nbsp;<input type="checkbox" name="move240to244" <% if (properties.getProperty("move240to244", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>240 -> 244
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="default"></td>
                </tr>
                <tr>
                    <td valign="top" class="default">&nbsp;&nbsp;extra beståndsfält:</td>
                <td><input type="text" size="50" name="extrafields" value="<% out.print(properties.getProperty("extrafields", "")); %>"/></td>
                </tr>
                <tr>
                    <td></td>
                    <td valign="top" class="default"><font size="-1">&nbsp;&nbsp;&lt;sigel&gt;:&lt;fält[,fält,fält,fält,...]&gt; ; &lt;sigel&gt;:... o.s.v.<br>&nbsp;&nbsp;<i>exempel: T:650,730 ; X:650</i></font></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;filtrering</b></td>
                </tr>
                <tr>
                    <td class="default" colspan="2">
                        &nbsp;&nbsp;<input type="checkbox" name="efilter" <% if (properties.getProperty("efilter", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>e-resurser
                        &nbsp;&nbsp;<input type="checkbox" name="biblevel" <% if (properties.getProperty("biblevel", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>prel. info
                        &nbsp;&nbsp;<input type="checkbox" name="licensefilter" <% if (properties.getProperty("licensefilter", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>licens-poster
                          <input type="checkbox" name="fictionfilter" <% if (properties.getProperty("fictionfilter", "").equalsIgnoreCase("ON")) out.print("checked=\"checked\""); %>/>skönlitteratur
                    </td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;Namnformer</b></td>
                </tr>
                <tr>
                    <td class="default">&nbsp;&nbsp;namnform (person)</td>
                    <td><select name="nameform"><option value="" <% if (properties.getProperty("name", "").equalsIgnoreCase("")) out.print("selected"); %>>standard</option><option value="Forskningsbiblioteksform" <% if (properties.getProperty("nameform", "").equalsIgnoreCase("Forskningsbiblioteksform")) out.print("selected"); %>>forskningsbiblioteksform</option></select></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;format</b></td>
                </tr>
                <tr>
                    <td class="default">&nbsp;&nbsp;003-sträng:</td>
                    <td width="100%"><select name="f003"><option value="SE-LIBR" <% if (properties.getProperty("f003", "SE-LIBR").equalsIgnoreCase("SE-LIBR")) out.print("selected"); %>>SE-LIBR</option><option value="LIBRIS" <% if (properties.getProperty("f003", "SE-LIBR").equalsIgnoreCase("LIBRIS")) out.print("selected"); %>>LIBRIS</option></select></td>
                </tr>
                <tr>
                    <td class="default">&nbsp;&nbsp;postkodning:</td>
                    <td width="100%"><select name="format"><option value="ISO2709" <% if (properties.getProperty("format", "").equalsIgnoreCase("ISO2709")) out.print("selected"); %>>ISO2709</option><option value="MARCXML" <% if (properties.getProperty("format", "").equalsIgnoreCase("MARCXML")) out.print("selected"); %>>MARCXML</option></select></td>
                </tr>
                <tr class="default">
                    <td>&nbsp;&nbsp;teckenuppsättning:</td>
                    <td><select name="characterencoding"><option value="UTF-8" <% if (properties.getProperty("characterencoding", "").equalsIgnoreCase("UTF-8")) out.print("selected"); %>>UTF-8</option><option value="ISO-8859-1" <% if (properties.getProperty("characterencoding", "").equalsIgnoreCase("ISO-8859-1")) out.print("selected"); %>>ISO-8859-1</option><option value="VRLIN" <% if (properties.getProperty("characterencoding", "").equalsIgnoreCase("VRLIN")) out.print("selected"); %>>VRLIN</option></select></td>
                </tr>
                <tr class="default">
                    <td>&nbsp;&nbsp;diakrithantering:</td>
                    <td><select name="composestrategy"><option value="compose" <% if (properties.getProperty("composestrategy", "").equalsIgnoreCase("composelatin1")) out.print("selected"); %>>prekomponera latin-1 subset</option><option value="compose" <% if (properties.getProperty("composestrategy", "composelatin1").equalsIgnoreCase("compose")) out.print("selected"); %>>prekomponera alla</option><option value="decompose" <% if (properties.getProperty("composestrategy", "composelatin1").equalsIgnoreCase("decompose")) out.print("selected"); %>>dekomponera alla</option></select> <a target="_new" href="http://www.libris.kb.se/tjanster/teknisk_info/export_batchuttag_ny.jsp#diakrithantering">förklaring</a></td>
                </tr>
                <tr class="default">
                    <td>&nbsp;&nbsp;auktoritetsposter:</td>
                    <td><select name="authtype"><option value="interleaved" <% if (properties.getProperty("authtype", "").equalsIgnoreCase("interleaved")) out.print("selected"); %>>sammanslagna med bib.-post</option><option value="after" <% if (properties.getProperty("authtype", "").equalsIgnoreCase("after")) out.print("selected"); %>>efter posten</option><option value="none" <% if (properties.getProperty("authtype", "").equalsIgnoreCase("none")) out.print("selected"); %>>släng</option></select></td>
                </tr>
                <tr class="default">
                    <td>&nbsp;&nbsp;beståndsposter:</td>
                    <td><select name="holdtype"><option value="interleaved" <% if (properties.getProperty("holdtype", "").equalsIgnoreCase("interleaved")) out.print("selected"); %>>sammanslagna med bib.-post</option><option value="after" <% if (properties.getProperty("holdtype", "").equalsIgnoreCase("after")) out.print("selected"); %>>efter posten</option><option value="none" <% if (properties.getProperty("holdtype", "").equalsIgnoreCase("none")) out.print("selected"); %>>släng</option></select></td>
                </tr>
<%      
    /* if (request.getRemoteAddr().equals("127.0.0.1") || request.getRemoteAddr().startsWith("193.10.75") || request.getRemoteAddr().startsWith("192.168.3") || request.getRemoteAddr().equals("193.10.249.131") || request.getRemoteAddr().startsWith("10.50.64") || request.getRemoteAddr().startsWith("10.50.67") || request.getRemoteAddr().startsWith("10.50.71") || request.getRemoteAddr().startsWith("10.50.79") || request.getRemoteAddr().startsWith("10.50.66")) { */
	if ( request.getSession().getAttribute("admin").equals("admin") ) {

%>
                <tr>
                    <td class="default">&nbsp;&nbsp;efterbehandling:</td>
                    <td width="100%">
                        <select name="post">
                            <option value="" <% if (properties.getProperty("post", "").equalsIgnoreCase("")) out.print("selected"); %>></option>
                            <option value="bokrondellen" <% if (properties.getProperty("post", "").equalsIgnoreCase("bokrondellen")) out.print("selected"); %>>Bokrondellen</option>
                        </select>
                    </td>
                </tr>    
<%
    }
%>

                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;tidpunkt för export</b></td>
                </tr>
                <tr>
                    <td colspan="2" class="default">&nbsp;<font color="#ff0000">Uttaget levereras närmast följande helg.</font></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>                
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;leverans</b></td>
                </tr>
                <tr class="default">
                    <td colspan="2">
                        &nbsp;&nbsp;<input type="radio" name="delivery_type" value="LIBRISFTP" <% if (properties.getProperty("delivery_type", "LIBRISFTP").equalsIgnoreCase("LIBRISFTP")) out.print("checked=\"checked\""); %>>LIBRIS FTP-server (i mappen '/pub/export2/<% out.print(request.getParameter("name")); %>/marc')
                        &nbsp;&nbsp;<input type="radio" name="delivery_type" value="EXTFTP" <% if (properties.getProperty("delivery_type", "").equalsIgnoreCase("EXTFTP")) out.print("checked=\"checked\""); %>>egen FTP-server (fyll i nedan)
                    </td>
                </tr>
                <tr class="default">
                    <td>&nbsp;&nbsp;server:</td><td><input name="ftpserver" value="<% out.print(properties.getProperty("ftpserver", "")); %>"></td>
                </tr>
                <tr class="default">
                    <td>&nbsp;&nbsp;användare:</td><td><input name="ftpuser" value="<% out.print(properties.getProperty("ftpuser", "")); %>"></td>
                </tr>
                <tr class="default">    
                    <td>&nbsp;&nbsp;lösenord:</td><td><input name="ftppassword" value="<% out.print(properties.getProperty("ftppassword", "")); %>"></td>
                </tr>
                <tr class="default">    
                    <td>&nbsp;&nbsp;katalog:</td><td><input name="ftpdirectory" value="<% out.print(properties.getProperty("ftpdirectory", "")); %>"></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr bgcolor="#dfdfdf">
                    <td colspan="2" class="default"><b>&nbsp;e-post</b></td>
                </tr>
                <tr>
                    <td nowrap class="default">&nbsp;&nbsp;statusrapport till:</td>
                    <td><input type="text" size="30" name="contact" value="<% out.print(properties.getProperty("contact", "")); %>"/></td>
                </tr>
                <tr>
                    <td nowrap class="default">&nbsp;&nbsp;felrapport till:</td>
                    <td><input type="text" size="30" name="errcontact" value="<% out.print(properties.getProperty("errcontact", "")); %>"/></td>
                </tr>
                <tr><td colspan="2" class="default">&nbsp;</td></tr>
                <tr>    
                    <td colspan="2" align="center"><input type="submit" value="spara">&nbsp;<input type="reset" value="återställ"></form></tr>
                </tr>
            </table>
        </form>
