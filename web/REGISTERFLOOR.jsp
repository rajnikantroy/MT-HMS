<%-- 
    Document   : REGISTERFLOOR
    Created on : Oct 12, 2013, 9:15:48 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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
//String s=(String)request.getSession().getAttribute("Username");
String Userid=(String)request.getSession().getAttribute("Userid");
if(!Userid.isEmpty())
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



 <%! Connection con;String Floor;%>
        <%
     Floor=request.getParameter("Floor").toString();
     String HID=(String)request.getSession().getAttribute("HostelID");
     int HostelID=Integer.parseInt(HID);
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query="insert into Floor(HostelID, Name) values('"+HostelID+"', '"+Floor+"')";

boolean confirmation=s.execute(query);
if(!confirmation)
    {out.println("<b> <font  color='green'>Successfully saved</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<b><font color=''>'"+Floor+"' is already created on this hostel, type another name.</font></b>");
}
     finally{con.close();}
%>
    </body>
</html>
