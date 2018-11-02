<%-- 
    Document   : REGISTERTENANT
    Created on : Oct 14, 2013, 7:28:12 PM
    Author     : Administrator
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

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


 <%! Connection con;String RoomName, Firstname;int UID;%>
        <%
     //RoomName=request.getParameter("Room");
     String Bed=request.getParameter("Bed");
     //String Floor=request.getParameter("Floor");
     String Tenant=request.getParameter("Tenant");

     //String HID=(String)request.getSession().getAttribute("HostelID");

    // int Typeid=Integer.parseInt(Type);
    // int FloorNUM=Integer.parseInt(Floor);
   java.util.Date dNow = new java.util.Date();
   SimpleDateFormat ft =new SimpleDateFormat ("yyyy-MM-dd");
   String CurrentDate=ft.format(dNow);
   //out.print( "<h2 align=\"center\">" + ft.format(dNow) + "</h2>");


   try
{

Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");



Statement s=con.createStatement();

String query="select id, Firstname from users where email='"+Tenant+"'";
ResultSet rs=s.executeQuery(query);

while(rs.next())
    {
    UID=rs.getInt(1);
    Firstname=rs.getString(2);
}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<b>"+Tenant+" is not a user of this system, say '"+Tenant+"' to register first</b>");
    //out.println("<b><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></b>");
}
     finally{con.close();}



try
{
    
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");



Statement s=con.createStatement();
String query="insert into tenant(TenantID, BedID, JoinDate) values('"+UID+"', '"+Bed+"','"+CurrentDate+"')";

boolean confirmation=s.execute(query);
if(!confirmation)
    {out.println("<b> <font  color='green'>'"+Firstname+"' is successfully added.</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
     out.println(Firstname+" is already added.");
    //out.println("<b><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></b>");
}
     finally{con.close();}
%>
    </body>
</html>
