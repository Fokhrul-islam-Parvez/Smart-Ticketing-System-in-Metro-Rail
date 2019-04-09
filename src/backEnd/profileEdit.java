package backEnd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/profileEdit")
public class profileEdit extends HttpServlet {

	


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		PrintWriter out = response.getWriter(); 
		
		
	   
	    String email=request.getParameter("email");
	    String phone=request.getParameter("phone");
	    String present_address=request.getParameter("present_address");
	    String permanent_address=request.getParameter("permanent_address");
	    String state=request.getParameter("state");
	    String postal=request.getParameter("postal");
	    String country=request.getParameter("country");
	    String nationality=request.getParameter("nationality");
	    String fname=request.getParameter("fname");
	    String lname=request.getParameter("lname");
	    String city=request.getParameter("city");
		
		
		
		
		
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
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}

		
		try {
			
			
			
			String query="UPDATE userregistration set FNAME=?, LNAME=?, EMAIL=?, NATIONALITY=?, MOBILE=?, STATE=?, POSTAL=?, PERMANENT_ADDRESS=?, PRESENT_ADDRESS=?, COUNTRY=?, CITY=? WHERE ID=?";		
			ps=con.prepareStatement(query);
			ps.setString(1, fname);
			ps.setString(2, lname);
			ps.setString(3, email);
			ps.setString(4, nationality);
			ps.setString(5, phone); 
			ps.setString(6, state);
			ps.setString(7, postal);
			ps.setString(8, permanent_address);
			ps.setString(9, present_address);
			ps.setString(10, country);
			ps.setString(11, city); 
			ps.setString(12, userID);
			rs=ps.executeUpdate();
			ps.close();
			if(rs!=0)
			{
				dbc.ConnectionClose( st,con);
				dispector rd=new dispector();
				rd.requestDispectorForward(request,response,"User_Profile.jsp");
			}
			else
				out.print("no ");
		} catch (SQLException e) {
			
			e.printStackTrace();
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
