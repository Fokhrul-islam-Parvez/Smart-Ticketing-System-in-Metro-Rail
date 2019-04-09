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
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#map{
 height:500px;
 width:70%;
 padding:10px;
 margin:auto;
}
</style>
<!-- <link rel="stylesheet" href="/maps/documentation/javascript/cgc/demos.css">-->
<link href="CSS/fair.css" rel="stylesheet" type="text/css"> 
<!--  <script src="Script.js"></script>-->
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="modal">
 <form action="FairCalculateServlet" method="post">
  <h3>Find Fair and Root between two Stations</h3>
  <table>
      <tr> <td><label for="source">Source :</label></td>
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
 <input type="submit" value="Find" onclick="myFunction()">
 </form>
</div>

<%
//HttpSession session1=request.getSession();

//session.getAttribute("totalDistance");
//.getAttribute("totalFair");
//session.getAttribute("sourceStations");
//session.getAttribute("destinationStations");
%>

<div id="id01" class="modal">                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
    <table class="tab1">
      <tr> <td><label >Source :</label></td>
           <td><output ><%= session.getAttribute("sourceStations")%></output></td></tr>
      <tr> <td> <label >Destination :</label></td>
           <td><output ><%= session.getAttribute("destinationStations") %></output></td></tr>
      <tr> <td> <label >Distance:</label></td>
           <td><output ><%= session.getAttribute("totalDistance")+"   kilometer" %></output></td></tr>
      <tr> <td> <label >Fair :</label></td>
           <td><output ><%=session.getAttribute("totalFair")+"  BDT" %></output></td></tr>
  </table>  
</div>
 <div id="map">Map</div>
     <script>  
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 7,
          center: {lat: 23.810331, lng: 90.412521}
        });
        directionsDisplay.setMap(map);

        var onChangeHandler = function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        };
        var source="<%= session.getAttribute("sourceStations")%>";
        var destination="<%= session.getAttribute("destinationStations") %>";
      
       /* var StationsName = ["Uttara North", "Uttara Centre", "Uttara South","Pallabi","Mirpur 11","Mirpur-10","Kazipara","Shewrapara","Agargaon","Bijoy Sarani","Farmgate","Karwan Bazar","Shahbag","Dhaka University","Bangladesh Secretariat","Motijheel"];
        var i;
        for (i = 0; i <16; i++) { 
          if(i==source)
        	  source=StationsName[i];
          if(i==destination)
        	  destination=StationsName[i];
        }
        */
        source.addEventListener('change', onChangeHandler);
        destination.addEventListener('change', onChangeHandler);
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
    	
        directionsService.route({
          origin: <%=session.getAttribute("sourceStations")%>,
          destination: <%=session.getAttribute("destinationStations")%>,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBYRJ3K4K8GONsf5ItJfWDzBLJMNZa7Sok&callback=initMap"
        async defer></script>
</body>
</html>