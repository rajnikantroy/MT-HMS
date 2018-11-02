<%-- 
    Document   : signout
    Created on : Oct 15, 2013, 3:24:18 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <%
       try
               {
        request.getSession().removeAttribute("Username");
        request.getSession().removeAttribute("Role");
        request.getSession().removeAttribute("FullName");
        request.getSession().removeAttribute("Page");
        request.getSession().removeAttribute("Userid");
        request.getSession().removeAttribute("HostelID");
        response.sendRedirect("Dashboard.jsp?open=hostelOwner");
        //response.sendRedirect("signin.jsp");
        }
catch(NullPointerException ex){response.sendRedirect("Signin.jsp");}
%> 
    </body>
</html>
