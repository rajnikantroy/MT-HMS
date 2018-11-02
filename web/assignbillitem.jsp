<%-- 
    Document   : assignbillitem
    Created on : Oct 21, 2013, 9:16:30 PM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>

        <script language="javascript">

function SelectToggle()
{
//var option=Bill.all.value;
//alert("hi");
//alert(document.getElementsByName('Item').length);
          if(document.getElementById("all").checked==true)
        {
            //alert("checked");
            for(var i=0;i<=document.getElementsByName('Item').length;i++)
                {
                    document.getElementsByName("Item")[i].checked=true;
                }
        }
        else if(document.getElementById("all").checked==false)
        {
            //alert("unchecked");
            for(var i=0;i<=document.getElementsByName('Item').length;i++)
                {
                    document.getElementsByName("Item")[i].checked=false;
                }
        }
/*

    if(Bill.all.checked==true)
        {
            for(var i=0;i<=Bill.Item.length;i++)
                {
                    Bill.Item[i].checked=true;
                }
        }
        else if(Bill.all.checked==false)
        {
            for(var i=0;i<=Bill.Item.length;i++)
                {
                    Bill.Item[i].checked=false;
                }
        }*/
}

function RegisterFacilityForTenant()
{
     //alert(document.getElementsByName('Item').length);
     var flag=0;
            for(var i=0;i<=document.getElementsByName('Item').length;i++)
                {
                    if(document.getElementsByName("Item")[i].checked==true)
                        {
                            flag=1;
                            //return true;                            
                           // alert(i);
                            //fac=fac+"&Facility="+document.getElementsByName("Item")[i].value;
                            //alert(fac);
                        }                        
                }
                if(flag==1){return true;}
                    else{return false;}
                //alert("hi");
                
}


function fun()
{
    alert(fac);
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
    document.getElementById("BedDetails").innerHTML=xmlhttp.responseText;
    }
  }
 // FName=&LName=&UName=&Email=&Re-Email=&password=&Con-password=&Answer=&DOB=
  //xmlhttp.open("GET","BEDDETAILS.jsp?BedID="+bedid,true);
    xmlhttp.send();
}

function ValidateEmail()
{
    //alert("ten");

    var email=document.getElementById("TenantEmail").value;
    
    if(email==""||email==null)
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
    <body>

        <table class="Titlebar"><tr><td align="left"><h3><%=session.getAttribute("HostelName")%></h3></td><td><h1>Assign bill item for tenants</h1></td></tr></table>



        <table class="Content"><tr><td align="center"><b>Select which bill should apply on the tenant</b><br></td></tr></table>


<%! Connection con;String HID; %>
           <%
HID=(String)request.getSession().getAttribute("HostelID");
//String roomid=request.getParameter("Rooms");
try
{
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
Statement s=con.createStatement();
String query="select id, PaymentName, Rent from paymenttype where hostelid="+HID+" order by id asc";
ResultSet rs=s.executeQuery(query);
out.println("<form action='REGISTERBILLITEM.jsp' onsubmit='return ValidateTraffic()'> <table  width='100%'><tr><td width='20%' align='left' style='border-bottom:1px dotted #e2e2e2'><input type='checkbox' onclick='SelectToggle()' id='all' name='all'/>Select all</td><td width='50%' style='border-bottom:1px dotted #e2e2e2'>Name</td><td style='border-bottom:1px dotted #e2e2e2' width='30%'>Rent</td></tr>");
int flag=0;
//out.println("<tr><td>Facility</td><td>Description</td></tr>");
while(rs.next())
{
    flag++;
    //out.println("<br>inside while<br>");
    out.println("<tr><td> <input type='checkbox' id='Item' name='Item' value='"+rs.getString(1)+"'></td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td></tr>");
}
 out.println("</table><table class='Content'><tr><td><br><input type='text' name='TenantEmail' id='TenantEmail' placeholder='Enter tenant email'/></td><td><br><input type='submit' value='Assign'/></td></tr></table></form>");
 if(flag==0)
    {out.println("<font color='#D5402C'>There is no bill item created, first create how many type of transaction you do in '"+request.getSession().getAttribute("HostelName")+"' hostel</font>");}

}
catch(SQLException ex)
{
    out.println(ex);
}
 finally{con.close();}
%>
<p id="Message"></p>



<table align="center" class="Content"><tr>
        
        <td align="right"><input type="submit" title="Close" value="Close" onclick="window.parent.Shadowbox.close();" /></td>
    </tr></table>

    </body>
</html>
