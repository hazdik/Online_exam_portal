package Servlets;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import Servlets.DBConnection;
public class ExecuteQuery extends DBConnection{
	
	 public static ResultSet  exeQuery(String uType){
		 Connection con= createConnection();
			Statement st = null;
			
			try {
				st = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_UPDATABLE);
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			
			ResultSet set_check= null;
			
			try {

				set_check = st.executeQuery(uType);
				System.out.println(set_check);
				
			} catch (SQLException ex) {
				ex.printStackTrace();
			}

			return set_check;
	 }
}
