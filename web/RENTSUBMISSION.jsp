<%-- 
    Document   : RENTSUBMISSION
    Created on : Oct 24, 2013, 4:54:52 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="java.util.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tenant registration</title>
    </head>
    <body>


<%! Connection con;String TenantEmail;String Firstname="", from, to;int TenantID=0,paid, total, discount;%>
        <%
        
        //out.println("hi i got ur message");
        
        
   java.util.Date dNow = new java.util.Date();
   SimpleDateFormat ft =new SimpleDateFormat ("yyyy-MM-dd");
   String CurrentDate=ft.format(dNow);


     

     //Rent=Integer.parseInt(request.getParameter("Rent").toString());
     try{ TenantEmail=request.getParameter("TenantEmail").toString();}catch(NullPointerException ex){out.println("Email not found");}
     String HID=(String)request.getSession().getAttribute("HostelID");
try{
     from=request.getParameter("from").toString();
     to=request.getParameter("to").toString();
     total=Integer.parseInt(request.getParameter("total").toString());
     paid=Integer.parseInt(request.getParameter("paid").toString());     
     discount=Integer.parseInt(request.getParameter("discount").toString());
     //out.println(from+""+to +""+total+""+paid+""+discount+""+HID);
     }catch(NullPointerException ex){out.println(to);}

   try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select id, Firstname from users where email='"+TenantEmail+"'";
//out.println(query);
ResultSet rs=s.executeQuery(query);
while(rs.next())
    {
    TenantID=rs.getInt(1);
    Firstname=rs.getString(2);
}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println(ex);
    //out.println("<font color='#D5402C'> <h2>"+TenantEmail+" is not a user of this system, say '"+TenantEmail+"' to register first</h2></font>");
    //out.println("<h2><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></h2>");
}
     finally{con.close();}

if(TenantID>=1)
    {
     int HostelID=Integer.parseInt(HID);
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query="insert into transaction(HostelID, TenantID, TransactionDate, datefrom, dateto, total, paid, discount) values('"+HostelID+"', '"+TenantID+"', '"+CurrentDate+"', '"+from+"', '"+to+"', '"+total+"', '"+paid+"', '"+discount+"')";
//out.println(query);
boolean confirmation=s.execute(query);
if(!confirmation)
    {out.println("<b> <font  color='green'>'"+Firstname+"' is successfully given the payment.</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println("in insert : "+ex);
    //out.println("<b><font color=''>'"+TenantEmail+"' is already registered.</font></b>");
}
     finally{con.close();}
     }
     else
         {out.println("<b>Try again!</b>");}
%>
    </body>
</html>