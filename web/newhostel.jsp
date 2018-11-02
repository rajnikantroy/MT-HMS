<%-- 
    Document   : newhostel
    Created on : Oct 6, 2013, 4:54:14 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<!--Checking user is signed in or not-->
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
%>



<html>
<head>

<!-- Jquery -->

<script src="Scripts/jquery.min.js">
</script>
<script type="text/javascript">


function ValidateTraffic()
{
    //var state=0;
      var  state=Validate();
    //alert(" out of if : "+state);
    if(state==1)
    {
        //document.location.href="UserVerification.jsp";
       // alert(" in of if : "+state);
        Insert();
    }
}

function Validate()
{
        var HName=document.getElementById("Name").value;
        var UName=document.getElementById("UName").value;
        var Gender=document.getElementById("Gender").value;
        var flag=0;
        if(HName=="" )
        {
            document.getElementById("Name").className = 'TextError';
            flag=0;
        }
        else
            {flag+=1;
            document.getElementById("Name").className ='';
            }
        if(UName=="" )
        {
            flag=0;
            document.getElementById("UName").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("UName").className = '';
            }
        if(Gender=="" )
        {
            flag=0;
            document.getElementById("Gender").className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById("Gender").className = '';
            }

        if(flag==3)
        {return 1;}
        else
        {
            document.getElementById("Message").innerHTML="";
            return 0;
        }
}


function Insert()
{
     var Name=document.getElementById("Name").value;
        var UName=document.getElementById("UName").value;
        var Gender=document.getElementById("Gender").value;
        document.getElementById("Message").innerHTML="Plase wait...";
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
  xmlhttp.open("GET","REGISTERHOSTEL.jsp?Name="+Name+"&UName="+UName+"&Gender="+Gender,true);
    xmlhttp.send();
}
</script>

  <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create a new hostel | HMS | Setup your hostel from home</title>
</head>
<body>

 



<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1>HMS</h1></td>
<td class="Heading-SignUp"><a href="signin.html">Sign out</a></td>
<td class="TableMargin"></td>
</tr>
</table>

<!-- Content -->
<table class="Content" style="padding-left: 30%;padding-right: 30%">
    <tr><td class="TableMargin"></td>

        <td class="ContentSpace">

            <!--form action="REGISTERHOSTEL.jsp" onsubmit="ValidateTraffic()" method="post" name="HREG"-->
            <table class="Content">

    <tr><td  class="Content" align="center"> <h1>Setup new hostel</h1> </td></tr>
    <tr><td  class="Content">  </td></tr>

    <tr><td class="Bold-Text">Hostel name</td> </tr>
<tr><td><input type="text" placeholder="Hostel name" id="Name" name="Name"/></td> </tr>
<tr><td><p id="NameMSG"></p></td></tr>

    <tr><td class="Bold-Text">Unique name</td> </tr>
<tr><td><input type="text" placeholder="Unique name" id="UName" name="UName"/></td> </tr>
<tr><td>It should be unique name</td></tr>
<tr><td><p id="UNameMSG"></p></td></tr>

<tr><td class="Bold-Text">Type of hostel</td> </tr>
<tr><td>
          <!--its for showing data which is inside Hostel gender-->

    <%
 try
                {
     Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select * from hostelgendertype";
ResultSet rs=s.executeQuery(query);
out.println("<select id='Gender' name='Gender'>");
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
<tr><td><p id="GenderMSG"></p></td></tr>



<tr><td><p id="Message"></p></td></tr>


 <tr><td class="Bold-Text"></td>  </tr>
 <tr><td><input type="submit" value="Setup" onclick="ValidateTraffic()"/></td> </tr>
<tr><td><p id="NameMSG"></p></td></tr>

            </table>


<!--/form-->
        </td>
        <td class="TableMargin"></td></tr>
</table>




<!-- Footer -->
<table class="footer">
<tr>
<td class="Table-Margin"></td>
<td class="FooterMenu">© 2013 HMS</td>
<td class="FooterMenu"><a>Features</a></td>
<td class="FooterMenu"><a>Help Center</a></td>
<td class="FooterMenu"><a>Developers</a></td>
<td class="FooterMenu"><a>Terms of Service</a></td>
<td class="FooterMenu"><a>Privacy</a></td>
<td class="FooterMenu"><a>Content Policy</a></td>
<td class="FooterMenu"><a>About us</a></td>
<td class="Table-Margin"></td>
</tr>
</table>

</body>
</html>
