<%-- 
    Document   : LISTFACILITY
    Created on : Oct 16, 2013, 2:31:56 AM
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
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select Name, Description from Facility where hostelid="+HID+" order by id desc";
ResultSet rs=s.executeQuery(query);
out.println("<table class='RoomList'><tr><td colspan='2'><h3>List of Facility</h3></td></tr>");
int flag=0;
out.println("<tr><td>Facility</td><td>Description</td></tr>");
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>Add some facility so that people take interest on your hostel.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>
    </body>
</html>
