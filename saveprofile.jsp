<%@include file="util.jsp"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<html>
    <% 
        java.util.Properties properties = (java.util.Properties)session.getAttribute("properties"); 
        
        for (String key: (java.util.Set<String>)request.getParameterMap().keySet()) {            
            properties.setProperty(key, new String(request.getParameter(key).getBytes(), "UTF-8"));
        }
        
        // fix checkboxes
        String checkboxes[] = {"bibcreate", "bibupdate", "authcreate", "authupdate", "holdcreate", "holdupdate", "holddelete","generatesab","generatedewey", "sab", "lcsh", "isbndehyphenate", "issndehyphenate", "isbnhyphenate", "issnhyphenate", "efilter", "biblevel", "move0359", "move240to244", "fictionfilter", "virtualdelete", "exportdeleted" };
        for (String str: checkboxes) {
            if (request.getParameter(str) == null) properties.setProperty(str, "off");
        }

        getStore(application).storeProfile(properties);
                
        response.sendRedirect("/exportgui");
    %>
    
    <head><title>spara exportprofil (<% out.print(request.getParameter("name")); %>)</title></head>
    <body>
        <% out.print(application.getRealPath("/profiles/" + request.getParameter("name") + ".properties")); %>
    </body>
</html>
