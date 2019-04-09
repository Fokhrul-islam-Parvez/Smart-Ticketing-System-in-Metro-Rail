
package backEnd;
import java.sql.*;
public class dbConnection {
public Connection setConnection(String databaseName, String password) throws ClassNotFoundException, SQLException
{
	Connection jdbcConnection = null;
	 if (jdbcConnection == null || jdbcConnection.isClosed()) 
	try {
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		jdbcConnection=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", databaseName, password);
		 return jdbcConnection;
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return null;
}

public Statement CreatStatement(Connection con)
{
	
	Statement st = null;
	try {
		st=con.createStatement();
		return st;
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return st;	
}


public ResultSet ExecuteQuery(Statement st,String query)
{
	ResultSet rs = null;
	try {
		rs = st.executeQuery(query);
		return rs;
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return rs;
	
	
}

public int updateQuery (Statement st,String query)
{
	int rs;
	try {
		
		rs = st.executeUpdate(query);
		return rs;
	} catch (SQLException e) {
		
		e.printStackTrace();
	}
	return 0;
	
}


public void ConnectionClose(Statement st,Connection con)
{
	try {
		 if(st!=null)
         {
			 st.close();
         }
        	 try{
    	         if(con!=null)
    	         {
    	        	 con.close();
    	         }
    	      }catch(Exception se){
    	         se.printStackTrace();
    	      }
        
	} catch (Exception e) {
		
		e.printStackTrace();
	}
}

}
