<%-- 
    Document   : ADDHOSTELCONTACT
    Created on : Oct 13, 2013, 1:27:47 AM
    Author     : VIKASH
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
        <%!String HID;%>
<%
    try {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
        Statement s=con.createStatement();

        try{HID=request.getSession().getAttribute("HostelID").toString();}catch(NullPointerException ex){out.println("Select a hostel");}
        String country=request.getParameter("Country");
        String state=request.getParameter("State");
        String city=request.getParameter("City");
        String landmark=request.getParameter("landMark");
        String address=request.getParameter("Address");
        int pin=Integer.parseInt(request.getParameter("Pin"));
        int pphone=Integer.parseInt(request.getParameter("PPhone"));
        int sphone=Integer.parseInt(request.getParameter("SPhone"));
        int pmobile=Integer.parseInt(request.getParameter("PMobile"));
        int smobile=Integer.parseInt(request.getParameter("SMobile"));
        int faxno=Integer.parseInt(request.getParameter("FaxNo"));
        String email=request.getParameter("Email");
        String website=request.getParameter("Website");

        String query="insert into hostel_contact(HostelID,Phone,SecPhone,Mobile,SecMobile,Fax,Email,Website,Country,State,City,NearLandMark,Pin,FullAddress) values('"+HID+"', '"+pphone+"', '"+sphone+"', '"+pmobile+"', '"+smobile+"', '"+faxno+"', '"+email+"', '"+website+"', '"+country+"', '"+state+"', '"+city+"', '"+landmark+"', '"+pin+"', '"+address+"')";
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
