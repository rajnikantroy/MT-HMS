<%-- 
    Document   : checkpayment
    Created on : Oct 28, 2013, 7:25:10 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Transactions</title>
        <link href="Styles\Style.css" rel="stylesheet" type="text/css" />


    </head>
    <body class="TransactioPage">
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



<%! Connection con;String TenantEmail, Firstname, HostelName;int HID, count=0, flag;%>


<%
 HostelName=request.getSession().getAttribute("HostelName").toString();
   HID=Integer.parseInt(request.getSession().getAttribute("HostelID").toString());
   TenantEmail=request.getParameter("TenantEmail");
      
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select u.id, u.FirstName, u.Email from users u JOIN tenant t on t.TenantID=u.ID JOIN beds b on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor JOIN hostel h on h.ID=f.hostelID JOIN tenantstatus ts on ts.ID=t.`status` WHERE h.ID="+HID+" and ts.`NAME`='Active'";
//out.println(query);

out.println("<form action='checkpayment.jsp' class='Content'><table class='Content'> <tr><td colspan='2'><table class='Titlebar'><tr><td align='left'><h3>"+HostelName+"</h3></td><td><h1>Transactions</h1></td></tr></table></td></tr><tr><td width='70%' height='50px' valign='bottom'><select name='TenantEmail' id='TenantEmail'>");
ResultSet rs=s.executeQuery(query);
out.println("<option value='0'>Select one</option>");
while(rs.next())
    {
    count++;
    out.println("<option value='"+rs.getString(3)+"'>"+rs.getString(2)+" | "+rs.getString(3)+"</option>");
}
if(count==0)
    {
    out.println("<option value='-1'>No tenant found on '"+HostelName+"'</option>");
}
out.println("</select></td><td width='30%' height='50px' valign='bottom'><input type='submit' value='show transaction'></td></tr></table></form>");
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println(ex);
    //out.println("<b><script language='javascript'>alert('"+receiver+"' is not a user of HMS.)</script></b>");
    //out.println("<font color='#D5402C'> <h2>"+TenantEmail+" is not a user of this system, say '"+TenantEmail+"' to register first</h2></font>");
    //out.println("<h2><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></h2>");
}
     finally{con.close();}

%>







        <%

        try
        {
        //String sender=request.getParameter("Sender").toString();

       TenantEmail=request.getParameter("TenantEmail").toString();
     
 
        try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query1="select t.TransactionDate, t.DateFrom, t.DateTo, t.Total, t.Paid, t.Discount, (t.Total-(t.Paid+t.Discount)) as Remaining from `transaction` t JOIN users u on u.id=t.TenantID JOIN hostel h on h.ID=t.HostelID where t.HostelID="+HID+" and u.Email='"+TenantEmail+"'";

ResultSet rs1=s.executeQuery(query1);
out.println("<br><br><table class='Transaction'><tr><th>Transaction date</th><th>From</th><th>To</th><th>Total</th><th>Paid</th><th>Discount</th><th>Remaining</th><td></td></tr>");
while(rs1.next())
{
    if(rs1.getInt(7)==0)
    {
    out.println("<tr class='paid'> <td>"+rs1.getInt(1)+"</td><td>"+rs1.getString(2)+"</td><td>"+rs1.getString(3)+"</td><td>"+rs1.getInt(4)+"</td><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(6)+"</td><td>"+rs1.getString(7)+"</td><td><a>print</a></td></tr>");
    }
    else
        {
        out.println("<tr > <td>"+rs1.getInt(1)+"</td><td>"+rs1.getString(2)+"</td><td>"+rs1.getString(3)+"</td><td>"+rs1.getInt(4)+"</td><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(6)+"</td><td>"+rs1.getString(7)+"</td><td><a>print</a></td></tr>");
    }
}
out.println("</table>");
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println(ex);
    //out.println("<b><font color=''>'"+Floor+"' is already created on this hostel, type another name.</font></b>");
}
     finally{con.close();}




        }
        catch(NullPointerException ex){out.println("Select email to know transaction");}

     //Floor=request.getParameter("Floor").toString();
     //String HID=(String)request.getSession().getAttribute("HostelID");
     //int HostelID=Integer.parseInt(HID);

%>



    </body>
</html>
