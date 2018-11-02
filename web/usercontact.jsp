<%-- 
    Document   : usercontact
    Created on : Oct 29, 2013, 3:51:17 AM
    Author     : Administrator
--%>

<%@page import="java.sql.*"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<!-- Jquery -->

<script src="Scripts/jquery.min.js">
</script>


  <link href="Styles\Style.css" rel="stylesheet" type="text/css" />


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hostel management system | HMS | Setup your hostel from home</title>
<script language="javascript">



function Loadstate()
{
   // countryValidator();

   // var value=val.value;
   // alert(Name+", "+value);
   var country=document.getElementById("Country").value;

     //  document.getElementById("State").innerHTML='<option value=1>'+country+'</option>';
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("State").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","LOADSTATE.jsp?Country="+country,true);
xmlhttp.send();

}
function LoadCity()
{

   // stateValidator();
     var state=document.getElementById("State").value;

     //  document.getElementById("State").innerHTML='<option value=1>'+country+'</option>';
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
  if (xmlhttp.readyState==4 && xmlhttp.status==200)
    {
    document.getElementById("City").innerHTML=xmlhttp.responseText;
    }
  }
xmlhttp.open("GET","LOADCITY.jsp?State="+state,true);
xmlhttp.send();
}

function Insert()
{
        //var fname=document.getElementById("HName").value;
        var country=document.getElementById("Country").value;
        var state=document.getElementById("State").value;
        var city=document.getElementById("City").value;
        //var landmark=document.getElementById("landMark").value;
        var address=document.getElementById("address").value;
        var pin=document.getElementById("Pin").value;
        var pphone=document.getElementById("PPhone").value;
        //var sphone=document.getElementById("SPhone").value;
        var pmobile=document.getElementById("PMobile").value;
var xmlhttp;
if (window.XMLHttpRequest)
  {// code for IE7+, Firefox, Chrome, Opera, Safari
  xmlhttp=new XMLHttpRequest();
  }
else
  {// code for IE6, IE5
  xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
  }
xmlhttp.onreadystatechange=function()
  {
 // if (xmlhttp.readyState==4 && xmlhttp.status==200)
   // {
    document.getElementById("Message").innerHTML=xmlhttp.responseText;
    //}
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
 var query="ADDUSERCONTACT.jsp?Country="+country+"&State="+state+"&City="+city+"&Address="+address+"&Pin="+pin+"&PPhone="+pphone+"&PMobile="+pmobile;
  xmlhttp.open("GET",query,true);
alert(query);
xmlhttp.send();

}
</script>
</head>
<body>
   <!--%
   // New location to be redirected
   String site = new String("Dashboard.jsp");
   response.setStatus(response.SC_MOVED_TEMPORARILY);
   response.setHeader("Location", site);
%-->
<!-- Heading -->
<table class="Content">
    <tr><td width="15%"></td><td><table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("FullName")%></h3></td><td><h1>User information</h1></td></tr></table></td><td  width="15%"></td></tr>
</table>
<!-- Content -->
<table class="Content" style="padding-left: 10%;padding-right: 10%">
    <tr><td class="TableMargin"></td>

        <td class="ContentSpace">

            <!--form action="" name="NewHostel" method="post"-->
            <table class="Content">


    <tr><td  class="Content">  </td></tr>

   <tr><td class="Bold-Text">Country</td> </tr>
<tr><td>
<%
 try
                {
     Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select * from Country";
ResultSet rs=s.executeQuery(query);
out.println("<select id='Country' name='Country' onChange='Loadstate()'>");
out.println("<option value=-1>--Select option--</option>");
while(rs.next())
    {//out.println("<br>inside while<br>");
    out.println("<option value="+rs.getInt(1)+">"+rs.getString(2)+"</option>");

}
out.println("</select>");
}
 catch(SQLException ex)
         {
out.println(ex);
}
%>
    </td> </tr>

<tr><td><p id="CountryMSG"></p></td></tr>


 <tr><td class="Bold-Text">State</td> </tr>
<tr><td>
        <select id="State" name="State" onchange="LoadCity()"></select>


    </td> </tr>
<tr><td><p id="StateMSG"></p></td></tr>




 <tr><td class="Bold-Text">City</td> </tr>
<tr><td>
        <select id="City" name="City"></select>

    </td> </tr>
<tr><td><p id="CityMSG"></p></td></tr>



 <tr><td class="Bold-Text">Full address</td> </tr>
 <tr><td><input type="text" placeholder="Streat details" id="address" name="address"/></td> </tr>
<tr><td><p id="AddressMSG">It should be address where people can contact you easily</p></td></tr>



 <tr><td class="Bold-Text">Pin</td> </tr>
 <tr><td><input type="text" placeholder="Pin/zip" id="Pin" name="Pin"/></td> </tr>
<tr><td><p id="PinMSG"></p></td></tr>

 <tr><td class="Bold-Text">Primary phone</td> </tr>
 <tr><td><input type="text" placeholder="Primary phone" id="PPhone" name="PPhone"/></td> </tr>
<tr><td><p id="PPhoneMSG"></p></td></tr>


 <tr><td class="Bold-Text">Primary mobile</td> </tr>
 <tr><td><input type="text" placeholder="Primary mobile" id="PMobile" name="PMobile"/></td> </tr>
<tr><td><p id="PMobiletMSG"></p></td></tr>



 <tr><td class="Bold-Text"><p id="Message"></p></td> </tr>


            </table>
<!--/form-->
        </td>
        <td class="TableMargin"></td></tr>
</table>
    <table class="Content"><tr><td width="15%"></td>
        <td align="left"><input type="submit" value="add contact" onclick="Insert()"/></td>
        <td align="right"><input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" /></td>
        <td width="10%"></td>
        </tr></table>

</body>
</html>
