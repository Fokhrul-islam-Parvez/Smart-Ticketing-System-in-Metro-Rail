package backEnd;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CreateAccount")
public class CreateAccount extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter(); 
		HttpSession session=request.getSession();
	    String nid=request.getParameter("NidNumber");
	    String treasury=request.getParameter("treasury");
	    String Account_Number="";
	    String Account_Name=(String) session.getAttribute("name");
		try {
			Account_Number = AccountNumberCreate.CreateID();
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
	    String userID=null;
	    
	    dbConnection dbc=new dbConnection();
		Connection con = null;
		Statement st = null;
		PreparedStatement ps = null; 
		int rs = 0;
		String databaseName=DatabaseNameAndPassword.getDatabaseName();
		String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		sessionCreate check=new sessionCreate();
		userID=check.checkSession(request, response);
		try {
			
			con = dbc.setConnection(databaseName,  databasePassword);
		} catch (ClassNotFoundException | SQLException e1) {
		
			e1.printStackTrace();
		}

		
		try {
			String query="INSERT INTO ACCOUNT (ID, ACCOUNT_NUMBER, NID_NUMBER,TREASURY_NUMBER,ACCOUNT_NAME) VALUES ('"+userID+"', '"+Account_Number+"', '"+nid+"','"+treasury+"','"+Account_Name+"')";
			st=dbc.CreatStatement(con);
			rs= dbc.updateQuery( st, query);
		
			if(rs!=0)
			{
				dbc.ConnectionClose( st,con);
				dispector rd=new dispector();
				rd.requestDispectorForward(request,response,"CreatAccount.jsp");
			}
			else
				out.print("no ");
		}finally {
		      try{
			         if(st!=null)
			         {
			        	 try{
			    	         if(con!=null)
			    	        	 dbc.ConnectionClose( st,con);
			    	      }catch(Exception se){
			    	         se.printStackTrace();
			    	      }
			         }
			      }catch(Exception se){
			      }
			}
		dbc.ConnectionClose( st,con);
	    
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
