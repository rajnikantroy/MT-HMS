<%-- 
    Document   : mail
    Created on : Oct 28, 2013, 12:57:28 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Email-HMS</title>
               <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

<script src="box/shadowbox.js" type="text/javascript"></script>
    <link href="box/shadowbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        Shadowbox.init();
    </script>


    </head>
    <body class="InboxPage">

        <table width="100%">
            <tr><td width="20%" height="100px" style="border-bottom: 2px dotted #e2e2e2"><h1>HMS</h1></td><td width="80%" style="border-bottom: 2px dotted #e2e2e2"><h2>Email to your room partners, hostel owner.</h2></td></tr>
            <tr><td valign="top">
                    <table>
                        <tr><td><a title="Click to compose/send mail" href="composemessage.jsp" rel='shadowbox;width=700;height=600' class="thickbox">Compose mail</a></td></tr>
                        <tr><td><a title="Click to open inbox." href="mail.jsp?open=inbox">Inbox</a></td></tr>
                        <tr><td><a title="Click to open outbox" href="mail.jsp?open=outbox">Outbox</a></td></tr>
                        <tr><td  style="border-top: 1px dotted #e2e2e2"><a title="Go back to dashboard" href="Dashboard.jsp">Dashboard</a></td></tr>
                        <tr><td></td></tr>
                    </table>
                </td>
                <td valign="top"  style="border-left: 1px dotted #e2e2e2">
                    <div width="100%">
                             <%! Connection con;int UID; String type="inbox"; %>
              <%
              UID=Integer.parseInt((String)request.getSession().getAttribute("Userid"));
try{type=request.getParameter("open").toString();}catch(NullPointerException ex){response.sendRedirect("mail.jsp?open=inbox");}
//String roomid=request.getParameter("Rooms");

              if(type.equals("inbox"))
                  {
              try
{
                  //out.println("<title>Inbox</title>");
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select m.ID ,u.FirstName, u.Email, m.Sub, m.MDate from message m JOIN users u on u.ID=m.Sender where m.receiver="+UID+" order by m.id desc";
ResultSet rs=s.executeQuery(query);
out.println("<table class='Inbox'><tr><td colspan='3' align='center'><h1>Inbox</h1></td></tr>");
int flag=0;
out.println("<tr><td width='15%'>Name</td><td width='65%'>Subject</td><td width='20%'>Date</td></tr>");
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td><b>"+rs.getString(2)+"</b><'"+rs.getString(3)+"'></td><td><a  href='showmessage.jsp?MID="+rs.getString(1)+"' rel='shadowbox;width=600;height=500' class='thickbox'>"+rs.getString(4)+"</a></td><td>"+rs.getString(5)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>No message found.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
 }
else if(type.equals("outbox"))
    {
    try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select m.ID ,u.FirstName, u.Email, m.Sub, m.MDate from message m JOIN users u on u.ID=m.receiver where m.sender="+UID+" order by m.id desc";
ResultSet rs=s.executeQuery(query);
out.println("<table class='Inbox'><tr><td colspan='3'  align='center'><h1>Outbox</h1></td></tr>");
int flag=0;
out.println("<tr><td width='15%'>Name</td><td width='65%'>Subject</td><td width='20%'>Date</td></tr>");
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td><b>"+rs.getString(2)+"</b><'"+rs.getString(3)+"'></td><td><a  href='showmessage.jsp?MID="+rs.getString(1)+"' rel='shadowbox;width=600;height=500' class='thickbox'>"+rs.getString(4)+"</a></td><td>"+rs.getString(5)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>No message found.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
}
              else{out.println("<h1>Page not found</h1>");}
%>
   
                    </div>
                </td>
            </tr>
        </table>

    </body>
</html>
