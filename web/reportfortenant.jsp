<%-- 
    Document   : reportfortenant
    Created on : Oct 29, 2013, 12:16:36 PM
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
        <%! Connection con; String HID, UID, HostelName; %>
        <%
        String Type=request.getParameter("Type");
        HID=request.getSession().getAttribute("HostelID").toString();
        UID=request.getSession().getAttribute("Userid").toString();
        UID=request.getSession().getAttribute("Userid").toString();
        HostelName=request.getSession().getAttribute("HostelName").toString();
        if(Type.equals("Beds"))
    {
        try
{
            out.println("<table class='Titlebar'><tr><td align='right'><h1>Beds details</h1></td></tr></table>");
   //String HID=(String)request.getSession().getAttribute("HostelID");
   // String user=(String)session.getAttribute("Userid");
    //Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select f.`Name`, r.RoomName, b.`Name`, ts.`NAME`, t.JOINDATE from hostel h JOIN floor f on f.hostelID=h.ID JOIN room_master r on r.Floor=f.ID JOIN beds b on b.RoomID=r.ID JOIN tenant t on t.BedID=b.ID JOIN users u on u.ID=t.TenantID JOIN tenantstatus ts on ts.ID=t.`status` where h.ID="+HID+" and u.ID="+UID+"");
out.println("<br><table class='Content' ><tr><td>Floor</td><td>Room</td><td>Bed</td><td>Status </td><td>Join date</td></tr>");
int NumberOfRooms=0;
while(rs.next())
{
    NumberOfRooms++;
   out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td></tr>");
}
out.println("<tr><td colspan='4'><br> Number of times you lived in '"+HostelName+"': "+NumberOfRooms+"</td></tr>");

out.println("</table>");
}
catch(SQLException ex){out.println(ex);}
finally{ con.close();}
}


else if(Type.equals("AllBeds"))
{

try
{

 out.println("<table class='Titlebar'><tr><td align='right'><h1>All beds</h1></td></tr></table>");
   String HID=(String)request.getSession().getAttribute("HostelID");
    String user=(String)session.getAttribute("Userid");
    //Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
String RoomQuery="select b.`Name` as bedname, r.RoomName, rt.`Name` as roomtype, f.`Name` as floor from room_master r join floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN roomtype rt on rt.ID=r.TypeID JOIN beds b on b.RoomID=r.ID where h.ID="+HID+" ORDER BY f.ID ASC";

ResultSet rs=st.executeQuery(RoomQuery);
out.println("<br><table class='Content' border-bottom='1px dotted #e2e2e2'><tr><td>Bed name</td><td>Room name</td><td>Type</td><td>Floor</td></tr>");
int NumberOfBeds=0;
while(rs.next())
{
    NumberOfBeds++;
   out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
}
out.println("<tr><td colspan='4'><br> Total number of beds : "+NumberOfBeds+"</td></tr>");
out.println("</table>");
}
catch(SQLException ex){out.println(ex);}
finally{ con.close();}


}


        else if(Type.equals("Blank"))
            {



try
{

 out.println("<table class='Titlebar'><tr><td align='right'><h1>Blank beds(These beds are not being used)</h1></td></tr></table>");
   String HID=(String)request.getSession().getAttribute("HostelID");
    String user=(String)session.getAttribute("Userid");
    //Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
//String RoomQuery="select b.`Name` as bedname, r.RoomName, rt.`Name` as roomtype, f.`Name` as floor from room_master r join floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN roomtype rt on rt.ID=r.TypeID JOIN beds b on b.RoomID=r.ID where h.ID="+HID+" ORDER BY f.ID ASC";
 String Query="select b.`Name` as bedname, r.RoomName as roomname, rt.`Name` as roomtype, f.`Name` as floorname from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID join roomtype rt on rt.ID=r.TypeID where h.ID="+HID+" AND not EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1) ORDER BY f.ID ASC";

ResultSet rs=st.executeQuery(Query);
out.println("<br><table class='Content' border-bottom='1px dotted #e2e2e2'><tr><td>Bed name</td><td>Room name</td><td>Type</td><td>Floor</td></tr>");
int NumberOfBeds=0;
while(rs.next())
{
    NumberOfBeds++;
   out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td></tr>");
}
out.println("<tr><td colspan='4'><br> Total number of beds : "+NumberOfBeds+"</td></tr>");
out.println("</table>");
}
catch(SQLException ex){out.println(ex);}
finally{ con.close();}




        }

         else if(Type.equals("Full"))
            {



             try
{

 out.println("<table class='Titlebar'><tr><td align='right'><h1>Beds details with active tenant</h1></td></tr></table>");
   String HID=(String)request.getSession().getAttribute("HostelID");
    //String user=(String)session.getAttribute("Userid");
    //Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
//String RoomQuery="select b.`Name` as bedname, r.RoomName, rt.`Name` as roomtype, f.`Name` as floor from room_master r join floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN roomtype rt on rt.ID=r.TypeID JOIN beds b on b.RoomID=r.ID where h.ID="+HID+" ORDER BY f.ID ASC";
             String Query="select u.FirstName, u.Email, b.`Name`, r.RoomName, rt.`Name` , f.`Name` from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID join roomtype rt on rt.ID=r.TypeID JOIN users u on u.ID=t.TenantID where h.ID="+HID+" AND EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1) ORDER BY f.ID ASC";

ResultSet rs=st.executeQuery(Query);
out.println("<br><table class='Content' border-bottom='1px dotted #e2e2e2'><tr><td>Tenant firstname</td><td>Email</td><td>Bed number</td><td>Room number</td><td>Room type</td><td>Floor number</td></tr>");
int NumberOfBeds=0;
while(rs.next())
{
    NumberOfBeds++;
   out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
}
out.println("<tr><td colspan='4'><br> Total number of tenants : "+NumberOfBeds+"</td></tr>");
out.println("</table>");
}
catch(SQLException ex){out.println(ex);}
finally{ con.close();}
        }



         else if(Type.equals("Summary"))
            {



             try
{

 out.println("<table class='Titlebar'><tr><td align='right'><h1>Beds details with active tenant</h1></td></tr></table>");
   String HID=(String)request.getSession().getAttribute("HostelID");
    //String user=(String)session.getAttribute("Userid");
    //Connection con;
    Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement st=con.createStatement();
//String RoomQuery="select b.`Name` as bedname, r.RoomName, rt.`Name` as roomtype, f.`Name` as floor from room_master r join floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN roomtype rt on rt.ID=r.TypeID JOIN beds b on b.RoomID=r.ID where h.ID="+HID+" ORDER BY f.ID ASC";
             String Query="select u.FirstName, u.Email, b.`Name`, r.RoomName, rt.`Name` , f.`Name` from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID join roomtype rt on rt.ID=r.TypeID JOIN users u on u.ID=t.TenantID where h.ID="+HID+" AND EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1) ORDER BY f.ID ASC";

ResultSet rs=st.executeQuery(Query);
out.println("<br><table class='Content' border-bottom='1px dotted #e2e2e2'><tr><td>Tenant firstname</td><td>Email</td><td>Bed number</td><td>Room number</td><td>Room type</td><td>Floor number</td></tr>");
int NumberOfBeds=0;
while(rs.next())
{
    NumberOfBeds++;
   out.println("<tr><td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td></tr>");
}
out.println("<tr><td colspan='4'><br> Total number of tenants : "+NumberOfBeds+"</td></tr>");
out.println("</table>");
}
catch(SQLException ex){out.println(ex);}
finally{ con.close();}
        }




%>


    </body>
</html>
