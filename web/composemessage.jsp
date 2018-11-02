<%-- 
    Document   : ComposeMessasge
    Created on : Oct 27, 2013, 12:19:59 AM
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
        <title>Compose mail</title>
        <link href="Styles\Style.css" rel="stylesheet" type="text/css" />


    </head>
    <body class="ComposeMessage">
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



<%! Connection con;String receiver, Firstname;int recID, senID, flag;%>
        <%

        try
        {
        //String sender=request.getParameter("Sender").toString();
        receiver=request.getParameter("Receiver").toString();
        String Subject=request.getParameter("Subject").toString();
        String Message=request.getParameter("Message").toString();
        senID=Integer.parseInt(request.getSession().getAttribute("Userid").toString());

        flag=0;


        java.util.Date dNow = new java.util.Date();
        SimpleDateFormat ft =new SimpleDateFormat ("yyyy-MM-dd");
        String CurrentDate=ft.format(dNow);



        //Getting id of receiver using email id


         try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select id, Firstname from users where email='"+receiver+"'";
//out.println(query);
ResultSet rs=s.executeQuery(query);
while(rs.next())
    {
    recID=rs.getInt(1);
    Firstname=rs.getString(2);
    flag=1;
}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println(ex);
    //out.println("<b><script language='javascript'>alert('"+receiver+"' is not a user of HMS.)</script></b>");
    //out.println("<font color='#D5402C'> <h2>"+TenantEmail+" is not a user of this system, say '"+TenantEmail+"' to register first</h2></font>");
    //out.println("<h2><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></h2>");
}
     finally{con.close();}
















if(flag==1)

{
        try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query="insert into Message(Sender,Receiver, Sub, Content, MDate) values('"+senID+"', '"+recID+"', '"+Subject+"', '"+Message+"', '"+CurrentDate+"')";

boolean confirmation=s.execute(query);
if(!confirmation)
    {out.println("<b> <font  color='green'>Successfully sent...</font></b>");}
else{out.println("<b><font  color='#D5402C'>Try again.</font></b>");}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
    out.println(ex);
    //out.println("<b><font color=''>'"+Floor+"' is already created on this hostel, type another name.</font></b>");
}
     finally{con.close();}
}
else
    {out.println("<script language='javascript'>document.getElementById('Confirmation').innerHTML='User not found';</script>");}





        }
        catch(NullPointerException ex){}

     //Floor=request.getParameter("Floor").toString();
     //String HID=(String)request.getSession().getAttribute("HostelID");
     //int HostelID=Integer.parseInt(HID);

%>


  <form action="composemessage.jsp">

<table>

    <tr>
        <td  class="Bold-Text" align="center">Compose mail</td>
    </tr>


    <tr>
        <td class="Bold-Text">Receiver Email</td>
    </tr>
    <tr>
        <td><input type="email" placeholder="receiver email" id="Receiver" name="Receiver"/></td>
    </tr>

    <tr>
        <td class="Bold-Text">Subject</td>
    </tr>

     <tr>
        <td><input type="text" placeholder="Subject" name="Subject" id="Subject"/></td>
    </tr>

<tr>
        <td class="Bold-Text">Body</td>
    </tr>

     <tr>
         <td><textarea id="Content" rows="50" name="Message"></textarea></td>
    </tr>


     <tr>
        <td><p id="Confirmation"></p></td>
    </tr>
    <tr>
        <td>


            <table class="Content"><tr>
        <td align="left">  <input type="submit" value="Send"/></td>
        <td align="right"><input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" /></td>
    </tr></table>


           </td>
         </tr>

</table></form>


    </body>
</html>
