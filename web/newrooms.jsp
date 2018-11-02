<%-- 
    Document   : newrooms
    Created on : Oct 8, 2013, 12:18:36 AM
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
    //var state=0;
    //alert("on traffic");
    
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
        //alert("on client validation");
        var Name=document.getElementById("Name").value;
        var Type=document.getElementById("Type").value;
    //     var Beds=document.getElementById("Beds").value;
        var Floor=document.getElementById("Floor").value;
        //var id=document.getElementById("id").value;
        var flag=0;

             if(Floor=="" )
        {
            flag=0;
            document.getElementById("Floor").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Floor").className = 'TextSuccess';
            }

        if(Name=="" )
        {
            document.getElementById("Name").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Name").className ='TextSuccess';
            }
        if(Type=="" )
        {
            flag=0;
            document.getElementById("Type").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Type").className = 'TextSuccess';
            }

        

    if(flag==3)
        {return 1;}
        else
        {
            document.getElementById("Message").innerHTML="Something missing";
            return 0;
        }
}


function Insert()
{
    //alert("on insert");
     var Name=document.getElementById("Name").value;
     var Type=document.getElementById("Type").value;
  //   var Beds=document.getElementById("Beds").value;
     var Floor=document.getElementById("Floor").value;

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
    LoadRooms();
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","REGISTERROOM.jsp?Name="+Name+"&Type="+Type+"&Floor="+Floor,true);
    xmlhttp.send();
}

function LoadRooms()
{
     //alert("Loading rooms...");
     var Floor=document.getElementById("Floor").value;
     document.getElementById("Roomlist").innerHTML='<br><br>Please wait, loading rooms for this floor';
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
    document.getElementById("Roomlist").innerHTML=xmlhttp.responseText;
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","LISTROOMS.jsp?Floor="+Floor,true);
    xmlhttp.send();
}
</script>
    </head>
    <body class="room">
        <!--form action="REGISTERROOM.jsp"-->

<table>
     <tr>
            <td>
             <table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>Create new rooms</h1></td></tr></table>
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
String query="select id, name from floor where hostelid="+HID+" order by id asc";

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
     <td ><input type="Text" placeholder="Room name" id="Name" name="Name"/></td>
    </tr>

     <tr>
        <td  class="Bold-Text">Type</td>
    </tr>

     <tr>
        <td>
              <%
try
{
//Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select * from roomtype";
ResultSet rs=s.executeQuery(query);
out.println("<select id='Type' name='Type'>");
while(rs.next())
{//out.println("<br>inside while<br>");
    out.println("<option value='"+rs.getInt(1)+"'>"+rs.getString(2)+"</option>");
}
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
        <td><p id="Message"></p></td>
    </tr>
    <tr>
        <td></td>
         </tr>


</table><!--/form-->
<table class="Content"><tr>
        <td align="left"><input type="submit" value="Add" onClick="ValidateTraffic()" /></td>
        <td align="right"><input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" /></td>
    </tr></table>

<table class="Content"><tr><td></td></tr><tr><td><div id="Roomlist"></div></td></tr></table>
   
    </body></html>
