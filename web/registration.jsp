<%-- 
    Document   : Rent
    Created on : Oct 22, 2013, 6:19:40 PM
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
        var Rent=document.getElementById("Rent").value;
        //var Rent=document.getElementById("Rent").value;
        var TenantEmail=document.getElementById("TenantEmail").value;
        //var Beds=document.getElementById("Beds").value;
        //var Beds=document.getElementById("Beds").value;
        //var Rent=document.getElementById("Rent").value;
        //var id=document.getElementById("id").value;
        var flag=0;
        if(Rent=="" )
        {
            document.getElementById("Rent").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Rent").className ='TextSuccess';
            }



         if(TenantEmail=="" )
        {
            document.getElementById("TenantEmail").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("TenantEmail").className ='TextSuccess';
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
    alert("hi");
    //alert("on insert");
     var Rent=document.getElementById("Rent").value;
     var TenantEmail=document.getElementById("TenantEmail").value;
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
    LoadRentType();
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","TENANTREGISTRATION.jsp?Rent="+Rent+"&TenantEmail="+TenantEmail,true);
    xmlhttp.send();
    //LoadRent();
}


</script>
<title>Tenant registration</title>
    </head>
    <body class="room">
        <!--form action="REGISTERROOM.jsp"-->

<table>
     <tr>
         <td>
             <table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>New Rent type</h1></td></tr></table>
         </td>
    </tr>

    <tr>
        <td  class="Bold-Text"><br><br></td>
    </tr>

    <tr>
        <td  class="Bold-Text"></td>
    </tr>



    <tr>
        <td class="Bold-Text">Tenant email</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Tenant email" id="TenantEmail" name="TenantEmail"/></td>
    </tr>
     <tr>


    <tr>
        <td class="Bold-Text">Registration fee</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Rent name" id="Rent" name="Rent"/></td>
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

   </body></html>
