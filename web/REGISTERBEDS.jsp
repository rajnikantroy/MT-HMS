<%-- 
    Document   : REGISTERBEDS
    Created on : Oct 11, 2013, 3:50:30 PM
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



 <%! Connection con;String Beds;%>
        <%
     //String HostelID=request.getParameter("id");
     int RoomID=Integer.parseInt(request.getParameter("Rooms").toString());
     //String Type=request.getParameter("Type");
     Beds=request.getParameter("Beds");
     //String Floor=request.getParameter("Floor");

     String HID=(String)request.getSession().getAttribute("HostelID");
     int HostelID=Integer.parseInt(HID);
     //int RoomID=Integer.parseInt(RoomName);
try
{
Class.forName("com.mysql.jdbc.Driver");
//out.println("load<br>");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
//out.println("connect<br>");
Statement s=con.createStatement();
String query="insert into beds(Name, RoomID) values('"+Beds+"', "+RoomID+")";
//boolean a=
//out.println(query);
boolean confirmation=s.execute(query);
//out.println("execute<br>");
//if(!confirmation)
  //  {out.println("Successfully saved");}
//else{out.println("Try again!");}

if(!confirmation)
    {out.println("<b> <font  color='green'>Successfully saved</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}




//if(a)
  //  {out.println("Room successfully saved.");}
//else
  //  {out.println("Room doesnt saved try again or check your network connection.");}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<b><font  color=''>Bed name '"+Beds+"' is already created on this room, type another name.</font></b>");
}
     finally{con.close();}
%>
    </body>
</html>
