<%-- 
    Document   : newpaymenttype
    Created on : Oct 16, 2013, 12:17:22 AM
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
        var Payment=document.getElementById("Payment").value;
        var Rent=document.getElementById("Rent").value;
        //var Beds=document.getElementById("Beds").value;
    //     var Beds=document.getElementById("Beds").value;
        //var Payment=document.getElementById("Payment").value;
        //var id=document.getElementById("id").value;
        var flag=0;
        if(Payment=="" )
        {
            document.getElementById("Payment").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Payment").className ='TextSuccess';
            }
        if(Rent=="" )
        {
            document.getElementById("Rent").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Rent").className ='TextSuccess';
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
     var Payment=document.getElementById("Payment").value;
     var Rent=document.getElementById("Rent").value;
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
    LoadPaymentType();
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","REGISTERPAYMENT.jsp?Payment="+Payment+"&Rent="+Rent,true);
    xmlhttp.send();
    //LoadPayment();
}

function LoadPaymentType()
{
    // var Payment=document.getElementById("Payment").value;
     document.getElementById("PaymentList").innerHTML='<br><br>Please wait, loading Payment type for this hostel';
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
    document.getElementById("PaymentList").innerHTML=xmlhttp.responseText;
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","LISTPAYMENT.jsp",true);
    xmlhttp.send();

}

</script>
    </head>
    <body class="room" onload="LoadPaymentType()">
        <!--form action="REGISTERROOM.jsp"-->

<table>
     <tr>
         <td>
             <table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>New payment type</h1></td></tr></table>
         </td>
    </tr>

    <tr>
        <td  class="Bold-Text"><br><br></td>
    </tr>

    <tr>
        <td  class="Bold-Text"></td>
    </tr>


    <tr>
        <td class="Bold-Text">Payment name</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Payment name" id="Payment" name="Payment"/></td>
    </tr>
     <tr>


         <tr>
        <td class="Bold-Text">Rent</td>
    </tr>
    <tr>
        <td><input type="text" placeholder="Enter rent" id="Rent" name="Rent"/></td>
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

<table class="Content"><tr><td></td></tr><tr><td><div id="PaymentList"></div></td></tr></table>
    </body></html>
