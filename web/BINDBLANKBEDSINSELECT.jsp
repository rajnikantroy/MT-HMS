<%-- 
    Document   : BINDBLANKBEDSINSELECT
    Created on : Oct 14, 2013, 5:50:15 PM
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
//String query="select id, name from beds where roomid="+roomid;
String Query="select b.id, b.`Name` from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID where r.ID="+roomid+" AND not EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1)";
ResultSet rs=s.executeQuery(Query);
out.println("<select id='Beds' name='Beds'>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
}
if(flag==0)
    {out.println("<option value=0>Beds not available</option>");}

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
