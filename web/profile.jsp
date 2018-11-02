<%-- 
    Document   : profile
    Created on : Oct 28, 2013, 10:33:35 PM
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

try
        {
 HostelName=request.getSession().getAttribute("HostelName").toString();
   HID=Integer.parseInt(request.getSession().getAttribute("HostelID").toString());
   TenantEmail=request.getParameter("TenantEmail");
}
catch(NullPointerException ex){}
%>
<!--table class='Titlebar'><tr><td align='left'><h3>"+HostelName+"</h3></td><td><h1>Personal information</h1></td></tr></table-->
<table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>Personal information</h1></td></tr></table>
<form action="profile.jsp" class="Content">
    <table class="Content">
    <tr><td colspan="2" class="Bold-Text">Enter email of tenant</td></tr>
    <tr><td><input type="email" name="TenantEmail"/></td><td><input type="submit" value="Show profile"/></td></tr>
</table>
</form>

        <%

       
      
        try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query1="select u.FirstName, u.LastName, u.Email, u.DOB, c.Phone, c.mobile, c.Pin, c.Address ,ct.`Name` as city , st.`Name` as state  , cn.`Name` as country from users u LEFT OUTER JOIN userscontact c on u.ID=c.UID JOIN country cn on cn.ID=c.countryID JOIN state st on st.ID=c.stateID JOIN city ct on ct.ID=c.cityID where u.Email='"+TenantEmail+"'";
int cnt=0;
ResultSet rs1=s.executeQuery(query1);
//out.println("<br><br><table class='Transaction'><tr><th>Transaction date</th><th>From</th><th>To</th><th>Total</th><th>Paid</th><th>Discount</th><th>Remaining</th><td></td></tr>");
out.println("<table cellspacing='10' class='Content'><tr><td colspan='2' class='Bold-Text'></td></tr>");
while(rs1.next())
{
cnt++;
out.println("<tr><td class='Bold-Text'>Fullname</td><td class='Bold-Text'>Pin</td></tr>");
out.println("<tr><td>"+rs1.getString(1)+" "+rs1.getString(2)+"</td><td>"+rs1.getString(7)+"</td></tr>");
out.println("<tr><td class='Bold-Text'>Email</td><td class='Bold-Text'>City</td></tr>");
out.println("<tr><td>"+rs1.getString(3)+"</td><td>"+rs1.getString(9)+"</td></tr>");
out.println("<tr><td class='Bold-Text'>Date of birth</td><td class='Bold-Text'>State</td></tr>");
out.println("<tr><td>"+rs1.getString(4)+"</td><td>"+rs1.getString(10)+"</td></tr>");
out.println("<tr><td class='Bold-Text'>Phone</td><td class='Bold-Text'>Country</td></tr>");
out.println("<tr><td>"+rs1.getString(5)+"</td><td>"+rs1.getString(11)+"</td></tr>");
out.println("<tr><td class='Bold-Text'>Mobile</td><td class='Bold-Text'></td></tr>");
out.println("<tr><td>"+rs1.getString(6)+"</td><td></td></tr>");
out.println("<tr><td class='Bold-Text'>Full address</td><td class='Bold-Text'></td></tr>");
out.println("<tr><td colspan='2'>"+rs1.getString(8)+"</td></tr>");
/*out.println("<tr><td class='Bold-Text'></td><td class='Bold-Text'></td></tr>");
out.println("<tr><td></td><td></td></tr>");
out.println("<tr><td class='Bold-Text'></td><td class='Bold-Text'></td></tr>");
out.println("<tr><td></td><td></td></tr>");
out.println("<tr><td class='Bold-Text'></td><td class='Bold-Text'></td></tr>");
out.println("<tr><td></td><td></td></tr>");
out.println("<tr><td class='Bold-Text'></td><td class='Bold-Text'></td></tr>");
out.println("<tr><td></td><td></td></tr>");
*/}
if(cnt==0)
    {
out.println("<tr><td colspan='2'>User have not updated the details.ask to tenant to update their details before taking into hostel.</td></tr>");
}
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
