<%-- 
    Document   : tenanthostel
    Created on : Oct 29, 2013, 11:46:34 AM
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
    $("#SubMenu1").slideDown("slow");
    $("#SubMenu2").slideUp("slow");


  $("#Menu1").click(function(){
    $("#SubMenu1").slideDown("slow");
     $("#SubMenu2").slideUp("slow");
  });



 $("#Menu2").click(function(){
    $("#SubMenu1").slideUp("slow");
     $("#SubMenu2").slideDown("slow");
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
 xmlhttp.open("GET","reportfortenant.jsp?Type="+SearchContent,true);
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
<body onload="Browse('Beds')">
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
            <div class="Menu, a" id="Menu1">Reports</div>
            <div class="SubMenu" id="SubMenu1">
                <div onclick="Browse('Beds')">Bed</div>
                 <div onclick="Browse('Payments')">Payment</div>
            </div>
        </td></tr>











 <tr><td>

          <div class="Menu, a" id="Feedback"><a href="newfloor.jsp" rel='shadowbox;width=600;height=500' class="thickbox">Feedback</a></div>

     </td></tr>

 <tr><td >
            <!--a id="Menu">Rooms details</a-->
            <div  class="Menu, a"  id="Menu2">Help</div>
            <div  class="SubMenu"  id="SubMenu2">
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

<br><br><br><br><br><br><br><br><br>
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