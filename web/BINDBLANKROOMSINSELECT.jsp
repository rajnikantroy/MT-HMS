<%-- 
    Document   : BINDBLANKROOMSINSELECT
    Created on : Oct 14, 2013, 5:43:49 PM
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
//String query="select ID, RoomName from room_master where floor="+Floor;
String Query="select distinct r.ID, r.roomname from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor where f.ID="+Floor+" AND not EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1)";
ResultSet rs=s.executeQuery(Query);
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
 if(flag==0)
    {out.println("<option value=0>Rooms not available</option>");}

 out.println("</select>");

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>
    </body>
</html>   