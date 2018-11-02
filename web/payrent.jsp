<%-- 
    Document   : payrent
    Created on : Oct 23, 2013, 12:27:21 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>

          <link rel="stylesheet" href="jquery-ui.css" />
  <script src="jquery-1.9.1.js"></script>
  <script src="jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css" />
  <script>
  $(function() {
    $( "#from" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 3,
      onClose: function( selectedDate ) {
        $( "#to" ).datepicker( "option", "minDate", selectedDate );
      }
    });
    $( "#to" ).datepicker({
      defaultDate: "+1w",
      changeMonth: true,
      numberOfMonths: 3,
      onClose: function( selectedDate ) {
        $( "#from" ).datepicker( "option", "maxDate", selectedDate );
      }
    });
  });
  </script>




        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>        
 <script language="javascript">

function ValidateTraffic1()
{
    //alert(document.getElementById("TenantEmail").value);
    //validate();
    var status=validate();
    //alert(status);
    //alert(document.getElementById("total").value);
    if(status==1){Insert();}
    else if(status==0){document.getElalertementById("Massage").value="Something is missing...";}

}
function validate()
{
    var total=parseInt(document.getElementById("total").value);
    var paid=parseInt(document.getElementById("paid").value);
    var discount=parseInt(document.getElementById("discount").value);
    var from=document.getElementById("from").value;
    var to=document.getElementById("to").value;
    var fromDD = new Date(from);
    var toDD = new Date(to);
       

    //alert(total+", paid : "+paid+", discount : "+discount+", from : "+from+", to : "+to);
    var flag=0;
    if(total>0)
        {
            //alert("In if : "+total);
             flag++;
                //document.getElementById("total").className='TextSuccess';
            
        }
        else
            {
                flag=0;
                //alert("In else : "+total);
               //document.getElementById("total").innerHTML='Invalid amount';
            }

     if(paid=="")
        {
            flag=0;
            document.getElementById("paid").className='TextError';
        }
        else if(paid>=total)
            {
                flag=0;
                document.getElementById("paidMSG").innerHTML='Amount should be less then total amount';
                document.getElementById("paid").className='TextError';
            }

        else
            {

                flag++;
                document.getElementById("paid").className='TextSuccess';
                document.getElementById("paidMSG").innerHTML='';
            }


     if(discount=="")
        {
            flag=0;
            document.getElementById("discount").className='TextError';
        }
          else if(discount>=total)
            {
                flag=0;
                document.getElementById("discountMSG").innerHTML='Amount should be less then total amount';
                document.getElementById("discount").className='TextError';
            }

        else
            {
                flag++;
                document.getElementById("discount").className='TextSuccess';
                document.getElementById("discountMSG").innerHTML='';
            }


     if(from=="")
        {
            flag=0;
            document.getElementById("from").className='TextError';
        }
        else
            {
                flag++;
                document.getElementById("from").className='TextSuccess';
            }


     if(to=="")
        {
            flag=0;
            document.getElementById("to").className='TextError';
        }
        else if(toDD<fromDD)
            {
                flag=0;
                 document.getElementById("dateMSG").innerHTML='<b>Invalid date selection</b>';
                 document.getElementById("to").className='TextError';
                 document.getElementById("from").className='TextError';
            }
        else
            {
                flag++;
                document.getElementById("to").className='TextSuccess';
            }

    if(flag==5){return 1;}
            //alert("in if : "+flag);return 1;}
        else{return 0;}
            //alert("In else : "+flag);

        }



function Insert()
    {
    //alert("insert");
    var total=parseInt(document.getElementById("total").value);
    var paid=document.getElementById("paid").value;
    var discount=document.getElementById("discount").value;
    var from=document.getElementById("from").value;
    var to=document.getElementById("to").value;
    var TenantEmail=document.getElementById("TenantEmail1").value;
    

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
   //alert(total+", paid : "+paid+", discount : "+discount+", from : "+from+", to : "+to+", Email="+TenantEmail);
    document.getElementById("Message").innerHTML=xmlhttp.responseText;
 }
  }
  var v="RENTSUBMISSION.jsp?total="+total+"&paid="+paid+"&discount="+discount+"&from="+from+"&to="+to+"&TenantEmail="+TenantEmail;
    xmlhttp.open("GET",v,true);
    xmlhttp.send();
    //alert(v);
}



function ValidateEmail()
{
    var email=document.getElementById("TenantEmail").value;
    if(email=="")
        {
            //alert("ten error");
            document.getElementById("Message").innerHTML='Invalid email';
            document.getElementById("TenantEmail").style='TextError';
            return false;
        }
        else if(email!="")
            {
                document.getElementById("Message").innerHTML='valid email';
                document.getElementById("TenantEmail").style='TextSuccess';
                //document.getElementById("Message").innerHTML='success';
                return true;
            }

}

function ValidateTraffic()
{
    if(ValidateEmail() && RegisterFacilityForTenant())
        {
            document.getElementById("Message").innerHTML='success';
            return true;
        }
        else
            {
                document.getElementById("Message").innerHTML='error';
                return false;
            }
}
</script>
<link href="Styles\Style.css" rel="stylesheet" type="text/css" />

    </head>
    <body style="margin: 5%">


        <table width="100%"><tr><form action="payrent.jsp"><td><input type='email' name='TenantEmail' id='TenantEmail' placeholder='Enter tenant email'/></td><td><input type='submit' value='OK'/> </td></form></tr></table>
    <table>
        <tr><td>From(yyyy-mm-dd)</td><td>To(yyyy-mm-dd)</td><td></td></tr>
        <tr><td><input type="date" id="from" name="from" placeholder="yyyy-mm-dd"  /></td><td><input type="date" id="to" name="to" placeholder="yyyy-mm-dd" /></td><td><p id="dateMSG"></p></td></tr>
        
    </table>
  
<table width="100%" class="Titlebar">
    <tr><td><h1> <%= session.getAttribute("HostelName")%></h1></td></tr>
       
    </table>


<%! Connection con;String HID;int total, flag=0, month;String TenantEmail; %>
           <%
total=0; month=1;
           TenantEmail=request.getParameter("TenantEmail");
           HID=(String)request.getSession().getAttribute("HostelID");
           //String roomid=request.getParameter("Rooms");
           try{if(!TenantEmail.isEmpty()){flag=1; String HName=request.getSession().getAttribute("HostelName").toString();}}catch(NullPointerException ex){out.println("<font color='#D5402C'>Enter email of tenant</font>");}

           if(flag==1)
               {
           try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select p.paymentname, p.rent from paymenttype p JOIN tenantfacility tf on tf.FacilityID=p.ID JOIN hostel h on h.ID=p.HostelID JOIN users u on u.ID=tf.tenantID where h.ID="+HID+" and u.Email='"+TenantEmail+"' ORDER BY p.Rent DESC";
ResultSet rs=s.executeQuery(query);
out.println("<table class='Billing'><tr><th width='68%' align='left'>Name</th><th width='10%'>Month</th><th width='2%'></th><th width='10%' align='right'>Rent</th><th width='20%'  align='right'>Total</th></tr><tr><td style='border-bottom:1px solid #e2e2e2' colspan='5'></td></tr>");
int flag=0;
//out.println("<tr><td>Facility</td><td>Description</td></tr>");
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td>"+rs.getString(1)+"</td><td align='center'>"+month+"</td><td>X</td><td align='right'>"+rs.getInt(2)+"</td><td align='right'>"+month*rs.getInt(2)+"</td></tr>");
    total+=rs.getInt(2);
}
 //out.println("<tr><td  align='left'>Total</td><td></td><td></td><td align='right'></td><td align='right'>"+month*total+"</td></tr></table>");
out.println("</table>");
 if(flag==0)
    {out.println("<font color='#D5402C'>Enter email of tenant</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
 }
          
%>


<p id="Message"></p>


<table width="100%">
    <tr><td width="68%"><input type="hidden" id="TenantEmail1" value="<%=TenantEmail%>"/></td>
        <td width="32%">
<table width="100%" cellspacing="10" style="font-weight: bold">
    <tr><td>Total</td><td align="right"><font color="#D5402C"><input type="hidden" id="total" name="total" value="<%=month*total%>"><%=month*total %></font></td></tr>
    <tr><td>Paid</td><td><input type="number" placeholder="Enter amount"  id="paid"/><br><p id="paidMSG"></p></td></tr>
    <tr><td>Discount</td><td ><input type="number" placeholder="Discount in INR"  id="discount"/><br><p id="discountMSG"></p></td></tr>
    <tr><td></td><td ><input type="submit" onclick="ValidateTraffic1()"/></td></tr>
</table>
            
        </td>
    </tr>

</table>






    </body>
</html>
