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
    String databaseName=DatabaseNameAndPassword.getDatabaseName();
    String databasePassword=DatabaseNameAndPassword.getDatabasePassword();
 %>
    <%
    dbConnection db=new dbConnection();
    con=db.setConnection(databaseName, databasePassword);
    st=db.CreatStatement(con);
    %>


<!DOCTYPE>
<html>
<head>
    <title>Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="CSS/schedule.css">
     <link rel="stylesheet" href="CSS/file/font-awesome.min.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
      <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
     <script type="text/javascript" src="jquery.slim.min.js"></script>
     <script type="text/javascript" src="popper.min.js"></script>
     <script type="text/javascript" src="bootstrap.min.js"></script>

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

<div class="regpart" style="background-image: url('CSS/Image/image28.jpg'); "  >

<div class="reg-box">
<form action="schedule" method="post" class="input-group px-0 py-0 mx-0 my-0">
  <select class="custom-select px-0 py-0 mx-0 my-0" id="inputGroupSelect04" required name="source" > 
           		<option selected>Select Stations</option>
           <%
           String query2="select * from STATIONS";
           rs=db.ExecuteQuery(st, query2);
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
  </select>
  <div class="input-group-append px-0 py-0 mx-0 my-0 ">
  <button class="btn btn-outline-secondary  mx-4 my-0 " type="button" value="select" name="select">Select</button>
  </div>
</form>
 <table style="width:100%" id="customers">
  <tr>
    <th class="tb"  style="padding:8px;" >Train no</th>
    <th class="tb">Train Name</th> 
    <th class="tb">Origin</th>
    <th class="tb">Destination</th>
    <th class="tb">OFF day</th>
    <th class="tb">Arrival Time</th> 
    <th class="tb">Departure Time</th>
    
  </tr>
<%
 String query="select * from SCHEDULE ";
  ResultSet rs = null;
  rs=db.ExecuteQuery(st, query);
  if(rs!=null)
  {
	  try {
			 while(rs.next())
				{
  out.print("<tr>");
  out.print("<td id=\"trainNo\" style=\"padding:8px; text-align:center;\" >");
  out.print(rs.getString(1));
  out.print("</td>");
  
  
  out.print("<td style=\"padding:8px; text-align: center;\" >");
  out.print(rs.getString(2));
  out.print("</td>");
  
 
  out.print("<td style=\"padding:8px; text-align: center;\">");
  out.print(rs.getString(3));
  out.print("</td>");
  

  out.print("<td style=\"padding:8px; text-align: center;\">");
  out.print(rs.getString(4));
  out.print("</td>");
  
  out.print("<td style=\"padding:8px; text-align: center;\">");
  out.print(rs.getString(5));
  out.print("</td>");
 
  out.print("<td style=\"padding:8px; text-align: center;\">");
 // out.print(rs.getString(7));
 out.print("</td>");
  
  out.print("<td style=\"padding:8px; text-align: center;\">");
//  out.print(rs.getString(7));
  out.print("</td>");
  
  
  
  out.print("</tr>");
				}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
}
  
  db.ConnectionClose(st, con);
  %>    



 </table>

</div></div>

<div class="footer">
<b>
  <a href="#">Terms & Conditions</a> 
  <a href="#">Privacy Policy</a> 
  <a href="#">Contact Us</a>
</b>  
</div>



</body>
</html>