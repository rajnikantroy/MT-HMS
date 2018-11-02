<%-- 
    Document   : LOADSTATE
    Created on : Oct 12, 2013, 2:57:20 PM
    Author     : VIKASH
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
     Connection con;
     int country=Integer.parseInt(request.getParameter("Country").toString());
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select id, name from state where countryid="+country;
ResultSet rs=s.executeQuery(query);
out.println("<select id='State' name='State'>");
out.println("<option value='0'>Select one</option>");
while(rs.next())
    {//out.println("<br>inside while<br>");
    out.println("<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>");

}
out.println("</select>");
}
 catch(SQLException ex)
         {
out.println(ex);
}
%>
    </body>
</html>
