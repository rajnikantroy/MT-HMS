<%-- 
    Document   : Blog
    Created on : Oct 14, 2013, 2:13:28 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style>
            .Contact{width:100%;}
.Contact td{width:50%;}
.Bold
{
     font-size:15px;color:black;
}
        </style>
    </head>
<body>
<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1><%=request.getParameter("Name") %></h1></td>
<td class="Heading-SignUp"><a href="signin.jsp">Sign in</a></td>
<td class="TableMargin"></td>
</tr>
<tr>
<td class="TableMargin"></td>
<td width="100%">
<!--table width="100%" class="BlogHeaderMenu">
    <tr><td width="10%"></td>
    <td  width="10%"><a href="#Home">Home</a></td>
    <td  width="10%"><a href="#Facility">Facility</a></td>
    <td  width="15%"><a href="#Availability">Availability</a></td>
    <td  width="15%"><a href="#feedback">Our feedback</a></td>
    <td  width="15%"><a href="#Aboutus">About us</a></td>
    <td  width="15%"><a href="#Contactus">Contact us</a></td>
    <td width="10%"></td>
</tr>
    </table-->
    </td>

<td class="TableMargin"></td>

</tr>

</table>

<table><tr></tr></table>


<table width="100%">
    <tr>
        <td width="10%"></td><td width="80%">About</td><td width="100%"></td>
    </tr>
    <tr>
        <td width="10%"></td><td width="80%">This is my hostel</td><td width="100%"></td>
    </tr>
    <tr>
        <td width="10%"></td><td width="80%"></td><td width="100%"></td>
    </tr>
    <tr>
        <td width="10%"></td>
        <td width="80%">

            <table width="100%">
                <tr><td width="50%" valign="top">


 <%! Connection con;%>
              <%
              String HID=request.getParameter("Blogid").toString();
//String HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select Name, Description from Facility where hostelid="+HID+" order by id desc";
ResultSet rs=s.executeQuery(query);
out.println("<fieldset><legend>Facility</legend><table cellspacing='5'><tr><td></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
       out.println("<tr><td  class='Bold'>"+rs.getString(1)+"</td></tr>");
    out.println("<tr><td>"+rs.getString(2)+"</td></tr>");
}
if(flag==0)
    {out.println("<font color='gray'>Only basics facilities are available.</font>");}

 out.println("</table></fieldset>");
 
}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>


                    </td>




                    <td width="50%" valign="top">


                         <%
              HID=request.getParameter("Blogid").toString();
//String HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select COUNT(b.id), ht.`Name`, hg.`NAME` from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN hosteltype ht on ht.ID=h.TypeID JOIN hostelgendertype hg on hg.ID=h.GenderType where h.ID="+HID+" AND not EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1)";
ResultSet rs=s.executeQuery(query);
out.println("<fieldset><legend>Availability</legend><table cellspacing='5'><tr><td></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
       out.println("<tr><td  class='Bold'>Only for</td></tr>");
    out.println("<tr><td>"+rs.getString(3)+"</td></tr>");

           out.println("<tr><td  class='Bold'>Hostel type</td></tr>");
    out.println("<tr><td>"+rs.getString(2)+"</td></tr>");

           out.println("<tr><td  class='Bold'>Number of blank beds</td></tr>");
    out.println("<tr><td>"+rs.getString(1)+"</td></tr>");
}
if(flag==0)
    {out.println("<font color='gray'>No information available.</font>");}

 out.println("</table></fieldset>");
 
}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>



                    </td></tr>
            </table>

        </td><td width="10%"></td>
    </tr>
     <tr>
        <td width="10%"></td><td width="80%"></td><td width="100%"></td>
    </tr>
     <tr>
        <td width="10%"></td><td width="80%">

             <%!String HID; %>


           <%
             HID=request.getParameter("Blogid").toString();
//String HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select * from hostel_contact where hostelid="+HID;
ResultSet rs=s.executeQuery(query);
out.println("<fieldset><legend>Contact</legend><table class='Contact' cellspacing='10' cellpading='10'><tr><td></td><td></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td  class='Bold' width='50%'>Phone</td><td class='Bold'>Country</td></tr>");
    out.println("<tr><td>"+rs.getString(2)+"</td><td>"+rs.getString(9)+"</td></tr>");


        out.println("<tr><td class='Bold'>Secondary phone</td><td class='Bold'>State</td></tr>");
    out.println("<tr><td>"+rs.getString(3)+"</td><td>"+rs.getString(10)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Mobile</td><td class='Bold'>City</td></tr>");
    out.println("<tr><td>"+rs.getString(4)+"</td><td>"+rs.getString(11)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Secondary mobile</td><td class='Bold'>Near landmark</td></tr>");
    out.println("<tr><td>"+rs.getString(5)+"</td><td>"+rs.getString(12)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Fax</td><td class='Bold'>Pin</td></tr>");
    out.println("<tr><td>"+rs.getString(6)+"</td><td>"+rs.getString(13)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Email</td><td class='Bold'>Full address</td></tr>");
    out.println("<tr><td>"+rs.getString(7)+"</td><td>"+rs.getString(14)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Website</td></tr>");
    out.println("<tr><td>"+rs.getString(8)+"</td><td></td></tr>");

      //  out.println("<tr><td  class='Bold'></td></tr>");
    //out.println("<tr><td></td></tr>");

     //   out.println("<tr><td  class='Bold'>State</td></tr>");
    //out.println("<tr><td>"+rs.getString(10)+"</td></tr>");

       // out.println("<tr><td  class='Bold'>City</td></tr>");
    //out.println("<tr><td>"+rs.getString(11)+"</td></tr>");

      //  out.println("<tr><td  class='Bold'>Near landmark</td></tr>");
    //out.println("<tr><td>"+rs.getString(12)+"</td></tr>");

      //  out.println("<tr><td  class='Bold'>Pin</td></tr>");
    //out.println("<tr><td>"+rs.getString(13)+"</td></tr>");


      //  out.println("<tr><td  class='Bold'>Full address</td></tr>");
    //out.println("<tr><td>"+rs.getString(14)+"</td></tr>");
}
 if(flag==0)
    {out.println("<font color='gray'>No contact information.</font>");}

 out.println("</table></fieldset>");

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>



        </td><td width="100%"></td>
    </tr>
</table>







<!--
        
        <table class="BlogMenu" id="Home"><tr><td width="10%"></td><td class="BlogTitle"><h1>Home</h1></td><td width="10%"></td></tr>
<tr><td width="10%"></td><td class="BlogWorkPlace">






    </td><td width="10%"></td></tr></table>



        <table class="BlogMenu" id="Facility"><tr><td width="10%"></td><td class="BlogTitle"><h1>Facility</h1></td><td width="10%"></td></tr>
<tr><td width="10%"></td><td class="BlogWorkPlace">

 <%!/* Connection con;*/%>
              <%/*
              String HID=request.getParameter("Blogid").toString();
//String HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select Name, Description from Facility where hostelid="+HID+" order by id desc";
ResultSet rs=s.executeQuery(query);
out.println("<table cellspacing='5'><tr><td></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
       out.println("<tr><td  class='Bold'>"+rs.getString(1)+"</td></tr>");
    out.println("<tr><td>"+rs.getString(2)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='gray'>Only basics facilities are available.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}*/
%>

    </td><td width="10%"></td></tr></table>


        <table class="BlogMenu" id="Availability"><tr><td width="10%"></td><td class="BlogTitle"><h1>Availability</h1></td><td width="10%"></td></tr>
<tr><td width="10%"></td><td class="BlogWorkPlace">

           <%/*
              HID=request.getParameter("Blogid").toString();
//String HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select COUNT(b.id), ht.`Name`, hg.`NAME` from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN hosteltype ht on ht.ID=h.TypeID JOIN hostelgendertype hg on hg.ID=h.GenderType where h.ID="+HID+" AND not EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1)";
ResultSet rs=s.executeQuery(query);
out.println("<table cellspacing='5'><tr><td></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
       out.println("<tr><td  class='Bold'>Only for</td></tr>");
    out.println("<tr><td>"+rs.getString(3)+"</td></tr>");

           out.println("<tr><td  class='Bold'>Hostel type</td></tr>");
    out.println("<tr><td>"+rs.getString(2)+"</td></tr>");

           out.println("<tr><td  class='Bold'>Number of blank beds</td></tr>");
    out.println("<tr><td>"+rs.getString(1)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='gray'>No information available.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}*/
%>




    </td><td width="10%"></td></tr></table>


        <table class="BlogMenu" id="Home"><tr><td width="10%"></td><td class="BlogTitle"><h1>Our feedback</h1></td><td width="10%"></td></tr>
<tr><td width="10%"></td><td class="BlogWorkPlace"></td><td width="10%"></td></tr></table>


<table class="BlogMenu" id="Home"><tr><td width="10%"></td><td class="BlogTitle"><h1>About us</h1></td><td width="10%"></td></tr>
<tr><td width="10%"></td><td class="BlogWorkPlace"></td><td width="10%"></td></tr></table>

        <table class="BlogMenu" id="Contactus"><tr><td width="10%"></td><td class="BlogTitle"><h1>Contact us</h1></td><td width="10%"></td></tr>
<tr><td width="10%"></td><td class="BlogWorkPlace">
        <%!/*String HID; */%>


           <%/*
             HID=request.getParameter("Blogid").toString();
//String HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select * from hostel_contact where hostelid="+HID;
ResultSet rs=s.executeQuery(query);
out.println("<table cellspacing='10' cellpading='10'><tr><td></td></tr>");
int flag=0;
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td  class='Bold'>Phone</td></tr>");
    out.println("<tr><td>"+rs.getString(2)+"</td></tr>");


        out.println("<tr><td  class='Bold'>Secondary phone</td></tr>");
    out.println("<tr><td>"+rs.getString(3)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Mobile</td></tr>");
    out.println("<tr><td>"+rs.getString(4)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Secondary mobile</td></tr>");
    out.println("<tr><td>"+rs.getString(5)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Fax</td></tr>");
    out.println("<tr><td>"+rs.getString(6)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Email</td></tr>");
    out.println("<tr><td>"+rs.getString(7)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Website</td></tr>");
    out.println("<tr><td>"+rs.getString(8)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Country</td></tr>");
    out.println("<tr><td>"+rs.getString(9)+"</td></tr>");

        out.println("<tr><td  class='Bold'>State</td></tr>");
    out.println("<tr><td>"+rs.getString(10)+"</td></tr>");

        out.println("<tr><td  class='Bold'>City</td></tr>");
    out.println("<tr><td>"+rs.getString(11)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Near landmark</td></tr>");
    out.println("<tr><td>"+rs.getString(12)+"</td></tr>");

        out.println("<tr><td  class='Bold'>Pin</td></tr>");
    out.println("<tr><td>"+rs.getString(13)+"</td></tr>");


        out.println("<tr><td  class='Bold'>Full address</td></tr>");
    out.println("<tr><td>"+rs.getString(14)+"</td></tr>");
}
 out.println("</table>");
 if(flag==0)
    {out.println("<font color='gray'>No contact information.</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}*/
%>




    </td><td width="10%"></td></tr></table>
-->
<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"></td>
<td class="Heading-SignUp"></td>
<td class="TableMargin"></td>
</tr>
</table>
</body>
</html>