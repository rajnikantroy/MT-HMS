<%-- 
    Document   : TENANTREGISTRATION
    Created on : Oct 22, 2013, 6:24:24 PM
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



 <%! Connection con;%>
        <%
   java.util.Date dNow = new java.util.Date();
   SimpleDateFormat ft =new SimpleDateFormat ("yyyy-MM-dd");
   String CurrentDate=ft.format(dNow);


String TenantEmail, Firstname="";
int TenantID=0, Rent;

     Rent=Integer.parseInt(request.getParameter("Rent").toString());
     TenantEmail=request.getParameter("TenantEmail").toString();
     String HID=(String)request.getSession().getAttribute("HostelID");

   try
{

Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select id, Firstname from users where email='"+TenantEmail+"'";
ResultSet rs=s.executeQuery(query);
while(rs.next())
    {
    TenantID=rs.getInt(1);
    Firstname=rs.getString(2);
}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<font color='#D5402C'> <h2>"+TenantEmail+" is not a user of this system, say '"+TenantEmail+"' to register first</h2></font>");
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
String query="insert into Registration(HostelID, TenantID, Rent, RegistrationDate) values('"+HostelID+"', '"+TenantID+"', '"+Rent+"', '"+CurrentDate+"')";

boolean confirmation=s.execute(query);
if(!confirmation)
    {out.println("<b> <font  color='green'>'"+Firstname+"' is successfully register, next is to taking payment</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<b><font color=''>'"+TenantEmail+"' is already registered.</font></b>");
}
     finally{con.close();}
     }
     else
         {out.println("<b>Try again!</b>");}
%>
    </body>
</html>
