<%-- 
    Document   : signin
    Created on : Oct 6, 2013, 8:18:35 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>

<script src="Scripts/jquery.min.js">
</script>
<script language="javascript">
$(document).ready(function(){
		$("#UpperMenu").fadeIn();
	 	$("#Menu1").fadeIn("slow");
	    $("#Menu2").fadeIn(1000);
	    $("#Menu3").fadeIn(1100);
	    $("#Menu4").fadeIn(1200);
	    $("#Menu5").fadeIn(1300);
	    $("#Menu6").fadeIn(1400);
	    $("#Menu7").fadeIn(1500);
	    $("#Menu8").fadeIn(2000);
	    $("#Menu9").fadeIn(2500);
	    $("#Menu10").fadeIn(3000);
	    $("#Menu11").fadeIn(3500);
	    $("#Menu12").fadeIn(3600);
	    $("#LowerMenu").fadeIn(3600);
	    $("#LowerMenu1").fadeIn(3700);
	  });
</script>


<script type="text/javascript">


function ValidateTraffic()
{
    //var state=0;
      var  state=Validate();
    //alert(" out of if : "+state);
    if(state==1)
    {

        var email=document.getElementById("Email").value;
        var pass=document.getElementById("Pass").value;
       // alert(" in of if : "+state);
        //Login()

    document.location.href="UserVerification.jsp?Email="+email+"&Pass="+pass;

    }
}



function Validate()
{
        var email=document.getElementById("Email").value;
        var pass=document.getElementById("Pass").value;
        var flag=0;
         var email=document.getElementById("Email").value;
        //var flag=0;
        var expemail="^[a-z]{1}[a-z0-9._]{1,30}@[a-z]{2,8}.(com)";
         var em=new RegExp(expemail);
         var dot=email.indexOf(".");
         var und=email.indexOf("_");


        if(!em.test(email))
            {flag=0;
                document.getElementById('Email').className ='TextError';
                document.getElementById('EmailMSG').innerHTML ='Invalid email';
                document.getElementById('Email').focus();
            }
        else if(email.charAt(dot+1)=="."||email.charAt(und+1)=="_")
            {   flag=0;
               document.getElementById('Email').className ='TextError';
                document.getElementById('EmailMSG').innerHTML ='Invalid email';
                document.getElementById('Email').focus();
            }

         else
             {
                 flag+=1;
                document.getElementById('Email').className = 'TextSuccess';
                document.getElementById('EmailMSG').innerHTML ='';
             }


        
        if(pass=="" )
        {
            flag=0;
            document.getElementById('Pass').className = 'TextError';
       }
        else
            {
                flag+=1;
                document.getElementById('Pass').className = '';
            }

    if(flag==2)
        {return 1;}
        else
        {
            document.getElementById("Message").innerHTML="";
            return 0;
        }
}


function Login()
{
     var email=document.getElementById("Email").value;
        var pass=document.getElementById("Pass").value;
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
    Redirect(1);
    //var msg=document.getElementById("Message").value;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","Signin.jsp?Email="+email+"&Pass="+pass,true);
    xmlhttp.send();

}


</script>










<!--script language="javascript">

function Validate()
{
	var email=document.getElementById("Email").value;
	var Pass=document.getElementById("Pass").value;
	document.getElementById("EmailMSG").InnerHTML=email+", "+Pass;
	//alert(email+" "+Pass);
	if(email=="" || email==null)
		{
		document.getElementById("EmailMSG").InnerHTML="Enter an email address";
		return false;
		}
	else if(Pass=="" || Pass==null)
		{
		document.getElementById("PassMSG").InnerHTML="Enter Password";
		return false;
		}
	else
		{
		document.getElementById("EmailMSG").InnerHTML="";
		document.getElementById("PassMSG").InnerHTML="";
		}
	}

</script-->

  <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hostel management system | HMS | Setup your hostel from home</title>
</head>
<body>

<%
try
{
//String s=(String)request.getSession().getAttribute("Username");
String Upage=(String)request.getSession().getAttribute("Page");
if(!Upage.isEmpty())
    {
    response.sendRedirect(Upage);
  
    //out.println(Upage);
}
}
catch(NullPointerException ex)
        {
    //out.println("error is : "+ex);
}
%>
    <!--jsp:forward page="Dashboard.jsp" ><!--/jsp:forward-->
<!-- Heading -->
<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1>HMS</h1></td>
<td class="Heading-SignUp">new to HMS? <a href="signup.jsp">CREATE AN ACCOUNT</a></td>
<td class="TableMargin"></td>
</tr>
</table>

<!-- Content -->
<table class="Content">
<tr>
<td class="TableMargin"></td>
<td class="PosterWidth">

<table class="Content">
<tr>
<td class="ContentMenu" colspan="3"><div  class="ContentMenuDesign" id="UpperMenu" ><h2>Manage your hostels from your home.</h2></div></td>
</tr>


<tr>
<td class="ContentMenu"><div  class="ContentMenuDesign" id="Menu1" >Free hosting</div></td>
<td class="ContentMenu"><div  class="ContentMenuDesign1" id="Menu2" >Free sub domain</div></td>
<td class="ContentMenu"><div  class="ContentMenuDesign2" id="Menu3" >Free maintainance</div></td>
</tr>

<tr>
<td class="ContentMenu"><div   class="ContentMenuDesign3"  id="Menu4" >Free upgradation</div></td>
<td class="ContentMenu"><div   class="ContentMenuDesign"  id="Menu5" >Device independent management</div></td>
<td class="ContentMenu"><div   class="ContentMenuDesign1"  id="Menu6" >Free setup charges</div></td>
</tr>


<tr>
<td class="ContentMenu"><div  class="ContentMenuDesign2" id="Menu7" >HRMS facilities</div></td>
<td class="ContentMenu"><div  class="ContentMenuDesign3" id="Menu8" >Manage tenant</div></td>
<td class="ContentMenu"><div  class="ContentMenuDesign" id="Menu9" >create your blog</div></td>
</tr>

<tr>
<td class="ContentMenu"><div   class="ContentMenuDesign1"  id="Menu10" >Free Messaging</div></td>
<td class="ContentMenu"><div   class="ContentMenuDesign2"  id="Menu11" >Free upgradation</div></td>
<td class="ContentMenu"><div   class="ContentMenuDesign3"  id="Menu12" >Free security</div></td>
</tr>

<tr>
<td class="ContentMenu" colspan="3"><div  class="ContentMenuDesign" id="LowerMenu" ><h3>Be secure we have genuine tenants for you.</h3></div></td>
</tr>

<tr>
<td class="ContentMenu" colspan="3"><div  class="ContentMenuDesign" id="LowerMenu1" ><h3>Increase your bussiness from home.</h3></div></td>
</tr>
</table>

    
    <br><br><br><br><br><br><br><br><br><br><br>
</td>
<td class="LoginOuter">
    <!--form method="post" action="UserVerification.jsp"-->
<table class="LoginInner">
<tr><td><h3>Login</h3></td></tr>




<!--input type="hidden" name="ag_id" value=""/-->




<tr><td class="Bold-Text">Email</td> </tr>
<tr><td><input type="email" placeholder="Email address" id="Email" name="Email"/></td> </tr>
<tr><td><p id="EmailMSG"></p></td></tr>
<tr><td class="Bold-Text">Password</td></tr>
<tr> <td><input type="password" name="Pass"  placeholder="Password" id="Pass" /></td></tr>
<tr><td><p id="PassMSG"></p></td></tr>
<tr><td><p id="Message"></p></td></tr>
<tr><td><input type="submit" value="Sign In" onclick="ValidateTraffic()" /></td></tr>
<tr><td><a href="forget.jsp">Can't access your account?</a></td></tr>
</table>
<!--/form-->
</td>

<td class="Table-Margin"></td>
</tr>
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
