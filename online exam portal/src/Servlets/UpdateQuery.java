package Servlets;
import java.sql.Connection;
import java.lang.Throwable;
import java.sql.SQLException;
import java.sql.Statement;

import Servlets.DBConnection;
@SuppressWarnings("unused")
public class UpdateQuery  extends DBConnection{
	
	
	 public static void  updQuery(String uQuery){
		 Connection con= createConnection();
			Statement st = null;
			
			try {
				st = con.createStatement();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			try {

				 st.executeUpdate(uQuery);
				System.out.println("hahahahahhahahahahhahah");
				
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			
	 }
}
