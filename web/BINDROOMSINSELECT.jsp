<%-- 
    Document   : BINDROOMSINSELECT
    Created on : Oct 12, 2013, 4:07:16 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Room list binder in select control</title>
    </head>
    <body>
              <%! Connection con;%>
              <%
//String HID=(String)request.getSession().getAttribute("HostelID");
String Floor=request.getParameter("Floor");
try
{
//Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select ID, RoomName from room_master where floor="+Floor;
ResultSet rs=s.executeQuery(query);
out.println("<select id='RoomList' name='RoomList'>");
out.println("<option value='0'>Select one</option>");
//out.println("<option value='0'>"+query+"</option>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option></td></tr>");
}
 out.println("</select>");
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
