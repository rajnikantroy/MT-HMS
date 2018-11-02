<%-- 
    Document   : REGISTERBILLITEM
    Created on : Oct 21, 2013, 10:21:53 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body style="margin: 15%; font-size: 20px;">
<%@page import="java.sql.*"%>




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



<%!Connection con;String Firstname, TenantEmail, HID; int TenantID, BedID, status; %>
<%

TenantEmail=request.getParameter("TenantEmail");
 HID=(String)request.getSession().getAttribute("HostelID");

   try
{

Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");



Statement s=con.createStatement();

String query="select id, Firstname from users where email='"+TenantEmail+"'";
ResultSet rs=s.executeQuery(query);

while(rs.next())
    {
    TenantID=rs.getInt(1);
    Firstname=rs.getString(2);
}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<font color='#D5402C'> <h2>"+TenantEmail+" is not a user of this system, say '"+TenantEmail+"' to register first</h2></font>");
    //out.println("<h2><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></h2>");
}
     finally{con.close();}

   try
{

Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");



Statement s=con.createStatement();

String query="select t.BedID, t.status from tenant t join tenantstatus ts on ts.ID=t.`status` JOIN beds b on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID JOIN users u on u.ID=t.TenantID WHERE u.Email='"+TenantEmail+"' and h.ID="+HID+" and ts.`NAME`='Active'";
ResultSet rs=s.executeQuery(query);

while(rs.next())
    {
    BedID=rs.getInt(1);
    status=rs.getInt(2);
    //Firstname=rs.getString(2);
}
}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    out.println("<font color='#D5402C'><h2>'"+TenantEmail+"' hasn`t assign any beds, assign bed first to apply any bill item on it.</h2></font>");
    //out.println("<h2><font  color=''>'"+RoomName+"' is already created in this floor, type another name.</font></h2>");
}
     finally{con.close();}







  %>



        <%
        String FacilityItem[]=request.getParameterValues("Item");
        int FacilityID;
        int count=0, count1=0, count2=0;
        int len=FacilityItem.length;
for(int i=0;i<FacilityItem.length;i++)
{

FacilityID=Integer.parseInt(FacilityItem[i]);    
   
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");

Statement s=con.createStatement();
String query="insert into tenantfacility(bedID, tenantID, FacilityID, Status) values('"+BedID+"', '"+TenantID+"', '"+FacilityID+"', '"+status+"')";

boolean confirmation=s.execute(query);
if(!confirmation)
    {count++;}
else{count1++;}

}
catch(SQLException ex)
{//this catch is for connection and drivers}
    //out.println(ex);
    count2++;
    //out.println("<h2><font color=''>'"+Facility+"' is already exist.</font></h2>");
}
     finally{con.close();}
     }
        if(len==count)
            {
            out.println("<font color='green'><h2> successfully added all billitems for '"+Firstname+"' go to next step. </h2></font>");
        }
        else   if(count2>=1)
            {
            //int res=len-count1;
            out.println("<font color='#D5402C'><h2>You tried to insert '"+len+"' facility but "+count2+" were already assign to '"+TenantEmail+"'</h2></font>");
}
        else if(count1>=0)
            {
            int res=len-count1;
            out.println("<font color='#D5402C'><h2>Inserted only first "+res+" bill items, again add last left items</h2></font>");
}
      
%>
<br><br><br><br><br>
<input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" />
    </body>
</html>
