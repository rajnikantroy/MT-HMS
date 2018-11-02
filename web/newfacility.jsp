<%-- 
    Document   : newfacility
    Created on : Oct 16, 2013, 2:17:34 AM
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
        var Facility=document.getElementById("Facility").value;
         var Desc=document.getElementById("Desc").value;

        //var Beds=document.getElementById("Beds").value;
    //     var Beds=document.getElementById("Beds").value;
        //var Facility=document.getElementById("Facility").value;
        //var id=document.getElementById("id").value;
        var flag=0;
        if(Facility=="" )
        {
            document.getElementById("Facility").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Facility").className ='TextSuccess';
            }
  if(Desc=="" )
        {
            document.getElementById("Desc").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Desc").className ='TextSuccess';
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
     var Facility=document.getElementById("Facility").value;

     var Desc=document.getElementById("Desc").value;

     //var Beds=document.getElementById("Beds").value;
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
    LoadFacility()
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","REGISTERFACILITY.jsp?Facility="+Facility+"&Desc="+Desc,true);
    xmlhttp.send();
    //LoadFacility();
}

function LoadFacility()
{
    // var Facility=document.getElementById("Facility").value;
     document.getElementById("Facilitylist").innerHTML='<br><br>Please wait, loading Facilities for this hostel';
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
    document.getElementById("Facilitylist").innerHTML=xmlhttp.responseText;
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","LISTFACILITY.jsp",true);
    xmlhttp.send();

}

</script>
    </head>
    <body class="room" onload="LoadFacility()">
        <!--form action="REGISTERROOM.jsp"-->

<table>
     <tr>
         <td>
             <table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>New Facility</h1></td></tr></table>
         </td>
    </tr>

    <tr>
        <td  class="Bold-Text"><br><br></td>
    </tr>

    <tr>
        <td  class="Bold-Text"></td>
    </tr>


    <tr>
        <td class="Bold-Text">Facility name</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Facility name" id="Facility" name="Facility"/></td>
    </tr>

    <tr>
        <td class="Bold-Text">Description</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Description max(30) word" id="Desc" name="Desc"/></td>
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

<table class="Content"><tr><td></td></tr><tr><td><div id="Facilitylist"></div></td></tr></table>
    </body></html>
