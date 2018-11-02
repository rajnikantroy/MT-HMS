
<%-- 
    Document   : newtenant
    Created on : Oct 11, 2013, 6:47:50 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
<link href="Styles\Style.css" rel="stylesheet" type="text/css" />



<script src="box/shadowbox.js" type="text/javascript"></script>

<script type="text/javascript">

    function Close()
    {
        //window.close();

        Shadowbox.close()
    }

function ValidateTraffic()
{
    //var state=0;
   // alert("on traffic");
      var  state=Validate();
    if(state==1)
    {
        //document.location.href="UserVerification.jsp";
     //alert(" state 1 : "+state);
        Insert();
    }
}

function Validate()
{

     var Floor=document.getElementById("Floor").value;
     var Room=document.getElementById("Rooms").value;
     var Bed=document.getElementById("Bedlist").value;
     var Tenant=document.getElementById("Tenant").value;
        var flag=0;
        if(Floor=="" )
        {
            document.getElementById("Floor").className = 'TextError';
            flag=0;
        }
        else  if(Floor==0)
        {
            document.getElementById("Floor").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Floor").className ='TextSuccess';
            }


        if(Room=="" )
        {
            flag=0;
            document.getElementById("Rooms").className = 'TextError';
       }
       else if(Room==0)
        {
            flag=0;
            document.getElementById("Rooms").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Rooms").className = 'TextSuccess';
            }


             if(Bed=="" )
        {
            flag=0;
            document.getElementById("Bedlist").className = 'TextError';
       }
       else if(Bed==0)
        {
            flag=0;
            document.getElementById("Bedlist").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Bedlist").className = 'TextSuccess';
            }

             if(Tenant=="" )
        {
            flag=0;
            document.getElementById("Tenant").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Tenant").className = 'TextSuccess';
            }



    if(flag==4)
        {return 1;}
        else
        {
            document.getElementById("Message").innerHTML="Something missing";
            return 0;
        }
}


function Insert()
{
   // alert("on insert");
     var Floor=document.getElementById("Floor").value;
     var Room=document.getElementById("Rooms").value;
     var Bed=document.getElementById("Bedlist").value;
     var Tenant=document.getElementById("Tenant").value;
    alert(Floor+""+Room+""+Bed+""+Tenant);
//alert(fname+", "+lname+", "+uname+", "+email+", "+pass+", "+question+", "+answer+", "+DOB);
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
    document.getElementById("Message").innerHTML=xmlhttp.responseText;
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","REGISTERTENANT.jsp?Floor="+Floor+"&Room="+Room+"&Bed="+Bed+"&Tenant="+Tenant,true);
    xmlhttp.send();
}


function LoadBlankBeds()
{
     var Rooms=document.getElementById("Rooms").value;
     document.getElementById("Bedlist").innerHTML='<br><br>Please wait, loading beds for this room';
    // var Beds=document.getElementById("Beds").value;
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
    document.getElementById("Bedlist").innerHTML=xmlhttp.responseText;
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","BINDBLANKBEDSINSELECT.jsp?Rooms="+Rooms,true);
    xmlhttp.send();
}


function LoadBlankRooms()
{
     //alert("Loading rooms...");
     var Floor=document.getElementById("Floor").value;
     document.getElementById("Bedlist").innerHTML='<br><br>Please wait, loading rooms for this floor';
    // var Beds=document.getElementById("Beds").value;
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
    document.getElementById("Rooms").innerHTML=xmlhttp.responseText;
    document.getElementById("Bedlist").innerHTML='';
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","BINDBLANKROOMSINSELECT.jsp?Floor="+Floor,true);
    xmlhttp.send();
}

function LoadBedsDetails()
{
    var bedid=document.getElementById("Beds").value;
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
    document.getElementById("BedDetails").innerHTML=xmlhttp.responseText;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","BEDDETAILS.jsp?BedID="+bedid,true);
    xmlhttp.send();
}
</script>
    </head>
    <body class="room">
        <!--form action="REGISTERROOM.jsp"-->

<table>
     <tr><td>
             <table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>New tenant</h1></td></tr></table>
         </td>
    </tr>

    <tr>
        <td>Only available floors, rooms and beds are here<br><br></td>
    </tr>



      <tr>
        <td class="Bold-Text">Floor</td>
    </tr>
    <tr>
        <td>

             <%! Connection con;%>
              <%
String HID=(String)request.getSession().getAttribute("HostelID");
out.println("<input type='hidden' name='id' value='"+HID+"'/>");
try
{
//Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
//String query="select id, name from floor where hostelid="+HID;


String Query="select distinct f.id, f.`Name` from beds b LEFT OUTER JOIN tenant t on b.ID=t.BedID JOIN room_master r on r.ID=b.RoomID JOIN floor f on f.ID=r.Floor join hostel h on h.ID=f.hostelID where h.ID="+HID+" AND not EXISTS (select * from tenant t where b.ID=t.BedID and t.`status`=1)";
ResultSet rs=s.executeQuery(Query);
out.println("<select id='Floor' name='Floor' onChange='LoadBlankRooms()'>");
out.println("<option value='0'>Select one </option>");
int flag=0;
while(rs.next())
{//out.println("<br>inside while<br>");
    flag++;
    out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
}

    if(flag==0)
        {out.println("<option value='0'>No floors available, all are booked or not created</option>");}
    out.println("</select>");
}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>


        </td>
    </tr>



<tr>
        <td> <br></td>
    </tr>

    <tr>
        <td  class="Bold-Text"></td>
    </tr>

     <tr>
        <td  class="Bold-Text">Room name</td>
    </tr>

     <tr><td>
<select id="Rooms" name="Rooms" onchange="LoadBlankBeds()"></select>
        </td></tr>


 

<tr>
        <td> <br></td>
    </tr>


    
     <tr>
        <td  class="Bold-Text">Bed number</td>
    </tr>

    
     <tr>
        <td>
            
            <select id="Bedlist" name="Bedlist" onchange="LoadBedsDetails()"></select>

        </td>
    </tr>

    

<tr>
        <td> <br></td>
    </tr>




     <!--tr>
        <td class="Bold-Text">Number of beds</td>
    </tr>
    <tr>
        <td><input type="number" placeholder="Number of beds" id="Beds" name="Beds"/></td>
    </tr-->
    <tr>
        <td class="Bold-Text">Email of tenant</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Email of tenant" id="Tenant" name="Tenant"/></td>
    </tr>

    <tr>
        <td>Tenant should be member of HMS</td>
    </tr>

<tr>
        <td> <br></td>
    </tr>



     <tr>
        <td><p id="Message"></p></td>
    </tr>
    <tr>
        <td></td>
         </tr>

       
</table><!--/form-->
<table class="Content"><tr>
        <td align="left"><input type="submit" value="Add" onclick="ValidateTraffic()" /></td>
        <td align="right"><input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" /></td>
    </tr></table>

<table class="Content"><tr><td></td></tr><tr><td><div id="BedDetails"></div></td></tr></table>
   

    </body></html>
