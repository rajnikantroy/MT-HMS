<%-- 
    Document   : Hostel
    Created on : Oct 3, 2013, 6:19:41 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>

<!-- Jquery -->
<script src="Scripts/jquery.min.js">
</script>
<script>
$(document).ready(function(){
    $("#SubMenu1").slideUp("slow");
    $("#SubMenu2").slideDown("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideUp("slow");
    $("#SubMenu5").slideUp("slow");
    $("#SubMenu6").slideUp("slow");
    $("#SubMenu7").slideUp("slow");




  $("#Menu1").click(function(){
    $("#SubMenu1").slideDown("slow");
     $("#SubMenu2").slideUp("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideUp("slow");
    $("#SubMenu5").slideUp("slow");
    $("#SubMenu6").slideUp("slow");
    $("#SubMenu7").slideUp("slow");
  });

 $("#Menu2").click(function(){
 $("#SubMenu1").slideUp("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideUp("slow");
     $("#SubMenu5").slideUp("slow");
$("#SubMenu2").slideDown("slow");
     $("#SubMenu6").slideUp("slow");
     $("#SubMenu7").slideUp("slow");
  });

 $("#Menu3").click(function(){
    $("#SubMenu1").slideUp("slow");
     $("#SubMenu2").slideUp("slow");
    $("#SubMenu3").slideDown("slow");
    $("#SubMenu4").slideUp("slow");
    $("#SubMenu5").slideUp("slow");
    $("#SubMenu6").slideUp("slow");
    $("#SubMenu7").slideUp("slow");
  });

   $("#Menu4").click(function(){
    $("#SubMenu1").slideUp("slow");
     $("#SubMenu2").slideUp("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideDown("slow");
    $("#SubMenu5").slideUp("slow");
    $("#SubMenu6").slideUp("slow");
    $("#SubMenu7").slideUp("slow");
  });



   $("#Menu5").click(function(){
    $("#SubMenu1").slideUp("slow");
     $("#SubMenu2").slideUp("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideUp("slow");
    $("#SubMenu5").slideDown("slow");
    $("#SubMenu6").slideUp("slow");
    $("#SubMenu7").slideUp("slow");
  });



$("#Menu6").click(function(){
    $("#SubMenu1").slideUp("slow");
     $("#SubMenu2").slideUp("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideUp("slow");
    $("#SubMenu5").slideUp("slow");
    $("#SubMenu6").slideDown("slow");
    $("#SubMenu7").slideUp("slow");
  });



$("#Menu7").click(function(){
    $("#SubMenu1").slideUp("slow");
     $("#SubMenu2").slideUp("slow");
    $("#SubMenu3").slideUp("slow");
    $("#SubMenu4").slideUp("slow");
    $("#SubMenu5").slideUp("slow");
    $("#SubMenu6").slideUp("slow");
    $("#SubMenu7").slideDown("slow");
  });




});
</script>
<script language="javascript">

    function Redirect(url)
    {
        document.getElementById("Content").src=url;
    }


    function Browse(SearchContent)
    {
       // alert(SearchContent);
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
    document.getElementById("Content").innerHTML=xmlhttp.responseText;

    }
  }
 xmlhttp.open("GET","rooms.jsp?Type="+SearchContent,true);
    xmlhttp.send();

    }

</script>



<script src="box/shadowbox.js" type="text/javascript"></script>
    <link href="box/shadowbox.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        Shadowbox.init();
    </script>




  <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hostel management system | HMS | Setup your hostel from home</title>
</head>
<body onload="Browse('Summary')">
<%! String hostelName; %>
<%

try
        {
//String s=(String)request.getSession().getAttribute("Username");

            String Upage=(String)request.getSession().getAttribute("Page");
if(!Upage.isEmpty())
    {

    //out.println(Upage);
}
}
catch(NullPointerException ex)
        {
    response.sendRedirect("signin.jsp");
    //out.println("error is : "+ex);
}






try
{
    String hostelID=request.getParameter("HostelID");
    hostelName=request.getParameter("HostelName");
    if(!hostelID.isEmpty())
        {
        session.setAttribute("HostelID", hostelID);
        session.setAttribute("HostelName", hostelName);
    }
}
catch(NullPointerException ex){
    response.sendRedirect("Dashboard.jsp");
        //{response.sendRedirect("Dashboard.jsp");
}

%>

<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1>HMS</h1></td>
<td class="Heading-SignUp"><a href="signout.jsp">Sign out</a></td>
<td class="TableMargin"></td>
</tr>
</table>


<!--table width="100%" style="background-color:#e2e2e2">
<tr>
<td width="5%"></td>
<td width="90%" height="50px">

<table width="100%"><tr><td width="50%" align="left"><h1>HMS</h1></td><td  width="50%"  align="right"><a href="Signin.jsp">Sign out</a></td></tr></table>

</td>
<td width="5%"></td>
</tr>
</table-->


<table width="100%"  style="border-bottom:1px solid #e2e2e2;border-top:1px solid #e2e2e2">
<tr>
<td width="5%"></td>
<td width="90%" height="30px">

    <table width="100%"><tr><td width="50%" align="left"><h3><a title="Go back to your hostel page" href="Dashboard.jsp">Dashboard</a> for <%=hostelName%></h3></td><td  width="50%"  align="right"><a href="">Help</a></td></tr></table>

</td>
<td width="5%"></td>
</tr>
</table>





<table width="100%">
<tr>
<td width="5%"></td>
<td width="20%" valign="top">
    <!--div id="HostelMenu"-->
<table id="HostelMenu">
    <!--
    <tr><td><a class="a" href="newfloor.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Add new floor</a></td></tr>
     <tr><td><a class="a" href="newrooms.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Add new room</a></td></tr>
       <tr><td><a class="a" href="newbeds.jsp" rel='shadowbox;width=600;height=500' class="thickbox" >Add new Beds</a></td></tr>
<tr><td><a class="a"  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox" >Add new tenant</a></td></tr>
-->






      <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu2">Assemble hostel</div>
            <div  class="SubMenu"  id="SubMenu2">
                <div><a href="newfloor.jsp" rel='shadowbox;width=600;height=500' class="thickbox">New floors</a></div>
                <div><a href="newrooms.jsp" rel='shadowbox;width=600;height=500' class="thickbox">New room</a></div>
                <div><a href="newbeds.jsp" rel='shadowbox;width=600;height=500' class="thickbox" >New Beds</a></div>
            </div>
        </td></tr>







     <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div class="Menu, a" id="Menu1">Details</div>
            <div class="SubMenu" id="SubMenu1">
                <div onclick="Browse('AllRooms')">All rooms</div>
                <div onclick="Browse('AllBeds')">All beds</div>
                <div onclick="Browse('Blank')">Blank beds</div>
                <div onclick="Browse('Full')">Full beds</div>
            </div>
        </td></tr>


   <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu3">Tenant</div>
            <div  class="SubMenu"  id="SubMenu3">
                <div><a  href="profile.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Verify tenants</a></div>
                
                <div><a  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox" >New tenant</a></div>
                <div><a  href="registration.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox">Registration</a></div>
                <div><a href="assignbillitem.jsp" rel='shadowbox;width=600;height=500' class="thickbox" >Assign bill</a></div>
                <div><a  href="securitycharges.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox">Security charges</a></div>
                
            </div>
        </td></tr>






     <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu6">Payment</div>
            <div  class="SubMenu"  id="SubMenu6">
                <div><a title="Add/create payment type" href="newpaymenttype.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Add bill items</a></div>
                <div><a  href="payrent.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox">Payment</a></div>
                <div><a href="checkpayment.jsp" rel='shadowbox;width=800;height=600' class="thickbox">Check payment</a></div>
                <div><a href="paymentreport.jsp" rel='shadowbox;width=600;height=500' class="thickbox" >Report</a></div>
            </div>
        </td></tr>




      <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu7">Message</div>
            <div  class="SubMenu"  id="SubMenu7">
                <div><a href="newfloor.jsp" rel='shadowbox;width=600;height=500' class="thickbox">To tenant</a></div>
                <div><a href="newrooms.jsp" rel='shadowbox;width=600;height=500' class="thickbox">To room</a></div>
                <div><a href="newbeds.jsp" rel='shadowbox;width=600;height=500' class="thickbox" >To floor</a></div>
                <div><a  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox">To hostel</a></div>
                <div><a  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox">To employee</a></div>
            </div>
        </td></tr>









    

 <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu4">Blog</div>
            <div  class="SubMenu"  id="SubMenu4">
                     <div><a  href="newfacility.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox" >Facility</a></div>

                <div><a href="HostelContact.jsp" rel='shadowbox;width=700;height=600' class="thickbox">Contact info</a></div>
                <div><a href="newrooms.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Pages</a></div>
            </div>
        </td></tr>


 <tr><td>

          <div class="Menu, a" id="Feedback"><a href="newfloor.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Feedback</a></div>

     </td></tr>

 <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu5">Help</div>
            <div  class="SubMenu"  id="SubMenu5">
                <div><a href="newfloor.jsp" rel='shadowbox;width=600;height=500' class="thickbox">New details</a></div>
                <div><a href="newrooms.jsp" rel='shadowbox;width=600;height=500' class="thickbox">View details</a></div>
                 <div><a  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox" >Employee</a></div>
                  <div><a  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox" >Message</a></div>
                <div><a href="newbeds.jsp" rel='shadowbox;width=600;height=500' class="thickbox" >Settings</a></div>
                <div><a  href="newtenant.jsp" rel='shadowbox;width=1000%;height=900%' class="thickbox" >Blog</a></div>
            </div>
        </td></tr>





<!--
<tr><td><a  >Tenants details</a></td></tr>
<tr><td><a  >Rent settings</a></td></tr>
<tr><td><a  >Pay rent</a></td></tr>
<tr><td><a >Hostel contact</a></td></tr>
<tr><td><a >Pages</a></td></tr>
<tr><td><a >Themes</a></td></tr>
<tr><td><a >Layout</a></td></tr>

-->
</table>
        <!--/div-->
</td>
<td width="70%" valign="top">

    <div id="Content" class="Content">
        <!--It will load dynamically-->
    </div>

    <!--iframe width="100%" src="newroom.jsp" height="100%" name="Content" id="Content">
        
        

    </iframe-->

</td>
<td width="5%"></td>
</tr>
</table>


<table class="HostelManagementFooter">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"></td>
<td class="Heading-SignUp"></td>
<td class="TableMargin"></td>
</tr>
</table>

</body>

</html>
