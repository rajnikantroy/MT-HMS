<%-- 
    Document   : newbeds
    Created on : Oct 11, 2013, 3:18:02 PM
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

function ValidateTraffic()
{
    var  state=Validate();
    if(state==1)
    {
        Insert();
    }
}

function Validate()
{
       // alert("on client validation");
        var Rooms=document.getElementById("Rooms").value;
        var Beds=document.getElementById("Beds").value;
    //     var Beds=document.getElementById("Beds").value;
        //var Floor=document.getElementById("Floor").value;
        //var id=document.getElementById("id").value;
        var flag=0;
        if(Rooms=="" )
        {
            document.getElementById("Rooms").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Rooms").className ='TextSuccess';
            }
        if(Beds=="" )
        {
            flag=0;
            document.getElementById("Beds").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Beds").className = 'TextSuccess';
            }
     

    if(flag==2)
        {return 1;}
        else
        {
            document.getElementById("Message").innerHTML="Something is missing.";
            return 0;
        }
}


function Insert()
{
    //alert("on insert");
     var Rooms=document.getElementById("Rooms").value;
     var Beds=document.getElementById("Beds").value;
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
    LoadBeds();
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","REGISTERBEDS.jsp?Rooms="+Rooms+"&Beds="+Beds,true);
    xmlhttp.send();
}

function LoadRooms()
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
  xmlhttp.open("GET","BINDROOMSINSELECT.jsp?Floor="+Floor,true);
    xmlhttp.send();
}

function LoadBeds()
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
  xmlhttp.open("GET","LISTBEDS.jsp?Rooms="+Rooms,true);
    xmlhttp.send();
    
}

</script>
    </head>
    <body class="room">
        <!--form action="REGISTERROOM.jsp"-->

<table>
     <tr>
         <td>
     <table  class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>New beds</h1></td></tr></table>
         </td>
         
    </tr>

    <tr>
        <td  class="Bold-Text"><br><br></td>
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
String query="select id, name from floor where hostelid="+HID;

ResultSet rs=s.executeQuery(query);
out.println("<select id='Floor' name='Floor' onChange='LoadRooms()'>");
out.println("<option value='0'>Select one </option>");
int flag=0;
while(rs.next())
{//out.println("<br>inside while<br>");
    flag++;
    out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
}

    if(flag==0)
        {out.println("<option value='0'>No floors available finish step 1 first</option>");}
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
        <td  class="Bold-Text"></td>
    </tr>

     <tr>
        <td  class="Bold-Text">Room name</td>
    </tr>

     <tr>
        <td>
           
             
<select id="Rooms" name="Rooms" onchange="LoadBeds()"></select>
        </td>
    </tr>

     <!--tr>
        <td class="Bold-Text">Number of beds</td>
    </tr>
    <tr>
        <td><input type="number" placeholder="Number of beds" id="Beds" name="Beds"/></td>
    </tr-->
    <tr>
        <td class="Bold-Text">Beds name</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Bed number" id="Beds" name="Beds"/></td>
    </tr>
     <tr>
        <td><p id="Message"></p></td>
    </tr>
    <tr>
        <td></td>
         </tr>

         <!--tr>
        <td>
            <h1>
        <a id="sb-nav-close" title="close" onclick="">X</a>
</h1>




        </td>
         </tr-->

</table><!--/form-->
<table class="Content"><tr>
        <td align="left"><input type="submit" value="Add" onclick="ValidateTraffic()" /></td>
        <td align="right"><input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" /></td>
    </tr></table>

<table class="Content"><tr><td></td></tr><tr><td><div id="Bedlist"></div></td></tr></table>
    </body></html>
