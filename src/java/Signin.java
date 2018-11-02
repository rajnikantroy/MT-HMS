import com.sun.org.apache.bcel.internal.generic.LASTORE;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import java.lang.*;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.*;


public class Signin extends HttpServlet {

   public void init() throws ServletException {
  // Initialization code...
}

   public void service(ServletRequest request, ServletResponse response)
      throws ServletException, IOException{
            response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

    /*    if (request instanceof HttpServletRequest)
        {
    String url = ((HttpServletRequest)request).getRequestURL().toString();
    out.println(url);
}*/



        try {

            String Email=request.getParameter("Email");
            String Pass=request.getParameter("Pass");

//out.println(Firstname+""+Lname+""+Uname+""+Email+""+Password+""+Question+""+Answer+""+DOB);
try
{

Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/HMS", "root", "123456");
  String Query = "select count(*) from users where email='"+Email+"' and PASSWORD='"+Pass+"'";
Statement st=con.createStatement();
ResultSet rs=st.executeQuery(Query);
//st.execute(Query);
while(rs.next())
{
if(rs.getString(1).equals("1"))
{    
out.println("Welcome");

//public void HttpServletResponse.sendRedirect(String location)
//throws IOException

//response.sendRedirect("Dashboard.jsp");
    }
 else
{
out.println("Not authorize user");
 }}
con.close();
            }
catch(ClassNotFoundException ex){}

        }
        catch(SQLException ex){out.println(ex);}
                finally {
            out.close();
        }


        }

    public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
    // Servlet code
}

    public void doGet(HttpServletRequest request,HttpServletResponse response)throws ServletException, IOException {
    // Servlet code
}

    public void destroy() {
    // Finalization code...
  }

}

   