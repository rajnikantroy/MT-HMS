
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<!-- Jquery -->

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


function DynamicValidation(n)
{
    var v=n.id;
    //var reg="^[a-zA-Z]";
    var g=document.getElementById(v).value;
    //alert(g);
    if(!g.match(";"))
        {
            //successful
            v.cssClass='Text-Success';
            count++;
        }
        else
        {v.cssClass='Text-Error';v.focus();}
}

function ValidateTraffic()
{
    //var state=0;
    //alert("in traffic");
      var  state=Validate();
   // alert(" out of if : "+state);
    if(state==1)
    {
       // alert("going to insert");
        //alert(" in of if : "+state);
        Insert();
    }


}

function Validate()
{
	var fname=document.getElementById("FName").value;
        var lname=document.getElementById("LName").value;
        var uname=document.getElementById("UName").value;
        var email=document.getElementById("Email").value;
        var REmail=document.getElementById("ReEmail").value;
        var pass=document.getElementById("Password").value;
        var CPass=document.getElementById("RePassword").value;
        var question=document.getElementById("Question").value;
        var answer=document.getElementById("Answer").value;
        var DOB=document.getElementById("DOB").value;
        var flag=0;
        if(fname=="")
        {
            //document.getElementById("FNameMSG").innerHTML="First name can`t be left blank";
            document.getElementById('FName').className = 'TextError';
            //Validate(false);
            //return false;
            flag=0;
        }
        else
            {flag+=1;
               // document.getElementById("FNameMSG").innerHTML="";
            //document.getElementById('FName').className ='';
            document.getElementById('FName').className = 'TextSuccess';
            //return false;
            }
        if(lname=="")
        {
            flag=0;
            //document.getElementById("LNameMSG").innerHTML="Last name can`t be left blank";
            document.getElementById('LName').className = 'TextError';
            //return false;
        }
        else
            {
                flag+=1;

              //  document.getElementById("LNameMSG").innerHTML="";
            //document.getElementById('LName').className = 'TextSuccess';
            document.getElementById('LName').className = 'TextSuccess';
            //return false;

            }
        if(uname=="")
        {
            flag=0;
            //document.getElementById("UNameMSG").innerHTML="Username can`t be left blank";
            document.getElementById('UName').className = 'TextError';
            //return false;
        }
        else {
            flag+=1;
            //document.getElementById("UNameMSG").innerHTML="";
            document.getElementById('UName').className = 'TextSuccess';
            //return false;
        }
        if(email=="")
        {
            flag=0;
            //document.getElementById("EmailMSG").innerHTML="Email can`t be left blank";
            document.getElementById('Email').className = 'TextError';
            //return false;
        }

        else {
            flag+=1;
            //document.getElementById("EmailMSG").innerHTML="";
            document.getElementById('Email').className = 'TextSuccess';
            //return false;
        }
        if(REmail=="")
        {
            flag=0;
            //document.getElementById("ReEmailMSG").innerHTML="Email can`t be left blank";
            document.getElementById('ReEmail').className = 'TextError';
            //return false;
        }
        else if(email!=REmail)
            {

            flag=0;
            document.getElementById("ReEmailMSG").innerHTML="Email doesnt match.";
            document.getElementById('ReEmail').className = 'TextError';
            }
        else {
            flag+=1;
            document.getElementById("ReEmailMSG").innerHTML="";
            //document.getElementById("ReEmailMSG").innerHTML="";
            document.getElementById('ReEmail').className = 'TextSuccess';
            //return false;
        }
        if(pass=="")
        {
            flag=0;
            //document.getElementById("Password").innerHTML="Password can`t be left blank";
            document.getElementById('Password').className = 'TextError';
            //return false;
        }
        else {
            flag+=1;
             //document.getElementById("Password").innerHTML="";
            document.getElementById('Password').className = 'TextSuccess';
            //return false;
        }
        if(CPass=="")
        {
            flag=0;
            //document.getElementById("RePassword").innerHTML="Password can`t be left blank";
            document.getElementById('RePassword').className = 'TextError';
            //return false;
        }
        else if(pass!=CPass)
            {
                 flag=0;
            document.getElementById("RePasswordMSG").innerHTML="Password doesnt match.";
            document.getElementById('RePassword').className = 'TextError';

            }
        else {
            flag+=1;
            //document.getElementById("RePassword").innerHTML="";
             document.getElementById("RePassword").innerHTML="";

            document.getElementById('RePassword').className = 'TextSuccess';
            //return false;
        }
        if(question==0)
        {
            flag=0;
            //document.getElementById("QuestionMSG").innerHTML="Question can`t be left blank";
            document.getElementById('Question').className = 'TextError';
            //return false;
        }
        else {//document.getElementById("QuestionMSG").innerHTML="";
            flag+=1;
            document.getElementById('Question').className = 'TextSuccess';
            //return false;

        }
        if(answer=="")
        {
            flag=0;
            //document.getElementById("AnswerMSG").innerHTML="Answer can`t be left blank";

            document.getElementById('Answer').className = 'TextError';
            //return false;
        }
        else {//document.getElementById("AnswerMSG").innerHTML="";
            flag+=1;
            document.getElementById('Answer').className = 'TextSuccess';
            //return false;

        }

        if(DOB=="")
        {
            flag=0;
            //document.getElementById("DOBMSG").innerHTML="Date of birth can`t be left blank";
            document.getElementById('DOB').className = 'TextError';
            //return false;
        }
        else {//document.getElementById("DOBMSG").innerHTML="";
            flag+=1;
            document.getElementById('DOB').className = 'TextSuccess';
            //return false;



        }
        alert(flag);
    if(flag==10)
        {return 1;}
        else
        {
            document.getElementById("Message").innerHTML="Something is missing...";
            return 0;
        }

}


function Insert()
{
        var fname=document.getElementById("FName").value;
        var lname=document.getElementById("LName").value;
        var uname=document.getElementById("UName").value;
        var email=document.getElementById("Email").value;
        var pass=document.getElementById("Password").value;
        var question=document.getElementById("Question").value;
        var answer=document.getElementById("Answer").value;
        var DOB=document.getElementById("DOB").value;
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
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  xmlhttp.open("GET","Signup?FName="+fname+"&LName="+lname+"&UName="+uname+"&Email="+email+"&Password="+pass+"&Question="+question+"&Answer="+answer+"&DOB="+DOB,true);
xmlhttp.send();

}
</script>






  <link href="Styles\Style.css" rel="stylesheet" type="text/css" />

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hostel management system | HMS | Setup your hostel free</title>
</head>
<body>

<!-- Heading -->
<table class="Heading">
<tr>
<td class="TableMargin"></td>
<td class="Heading-Title"><h1>HMS</h1></td>
<td class="Heading-SignUp">Already have an account? <a href="signin.jsp">SIGN IN</a></td>
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


    <!--form onsubmit="" method="post"-->
<table class="LoginInner">
<tr><td><h3>Signup</h3></td></tr>
<tr><td><h3>It's free and always will be.</h3></td></tr>
<tr><td class="Bold-Text">First name</td> </tr>
<tr><td><input type="text" placeholder="First name" id="FName" onblur="DynamicValidation(this)" name="FName"/></td> </tr>
<tr><td><p id="FNameMSG"></p></td></tr>

<tr><td class="Bold-Text">Last name</td></tr>
<tr> <td><input type="text" name="LName" id="LName"  placeholder="Last name" /></td></tr>
<tr><td><p id="LNameMSG"></p></td></tr>

<tr><td class="Bold-Text">Username</td></tr>
<tr> <td><input type="text" name="UName" id="UName"  placeholder="Username" /></td></tr>
<tr><td><p id="UNameMSG"></p></td></tr>

<tr><td class="Bold-Text">Email</td></tr>
<tr> <td><input type="email" name="Email" id="Email"  placeholder="Email address" /></td></tr>
<tr><td><p id="EmailMSG"></p></td></tr>

<tr><td class="Bold-Text">Re-enter email</td></tr>
<tr> <td><input type="email" name="ReEmail" id="ReEmail"  placeholder="Re-enter email" /></td></tr>
<tr><td><p id="ReEmailMSG"></p></td></tr>

<tr><td class="Bold-Text">Password</td></tr>
<tr> <td><input type="password" name="Password" id="Password"  placeholder="Password" /></td></tr>
<tr><td><p id="PasswordMSG"></p></td></tr>

<tr><td class="Bold-Text">Confirm Password</td></tr>
<tr> <td><input type="password" name="RePassword" id="RePassword"  placeholder="Confirm Password" /></td></tr>
<tr><td><p id="RePasswordMSG"></p></td></tr>

<tr><td class="Bold-Text">Question</td></tr>
<tr> <td>
<select name="Question" id="Question" >
  <option value="0">Select one:</option>
  <option value="1">What is your favorite movie?</option>
  <option value="2">What is your pet name?</option>
  <option value="3">What is your mother name?</option>
  <option value="4">What is your favorite movie star?</option>
  <option value="5">Which is your favorite website?</option>
</select>

</td></tr>
<tr><td><p id="QuestionMSG"></p></td></tr>

<tr><td class="Bold-Text">Answer</td></tr>
<tr> <td><input type="text" name="Answer" id="Answer"  placeholder="Answer" /></td></tr>
<tr><td><p id="AnswerMSG"></p></td></tr>

<tr><td class="Bold-Text">DOB</td></tr>
<tr> <td><input type="date" name="DOB" id="DOB"  placeholder="Answer" /></td></tr>
<tr><td><p id="DOBMSG"></p></td></tr>

<tr><td><p id="Message"></p></td></tr>

<tr><td><input type="submit" onclick="ValidateTraffic()" value="Signup" /></td></tr>


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
<td class="FooterMenu">? 2013 HMS</td>
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