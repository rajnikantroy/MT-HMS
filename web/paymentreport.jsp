<%-- 
    Document   : paymentreport
    Created on : Oct 29, 2013, 12:57:43 AM
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



<%! Connection con;String TenantEmail, Firstname, HostelName, from, to;int HID, count=0, flag;%>

<%
try
        {
if(!from.isEmpty())
{
out.println("<form action='paymentreport.jsp' class='Content'><table class='Content'> <tr><td colspan='3'><table class='Titlebar'><tr><td align='left'><h3><"+HostelName+"</h3></td><td><h1>Reports</h1></td></tr></table></td></tr><tr><td ></td>");
out.println("<tr><td>From</td><td>To</td><td></td></tr>");
out.println("<tr><td><input  type='date' value='"+from+"' name='from'></td><td><input type='date'  value='"+to+"' name='to'></td><td valign='bottom'><input type='submit' value='show transaction'></td></tr></table></form>");
}
}
catch(NullPointerException ex)
        {

out.println("<form action='paymentreport.jsp' class='Content'><table class='Content'> <tr><td colspan='3'><table class='Titlebar'><tr><td align='left'><h3><"+HostelName+"</h3></td><td><h1>Reports</h1></td></tr></table></td></tr><tr><td ></td>");
out.println("<tr><td>From</td><td>To</td><td></td></tr>");
out.println("<tr><td><input  type='date' name='from'></td><td><input type='date' name='to'></td><td valign='bottom'><input type='submit' value='show transaction'></td></tr></table></form>");


}
%>

<%
try
        {
 HostelName=request.getSession().getAttribute("HostelName").toString();
   HID=Integer.parseInt(request.getSession().getAttribute("HostelID").toString());
   //TenantEmail=request.getParameter("TenantEmail");
   from=request.getParameter("from");
   to=request.getParameter("to");
   }
catch(NullPointerException ex){}
%>







        <%

       
        //String sender=request.getParameter("Sender").toString();

       //TenantEmail=request.getParameter("TenantEmail").toString();


        try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query1="select t.TransactionDate, t.DateFrom, t.DateTo, t.Total, t.Paid, t.Discount, (t.Total-(t.Paid+t.Discount)) as Remaining, u.firstname, u.email from `transaction` t JOIN users u on u.id=t.TenantID JOIN hostel h on h.ID=t.HostelID where t.HostelID="+HID+" and t.TransactionDate between '"+from+"' and '"+to+"'";
//out.println(query1);
ResultSet rs1=s.executeQuery(query1);
int cnt=0;
out.println("<br><br><table class='Transaction'><tr><th>Name</th><th>Email</th><th>Transaction date</th><th>From</th><th>To</th><th>Total</th><th>Paid</th><th>Discount</th><th>Remaining</th><td></td></tr>");
while(rs1.next())
{
    cnt++;
    if(rs1.getInt(7)==0)
    {
    out.println("<tr class='paid'> <td>"+rs1.getString(8)+"</td> <td>"+rs1.getString(9)+"</td> <td>"+rs1.getInt(1)+"</td><td>"+rs1.getString(2)+"</td><td>"+rs1.getString(3)+"</td><td>"+rs1.getInt(4)+"</td><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(6)+"</td><td>"+rs1.getString(7)+"</td><td><a>print</a></td></tr>");
    }
    else
        {
        out.println("<tr > <td>"+rs1.getString(8)+"</td> <td>"+rs1.getString(9)+"</td> <td>"+rs1.getInt(1)+"</td><td>"+rs1.getString(2)+"</td><td>"+rs1.getString(3)+"</td><td>"+rs1.getInt(4)+"</td><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(6)+"</td><td>"+rs1.getString(7)+"</td><td><a>print</a></td></tr>");
    }
}
if(cnt==0)
    {out.println("<tr><td colspan='8'><h1>You havent done any transaction</h1></td></tr>");}
out.println("</table>");
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println(ex);
    //out.println("<b><font color=''>'"+Floor+"' is already created on this hostel, type another name.</font></b>");
}
     finally{con.close();}


     //Floor=request.getParameter("Floor").toString();
     //String HID=(String)request.getSession().getAttribute("HostelID");
     //int HostelID=Integer.parseInt(HID);

%>

</body>
</html>