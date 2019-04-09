package backEnd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/FairCalculateServlet")
public class FairCalculateServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int source=Integer.parseInt(request.getParameter("source"));
		int destination=Integer.parseInt(request.getParameter("destination"));
		String sourceStations="";
		String destinationStations="";
		double distance_bt_2_stations[]=new double[15];
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
    
    HttpSession session=request.getSession();
    session.setAttribute("totalDistance", totalDistance);
    session.setAttribute("totalFair", totalFair);
    session.setAttribute("sourceStations", sourceStations);
    session.setAttribute("destinationStations", destinationStations);
    PrintWriter out = response.getWriter();
    out.println(totalDistance);
    out.println(totalFair);
    out.println(sourceStations);
    out.println(destinationStations);
    out.println(source);
    out.println(destination);
    db.ConnectionClose(st, con);
    dispector dc=new dispector();
    dc.requestDispectorForward(request, response,"fare.jsp");
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
