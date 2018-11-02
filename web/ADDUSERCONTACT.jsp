<%-- 
    Document   : ADDUSERCONTACT
    Created on : Oct 29, 2013, 4:37:16 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%!String UID;%>
<%
    try {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
        Statement s=con.createStatement();

        try{UID=request.getSession().getAttribute("Userid").toString();}catch(NullPointerException ex){out.println("Select a hostel");}
        String country=request.getParameter("Country");
        String state=request.getParameter("State");
        String city=request.getParameter("City");
        String address=request.getParameter("Address");
        int pin=Integer.parseInt(request.getParameter("Pin"));
        int pphone=Integer.parseInt(request.getParameter("PPhone"));
        int pmobile=Integer.parseInt(request.getParameter("PMobile"));

        String query="insert into userscontact(UID,Phone,Mobile,CountryID,StateID,CityID,Pin,Address) values('"+UID+"', '"+pphone+"', '"+pmobile+"', '"+country+"', '"+state+"', '"+city+"', '"+pin+"', '"+address+"')";
        //out.println(query);
        Statement st=con.createStatement();
        boolean b= st.execute(query);
        if(!b)
         {
              out.println("<font color='green'>Contact saved successfully...</font>");
         }
        else
            {
             out.println("<font color='#D5402C'>Try again...</font>");
            }


  }
  catch(SQLException ex)
  {
      out.println("<font color='#D5402C'>Contact cant be updated...</font>");
   }
    catch(NumberFormatException e){out.println("<font color='#D5402C'>No any number can be greater then 10 digit</font>");}

 %>
    </body>
</html>
