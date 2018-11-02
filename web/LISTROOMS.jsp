<%-- 
    Document   : LISTROOMS
    Created on : Oct 12, 2013, 9:53:53 AM
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
String Floor=request.getParameter("Floor");
try
{
//Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select r.id, r.roomname, t.name from room_master r join roomtype t on t.id=r.typeid where floor="+Floor+" order by r.id desc";
ResultSet rs=s.executeQuery(query);
out.println("<table class='RoomList'><tr><td colspan='2'><h3>List of rooms</h3></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>This floor is empty add some rooms</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>
    </body>
</html>
