package backEnd;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

@WebServlet("/TicketBuyingCalculation")
public class TicketBuyingCalculation extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userID="";
		 sessionCreate check=new sessionCreate();
		    userID=check.checkSession(request, response);
		PrintWriter out=response.getWriter();
		int source=Integer.parseInt(request.getParameter("source"));
		int destination=Integer.parseInt(request.getParameter("destination"));
		String sourceStations="";
		String destinationStations="";
		double distance_bt_2_stations[]=new double[15];
		PreparedStatement ps = null; 
		    Connection con = null;
		    Statement st = null;
		    ResultSet rs = null; 
		    ResultSet rs2 = null; 
		    String databaseName=DatabaseNameAndPassword.getDatabaseName();
		    String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
		    
		    dbConnection db=new dbConnection();
		    try {
				con=db.setConnection(databaseName, databasePassword);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
		    st=db.CreatStatement(con);
		    
		    String query="select * from DISTANCE_BT_2_STATIONS";
		    rs=db.ExecuteQuery(st, query);
		    int i=0;
		    if(rs!=null)
 		   {
 		 	  try {
 		 			 while(rs.next())
 		 				{  
 		 				distance_bt_2_stations[i]= rs.getDouble(3);
 		 				i++;
 		 				}
 		 		} catch (SQLException e) {
 		 			
 		 			e.printStackTrace();
 		 		}
 		   }
    try {
		rs.close();
	} catch (SQLException e) {
		e.printStackTrace();
	}
    
    String query2="select * from STATIONS";
    rs2=db.ExecuteQuery(st, query2);
    if(rs2!=null)
	   {
	 	  try {
	 			 while(rs2.next())
	 				{  
	 				if(source==rs2.getInt(1) )
	 					sourceStations=rs2.getString(2);
	 				if(destination==rs2.getInt(1))
	 					destinationStations=rs2.getString(2);
	 				}
	 		} catch (SQLException e) {
	 			
	 			e.printStackTrace();
	 		}
	   }
    try {
		rs.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    fairCalculate fc=new fairCalculate();
    fc.setStations();
    fc.setFair(distance_bt_2_stations,5);
    int totalFair=fc.totalCostCalculate(source, destination);
    double totalDistance=fc.totalDistanceCalculate(source, destination, distance_bt_2_stations);
    int AccountBalance=0;
    
    String query3="select * from ACCOUNT where ID='"+userID+"'";
    rs2=db.ExecuteQuery(st, query3);
    if(rs2!=null)
	   {
	 	  try {
	 			 while(rs2.next())
	 				{  
	 				    AccountBalance=rs2.getInt(5);
	 				}
	 		} catch (SQLException e) {
	 			
	 			e.printStackTrace();
	 		}
	   }
 try {
		rs2.close();
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
    out.println("before chack balance");
 if(AccountBalance>totalFair+500)
 { out.println("after chack balance");
	 int UpdateBalance=AccountBalance-totalFair;
	int rs4;
	 String query4="UPDATE ACCOUNT set BALANCE=? WHERE ID=?";		
		
		try {
			ps=con.prepareStatement(query4);
			ps.setInt(1, UpdateBalance);
			ps.setString(2, userID);
			 out.println("before update balance");
			rs4=ps.executeUpdate();
			if(rs4!=0)
			{
				out.println("after update balance");
				DateAndTime dnt=new DateAndTime();
				String date=dnt.getDate();
				 QRCodeGenerator qrc= new  QRCodeGenerator();
			    
					qrc.setQRcode(sourceStations, destinationStations,  date);
			
				
			    String query5="INSERT INTO TRAVEL_HISTORY (ID, ORIGIN, DESTINATION, COST, TRAVEL_DATE) VALUES ('"+userID+"', '"+sourceStations+"', '"+destinationStations+"','"+totalFair+"','"+date+"')";
			    int rs5=0;
			    out.println("after insert history");
			    rs5= db.updateQuery( st, query5);
			   
			    if(rs5!=0)
			    {
			    	out.println("befor insert history");
			    	
			    		dispector dc=new dispector();
			    		dc.requestDispectorForward(request, response,"BuyTicket.jsp");
			    }
			}
			
			ps.close();
		} catch (SQLException | NoSuchAlgorithmException e) {
			
			e.printStackTrace();
		}
		
		
 }
 else
 {
	
	   dispector dc=new dispector();
		dc.requestDispectorForward(request, response,"BuyTicket.jsp");
 }
 
 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
