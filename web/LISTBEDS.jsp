<%-- 
    Document   : LISTBEDS
    Created on : Oct 11, 2013, 5:13:51 PM
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
        <%! Connection con;%>
              <%
String HID=(String)request.getSession().getAttribute("HostelID");
String roomid=request.getParameter("Rooms");
try
{
//Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select name from beds where roomid="+roomid;
ResultSet rs=s.executeQuery(query);
out.println("<table class='RoomList'><tr><th><h3>List of beds</h3></th></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td>"+rs.getString(1)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>This room is empty add some beds</font>");}
   
}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>
    </body>
</html>
