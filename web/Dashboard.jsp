<%-- 
    Document   : Dashboard
    Created on : Oct 3, 2013, 9:45:08 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<html>
   <head>


<script src="box/shadowbox.js" type="text/javascript"></script>
    <link href="box/shadowbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        Shadowbox.init();
    </script>

<link href="Styles\Style.css" rel="stylesheet" type="text/css" />

<!-- Jquery -->

<script src="Scripts\jquery.min.js">
</script>

<script language="javascript">

    function Show(val)
    {
        if(val=="TenantHostel")
            {
                document.getElementById("OwnerHostel").style.display='none';
                document.getElementById("TenantHostel").style.display='block';
            }
            else if(val=="OwnerHostel")
                {
                    document.getElementById("OwnerHostel").style.display='block';
                    document.getElementById("TenantHostel").style.display='none';
                }
    }

</script>
<style type="css/text">

    .DashboardBTN
{
    cursor: pointer;
    color: blue;
    border: none;
    text-decoration: underline;
    background-color: transparent;
}

</style>
  <link href="Styles\Dashboard.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hostel management system | HMS | Setup your hostel from home</title>
</head>
<body style="margin:0px">
<%! String Num; %>

    <%
try
        {
//String s=(String)request.getSession().getAttribute("Username");
    
            String Upage=(String)request.getSession().getAttribute("Page");
if(!Upage.isEmpty())
    {
   
    //out.println(Upage);
}
}
catch(NullPointerException ex)
        {
    response.sendRedirect("signin.jsp");
    //out.println("error is : "+ex);
}


try
{
    String user=(String)session.getAttribute("Userid");
    Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select count(*) from hostel where UserID="+user);
while(rs.next())
{
   Num=rs.getString(1);
}
}
catch(SQLException ex){out.println(ex);}

%>



<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1>HMS</h1></td>
<td class="Heading-SignUp"><a href="signout.jsp">Sign out</a></td>
<td class="TableMargin"></td>
</tr>
</table>


<!--table width="100%" style="background-color:#e2e2e2">
<tr>
<td width="5%"></td>
<td width="90%" height="50px">

    <table width="100%">
        <tr>
            <td width="50%" align="left"><h1>HMS</h1></td>
            <td  width="50%"  align="right"><a href="Signin.jsp">   Sign out</a></td>
        </tr>
    <tr>
            <td width="50%" align="left"></td>
            <td  width="50%"  align="right">Welcome : <%= session.getAttribute("FullName") %></td>
        </tr>
    </table>

</td>
<td width="5%"></td>
</tr>
</table-->

<table width="100%"  style="border-bottom:1px solid #e2e2e2;border-top:1px solid #e2e2e2">
<tr>
<td width="5%"></td>
<td width="90%" height="100px">

<table width="100%"><tr><td width="50%" align="left"><h3><%= session.getAttribute("FullName")%>` hostels</h3></td><td  width="50%"  align="right"><a href="">Help</a></td></tr></table>

</td>
<td width="5%"></td>
</tr>
</table>


<table width="100%">
<tr>
<td width="5%"></td>
<td width="20%" valign="top">
<table class="dashboardLeft">
    <tr><td><a href="newhostel.jsp">New Hostel</a></td></tr>
    <tr><td><a href="Dashboard.jsp?open=hostelOwner">Your hostel (<%= Num %>)</a></td></tr>
<tr><td><a href="Dashboard.jsp?open=hostelTenant">Tenant</a></td></tr>
<tr><td><a href="mail.jsp">Mail</a></td></tr>
<tr><td><a href="usercontact.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Contact info</a></td></tr>
</table>
</td>
<td width="70%" valign="top">
  
        
<%! String open="hostelOwner";Connection con;%>
        <%
try{open=request.getParameter("open");}catch(NullPointerException ex){out.println("Page not available");}
try{
if(open.equals("hostelOwner"))
    {
try
{
    out.println("<table class='Content'><tr><td align='center'><h2>Your hostel list</h2></td></tr></table>");
    String user=(String)session.getAttribute("Userid");
    
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select h.Hostelname as HostelName, t.name as HostelType, ht.`Name`, h.id from hostel h join hostelgendertype t on t.ID=h.GenderType join users u on u.ID=h.UserId join hosteltype ht on ht.ID=h.TypeID where u.ID= '"+user+"' ORDER BY h.ID DESC");
while(rs.next())
{
  // out.println("<form name='fm' action='Hostel.jsp'>");
     out.println("<table width='100%' style='border-bottom:1px solid #e2e2e2'>");
    // out.println("<tr><td><input type='hidden' name='id' value='"+rs.getInt(4)+"'/><input type='submit' value='"+rs.getString(1)+"'/></td>");
     //out.println("<input  type='submit' name='HostelName' value='"+rs.getString(1)+"'/><input type='hidden' name='HostelID' value='"+rs.getString(4)+"'/>")
 out.println("<tr><td style='font-size:18px'><br><a href='Hostel.jsp?HostelName="+rs.getString(1)+"&HostelID="+rs.getString(4)+"'>"+rs.getString(1)+"</a></font></td>");
out.println("<td valign='top' align='right'></td></tr>");
//out.println("");
out.println("<tr><td>"+rs.getString(2)+" |  "+rs.getString(3)+" </td><td valign='top' align='right'><a href='Blog.jsp?Name="+rs.getString(1)+"&Blogid="+rs.getString(4)+"'>View</a>    </td></tr>");
//out.println("<a href='javascript:document.forms['fm'].submit()'>As a link</a>");
out.println("</table>");

//out.println("</form>");


}
}
catch(SQLException ex){out.println(ex);}
finally{con.close();}
}
else if(open.equals("hostelTenant"))
    {
    
    
    
    
    
    
    
try
{
out.println("<table class='Content'><tr><td align='center'><h2>List of hostel where You lived in</h2></td></tr></table>");
    String user=(String)session.getAttribute("Userid");
   // Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select h.HostelName, ht.`Name` as hosteltypename, ts.`NAME` as tenantstatusname, t.JOINDATE,h.id  from tenant t JOIN users u on u.ID=t.TenantID JOIN beds b on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN tenantstatus ts on ts.ID=t.`status` JOIN hosteltype ht on ht.ID=h.TypeID where u.ID= '"+user+"'  ORDER BY t.JOINDATE DESC");
while(rs.next())
{
  // out.println("<form name='fm' action='tenanthostel.jsp'>");
     out.println("<table width='100%' style='border-bottom:1px solid #e2e2e2'>");
    // out.println("<tr><td><input type='hidden' name='id' value='"+rs.getInt(4)+"'/><input type='submit' value='"+rs.getString(1)+"'/></td>");
     //out.println("<input  type='submit' name='HostelName' value='"+rs.getString(1)+"'/><input type='hidden' name='HostelID' value='"+rs.getString(4)+"'/>")
 out.println("<tr><td style='font-size:18px'><br><a href='tenanthostel.jsp?HostelName="+rs.getString(1)+"&HostelID="+rs.getString(5)+"'>"+rs.getString(1)+"</a></font></td>");
out.println("<td valign='top' align='right'></td></tr>");
//out.println("");
out.println("<tr><td>"+rs.getString(2)+" |  "+rs.getString(3)+"  </td><td valign='top' align='right'> join date : "+rs.getString(4)+"&nbsp&nbsp&nbsp<a href=''>View</a>    </td></tr>");
//out.println("<a href='javascript:document.forms['fm'].submit()'>As a link</a>");
out.println("</table>");

//out.println("</form>");


}
}
catch(SQLException ex){out.println(ex);}
finally{con.close();}









}
else
    {out.println("<h1>Page not found</h1>");}
}

catch(NullPointerException ex){response.sendRedirect("Dashboard.jsp?open=hostelOwner");}
%>



</td>
<td width="5%"></td>
</tr>
</table>
</body>

</html>

