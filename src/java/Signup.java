import com.sun.org.apache.bcel.internal.generic.LASTORE;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import java.lang.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import javax.servlet.*;

public class Signup extends HttpServlet {

   public void init() throws ServletException {
  // Initialization code...
}

   public void service(ServletRequest request, ServletResponse response)
      throws ServletException, IOException{
            response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            
            String Firstname=request.getParameter("FName");
            String Lname=request.getParameter("LName");
            String Uname=request.getParameter("UName");
            String Email=request.getParameter("Email");
            String Password=request.getParameter("Password");
            String Question=request.getParameter("Question");
            String Answer=request.getParameter("Answer");
            String DOB=request.getParameter("DOB");

//out.println(Firstname+""+Lname+""+Uname+""+Email+""+Password+""+Question+""+Answer+""+DOB);
try
{

Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=DriverManager.getConnection("jdbc:mysql://localhost/HMS", "root", "123456");
  String Query = "insert into users(FirstName, LastName, UserName, Email, Password, Question, Answer, DOB) values('"+Firstname+"', '"+Lname+"', '"+Uname+"', '"+Email+"', '"+Password+"', '"+Question+"', '"+Answer+"', '"+DOB+"')";
Statement st=con.createStatement();
st.execute(Query);
con.close();
out.println("Signup successfully");

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

   