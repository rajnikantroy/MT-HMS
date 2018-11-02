<%-- 
    Document   : REGISTERROOM
    Created on : Oct 8, 2013, 5:32:56 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
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



 <%! Connection con;String RoomName;%>
        <%
     RoomName=request.getParameter("Name");
     String Type=request.getParameter("Type");
     String Floor=request.getParameter("Floor");

     //String HID=(String)request.getSession().getAttribute("HostelID");

     int Typeid=Integer.parseInt(Type);
     int FloorNUM=Integer.parseInt(Floor);
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query="insert into room_master(RoomName, TypeID, Floor) values('"+RoomName+"', '"+Typeid+"','"+FloorNUM+"')";

boolean confirmation=s.execute(query);
if(!confirmation)
    {out.println("<b> <font  color='green'>Successfully created</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<b><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></b>");
}
     finally{con.close();}
%>
    </body>
</html>
