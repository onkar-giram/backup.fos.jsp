
package com.connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectionProvider {
    public static Connection getConnection(){
      Connection con = null;
        try{
            String url = "jdbc:mysql://localhost/fos";
            Class.forName ("com.mysql.cj.jdbc.Driver").newInstance ();
            con = DriverManager.getConnection (url, "root", "13321628");
            if(con != null){
                System.out.println("Successful");
            }
        }
        catch(Exception ex){
            System.out.println(ex.toString());
        }
        return con;
    }
    
    public static void main(String args[]){
        getConnection();
    }
}
