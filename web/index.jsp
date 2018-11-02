<%-- 
    Document   : index
    Created on : Oct 2, 2013, 10:58:12 PM
    Author     : Administrator
--%>


<%@page import="com.sun.crypto.provider.RSACipher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search hostel near your college, office</title>

  <link href="Styles\Style.css" rel="stylesheet" type="text/css" />
  <script language="javascript">
      function OpenBlog(id)
      {
          //alert(id);
          document.location.href="Blog.jsp?Blogid="+id;

          //document.write();
      }

  </script>
 </head>
    <body>
        <table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1>HMS</h1></td>
<td class="Heading-SignUp"><a href="signin.jsp">Sign in</a></td>
<td class="TableMargin"></td>
</tr>
</table>

<form action="index.jsp" method="get" name="Content">
<table class="Content">
<tr>
<td width="10%"></td>
<td> <input type="text" name="Search" placeholder="Search hostel by hostel name, city or near landmark."/></td>
<td><input type="submit" value="Search"/></td>
<td width="10%"></td>
</tr>
</table>
</form>



<table class="Content">
<tr>
<td width="10%"></td>
<td width="80%"><br><br></td>
<td width="10%"></td>
</tr>
</table>



<%! Connection con; int flag=0; %>
<%
try{
String Content=request.getParameter("Search").toString();
if(!Content.isEmpty())
{
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select h.HostelName,cn.name, s.name, ct.name, c.NearLandmark, h.ID  from hostel h JOIN hostel_contact c on h.ID=c.hostelID join country cn on cn.id=c.Country join state s on s.id=c.state join city ct on ct.id=c.city where h.HostelName LIKE '%"+Content+"%' OR ct.name LIKE '%"+Content+"%' or c.NearLandmark like '%"+Content+"%'";
ResultSet rs1=s.executeQuery(query);
/*out.println("<table class='Content'><tr><td width='10%'></td><td width='80%'>");
while(rs1.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    //out.println("<table  style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td colspan='4' style='font-size:18px'><br><a href='Hostel.jsp?HostelName="+rs1.getString(1)+"&HostelID="+rs1.getString(6)+"'>"+rs1.getString(1)+"</a></font></td></tr><tr><td>Country : "+rs1.getString(2)+"</td><td>State : "+rs1.getString(3)+"</td><td>City : "+rs1.getString(4)+"</td><td> Landmark : "+rs1.getString(5)+"</td></tr></table>");
   //out.println("<form action='Blog.jsp' method='get' class='Content'><table  style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td><input type='hidden' name='Blogid' value='"+rs1.getString(6)+"'/><input type='submit' name='Name' value='"+rs1.getString(1)+"'/></td></tr><tr><td>Country : "+rs1.getString(2)+"</td><td>State : "+rs1.getString(3)+"</td><td>City : "+rs1.getString(4)+"</td><td> Landmark : "+rs1.getString(5)+"</td></tr></table></form>");
   out.println("<table style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td style='font-size:18px'><br><a href='Blog.jsp?Name="+rs1.getString(1)+"&Blogid="+rs1.getString(6)+"'>"+rs1.getString(1)+"</a></td></tr><tr><td>Country : "+rs1.getString(2)+"</td><td>State : "+rs1.getString(3)+"</td><td>City : "+rs1.getString(4)+"</td><td> Landmark : "+rs1.getString(5)+"</td></tr></table>");

}*/


out.println("<table class='Content'><tr><td width='10%'></td><td width='80%'>");
while(rs1.next())
{
    flag++;
     out.println("<table style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td style='font-size:18px' width='20%'><a href='Blog.jsp?Name="+rs1.getString(1)+"&Blogid="+rs1.getString(6)+"'>"+rs1.getString(1)+"</a></td><td  width='20%'>Country : "+rs1.getString(2)+"</td><td width='20%'>State : "+rs1.getString(3)+"</td><td width='20%'>City : "+rs1.getString(4)+"</td><td width='20%'> Landmark : "+rs1.getString(5)+"</td></tr></table>");
    //out.println("<br>inside while<br>");
   //out.println("<form action='Blog.jsp' method='get' class='Content'><table  style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td><input type='hidden' name='Blogid' value='"+rs.getString(6)+"'/><input type='submit' name='Name' value='"+rs.getString(1)+"'/></td></tr><tr><td>Country : "+rs.getString(2)+"</td><td>State : "+rs.getString(3)+"</td><td>City : "+rs.getString(4)+"</td><td> Landmark : "+rs.getString(5)+"</td></tr></table></form>");
}



out.println("</td><td width='10%'></td></tr></table>");
if(flag==0)
    {out.println("<font color='#D5402C'>No hostel available.</font>");}

}
catch(SQLException ex1)
{
    out.println(ex1);
}
finally{con.close();}
              }
              }
              catch(NullPointerException ex)
              {

              try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select h.HostelName,cn.name, s.name, ct.name, c.NearLandmark, h.ID  from hostel h JOIN hostel_contact c on h.ID=c.hostelID join country cn on cn.id=c.Country join state s on s.id=c.state join city ct on ct.id=c.city";
ResultSet rs=s.executeQuery(query);
//out.println("<table><tr><td></td></tr>");

out.println("<table class='Content'><tr><td width='10%'></td><td width='80%'>");
while(rs.next())
{
    flag++;
     out.println("<table style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td style='font-size:18px' width='20%'><a href='Blog.jsp?Name="+rs.getString(1)+"&Blogid="+rs.getString(6)+"'>"+rs.getString(1)+"</a></td><td  width='20%'>Country : "+rs.getString(2)+"</td><td width='20%'>State : "+rs.getString(3)+"</td><td width='20%'>City : "+rs.getString(4)+"</td><td width='20%'> Landmark : "+rs.getString(5)+"</td></tr></table>");
    //out.println("<br>inside while<br>");
   //out.println("<form action='Blog.jsp' method='get' class='Content'><table  style='border-bottom:1px solid #e2e2e2' class='Content'><tr><td><input type='hidden' name='Blogid' value='"+rs.getString(6)+"'/><input type='submit' name='Name' value='"+rs.getString(1)+"'/></td></tr><tr><td>Country : "+rs.getString(2)+"</td><td>State : "+rs.getString(3)+"</td><td>City : "+rs.getString(4)+"</td><td> Landmark : "+rs.getString(5)+"</td></tr></table></form>");
}
 out.println("</td><td width='10%'></td></tr></table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>No hostel available.</font>");}

}

catch(SQLException ex1)
{
    out.println("Error in second try : "+ex1);
}
 finally{con.close();}

}
%>

    </body>
</html>
