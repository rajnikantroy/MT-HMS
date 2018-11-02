<%-- 
    Document   : Signin
    Created on : Oct 6, 2013, 7:07:42 PM
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
       
            String Email=request.getParameter("Email");
            String Pass=request.getParameter("Pass");

//out.println(Firstname+""+Lname+""+Uname+""+Email+""+Password+""+Question+""+Answer+""+DOB);
try
{
Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/HMS", "root", "123456");
  //String Query = "select count(*) from users where email='"+Email+"' and PASSWORD='"+Pass+"'";

String Query="select COUNT(*), u.UserName, r.`Name`,u.FirstName , u.LastName, h.PageName,u.id from users u join userrole r on r.ID=u.Role join homepage h ON h.RoleID=u.Role  where email='"+Email+"' and PASSWORD='"+Pass+"'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(Query);
//st.execute(Query);
while(rs.next())
{
if(rs.getString(1).equals("1"))
{
//.println("Welcome");

    //session.setAttribute("Usersid",rs.getString(3) )
   //if(rs.getString(2).equals("Admin")){response.sendRedirect("Admin.jsp");}
   // else if(rs.getString(2).equals("Users")){response.sendRedirect("Users.jsp");}

session.setAttribute("Username", rs.getString(2));
session.setAttribute("Role", rs.getString(3));
session.setAttribute("FullName", rs.getString(4)+" "+rs.getString(5));
session.setAttribute("Page", rs.getString(6));
session.setAttribute("Userid", rs.getString(7));

//String s=(String)session.getAttribute("Username");


response.sendRedirect("signin.jsp");


    }
 else
{
response.sendRedirect("signin.jsp");
   // out.println("Unauthorised user!!!");
//RequestDispatcher rd=getServletContext().getRequestDispatcher("/signin.jsp");
//rd.include(request, response);
 }
}
}
catch(SQLException ex)
        {out.println(ex);}

%>
    </body>
</html>
