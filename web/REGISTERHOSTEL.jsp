<%-- 
    Document   : REGISTERHOSTEL
    Created on : Oct 7, 2013, 11:53:02 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>setting up your hostel...</title>
    </head>
    <body>
           <%
try
{
//String s=(String)request.getSession().getAttribute("Username");
String Upage=(String)request.getSession().getAttribute("Page");
if(!Upage.isEmpty())
    {

    //out.println(Upage);
}
}
catch(NullPointerException ex)
        {
    response.sendRedirect("signin.jsp");
    //out.println("error is : "+ex);
}
%>



 <%!
Connection con;
String hname;
String uname;
String Gender;
String user;
%>
        <%

hname=request.getParameter("Name");
uname=request.getParameter("UName");
Gender=request.getParameter("Gender");
user=session.getAttribute("Userid").toString();

try{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
boolean a= s.execute("insert into Hostel(hostelname, UserId, uniquename, GenderType) values('"+hname+"', '"+user+"', '"+uname+"', '"+Gender+"')");
if(!a)
    {out.println("<b> <font  color='green'>Successfully created, <a href='Dashboard.jsp'>click here</a> manage '"+hname+"'. </font></b>");}
else{out.println("<b><font  color='green'>Try again.</font></b>");}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println("<b><font color='#D5402C'> '"+uname+"' is already taken by someone try another name.</font></b>");
}
%>

    </body>
</html>
