<%-- 
    Document   : showmessage
    Created on : Oct 27, 2013, 1:56:02 AM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show message</title>

         <link href="Styles\Style.css" rel="stylesheet" type="text/css" />
       
    </head>
    <body class="InboxPage">
        <%! Connection con;%>
              <%
String MID=request.getParameter("MID").toString();
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select u.FirstName, u.LastName, u.Email, m.Sub, m.Content, DATEDIFF(CURDATE(),m.MDate) as daysago,m.MDate  from message m JOIN users u on m.Sender=u.ID where m.ID="+MID;
ResultSet rs=s.executeQuery(query);
out.println("<table>");
int flag=0;
while(rs.next())
{
    flag++;   
    out.println("<tr><td width='30%' colspan='2'  style='border-bottom:1px dotted #e2e2e2'><table width='Content'><tr><td align='left'><b>Subject : "+rs.getString(4)+"</b></td><td align='right'> <b>Sent : "+rs.getString(6)+" days ago, "+rs.getString(7)+"</b>   </td></tr></table></td></tr>");
    out.println("<tr><td width='80%' valign='top'>"+rs.getString(5)+"</td><td width='20%'><table style='border-left:1px solid #e2e2e2;'><tr><td align='center'><b>Sender</b></td></tr><tr><td>"+rs.getString(1)+"&nbsp"+rs.getString(2)+"</td></tr><tr><td>"+rs.getString(3)+"</td></tr><tr><td>Phone</td></tr><tr><td>From where</td></tr><tr><td> <input type='submit' title='Close' value='Close' onclick='window.parent.Shadowbox.close();' />   </td></tr></table></td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>Try again.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>

<table>
    <tr><td colspan="2"><!--textarea id="ReplyMSG"></textarea--></td></tr>
    <tr><td><!--input type="submit" id="Send"  value="Send"/--></td><td align="right"></td></tr>
    <tr><td></td><td></td></tr>
</table>
</body>
</html>
