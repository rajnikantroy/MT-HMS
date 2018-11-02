/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package DataAccess;
import java.sql.*;
/**
 *
 * @author Administrator
 */
public class Connect {

    //Connection con;
public void Open(String status)
    {
    try
    {
        Connection con;
        if(status.equals("Open"))
        {    
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost/hms", "root", "123456");
        }
        else if(status.equals("Close"))
        {
           // con.close();
        }
        }

    catch(Exception ex)
  {
        System.out.println(ex);
    }
}
}
