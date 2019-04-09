<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.Connection"%>
 <%@ page import="java.sql.ResultSet"%>
 <%@ page import="java.sql.Statement" %>
 <%@ page import="backEnd.dbConnection"%>
 <%@ page import="java.sql.SQLException"%>
 <%@ page import="backEnd.DatabaseNameAndPassword"%>
 <%@ page import="javax.servlet.http.HttpSession" %>
 
 <%!
    Connection con = null;
    Statement st = null;
    ResultSet rs = null; 
    ResultSet rs2 = null; 
    String databaseName=DatabaseNameAndPassword.getDatabaseName();
    String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
 %>
    <%
    dbConnection db=new dbConnection();
    con=db.setConnection(databaseName, databasePassword);
    st=db.CreatStatement(con);
    String query="select * from STATIONS";
    rs=db.ExecuteQuery(st, query);
    //rs2=db.ExecuteQuery(st, query);
    %>
<!DOCTYPE>
<html>
<head>
    <title>Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="CSS/fare.css">
    <link rel="stylesheet" href="CSS/file/font-awesome.min.css">
    
</head>
<body>

<div class="header">
  <div class="header1">
  <img class="logo" src="CSS/Image/jU14FTa.jpg" alt="Metro Rail" width="100" height="100">
  </div>
</div>


<div class="topnav">
  <a href="signup.jsp">SIGN UP</a>
  <a href="signin.jsp">SIGN IN</a>
   <a href="schedule.jsp">SCHEDULE</a>
  <a href="fare.jsp">FARE</a>
  <a href="home.html">HOME</a>
  <a style="float:right" href="adminlogin.html">ADMIN</a>
</div>


<div class="regpart" style="background-image: url('CSS/Image/image27.jpg'); "  >
<div class="h"><h1>Find Fare, Distance and Route between two Stations</h1></div>

<div class="reg-box2"> 
 <h1>Fare Inquiry</h1>  
 <form action="FairCalculateServlet" method="post">
  <table>
      <tr> <td><label for="source">Origin :</label></td>
           <td> <select required name="source"> 
           		<option selected value="">Select Option</option>
           <%
        		   if(rs!=null)
        		   {
        		 	  try {
        		 			 while(rs.next())
        		 				{  
        		 				   out.println(" <option value=\""+rs.getInt(1)+"\">"+rs.getString(2)+"</option>");					
        		 				}
        		 		} catch (SQLException e) {
        		 			
        		 			e.printStackTrace();
        		 		}
        		   }
           rs.close();
           %>
          							  
          						 </select></td></tr>
      <tr> <td> <label for="destination">Destination :</label></td>
           <td><select required name="destination">
           		<option selected value="">Select Option</option>
           <%
        		   rs2=db.ExecuteQuery(st, query);
        		   if(rs2!=null)
        		   {
        		 	  try {
        		 			 while(rs2.next())
        		 				{  
        		 				   out.println(" <option value=\""+rs2.getInt(1)+"\">"+rs2.getString(2)+"</option>");					
        		 				}
        		 		} catch (SQLException e) {
        		 			
        		 			e.printStackTrace();
        		 		}
        		   }
        		   rs2.close();
           db.ConnectionClose(st, con);
           %>
          							  
          						 </select></td></tr>
   </table>
  <%  //<p id="demo">ar</p>%>
<!--  <input type="submit" value="Find" onclick="myFunction()">--> 
 <input type="submit" name="editProfil" Value="Find"style=" border: 1px solid black; width: 100%; background-color: green;; color:white; padding:5px; font-family:Verdana, Geneva, sans-serif; font-size: 100%;"> 
 </form>
</div>


<div class="reg-box">   
   <h1>Fare and Distance</h1>                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
    <table class="tab1">
      <tr> <td><label >Origin:</label></td>
           <td><output ><%= session.getAttribute("sourceStations")%></output></td></tr>
      <tr> <td> <label >Destination:</label></td>
           <td><output ><%= session.getAttribute("destinationStations") %></output></td></tr>
      <tr> <td> <label >Distance:</label></td>
           <td><output ><%= session.getAttribute("totalDistance")+"   kilometer" %></output></td></tr>
      <tr> <td> <label >Fare:</label></td>
           <td><output ><%=session.getAttribute("totalFair")+"  BDT" %></output></td></tr>
  </table>  
</div>
</div>
 <h1>Google Map</h1> 
<div id="map">Map</div>
    <script>
function initMap() {
	
	var directionsService = new google.maps.DirectionsService();
	var directionsDisplay = new google.maps.DirectionsRenderer();
	
    var dhaka={lat: 23.8103, lng: 90.4125};
    
    var uluru = {lat: 23.751120, lng: 90.386908};
    var uluru2 = {lat: 23.751280, lng: 90.378395};
    
    var map = new google.maps.Map(
    document.getElementById('map'), {zoom: 15, center: uluru});
    
    var marker = new google.maps.Marker({position: uluru, map: map});
    var marker = new google.maps.Marker({position: uluru2, map: map});
    directionsDisplay.setMap(map);
}
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDF-Hexb9uIJ0FSurqMJkBmnya7G_dgUTk&callback=initMap">
    </script>


<div class="footer">
<b>
  <a href="#">Terms & Conditions</a> |
  <a href="#">Privacy Policy</a> |
  <a href="#">Contact Us</a>
</b>  
</div>



</body>
</html>