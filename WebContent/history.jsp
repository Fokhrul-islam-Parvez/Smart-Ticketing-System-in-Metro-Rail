

  
 <%@ page import="backEnd.sessionCreate"%>
 

 <%@ page import="backEnd.sessionCreate"%>
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
    String userID="";
    
    
   
     %>
    <%
    dbConnection db=new dbConnection();
    con=db.setConnection(databaseName, databasePassword);
    st=db.CreatStatement(con);
    sessionCreate check=new sessionCreate();
    userID=check.checkSession(request, response);
    
    
    String query="select * from TRAVEL_HISTORY where ID='"+userID+"'";
    rs=db.ExecuteQuery(st, query);
    %>
 
 <%!
   
    String type=" ";
    String name=" ";
   %>
    <%
   
    userID=check.checkSession(request, response);
    type=(String) session.getAttribute("type");
    name=(String) session.getAttribute("name");
    
    %>


<!DOCTYPE html >
<html>
<head>
    <title>History</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <link rel="stylesheet" type="text/css" href="CSS/NewFile2.css">
     
       <link rel="stylesheet" type="text/css" href="CSS/bootstrap.min.css">
        <link rel="stylesheet" type="text/css" href="CSS/fontawesome.min.css">
     <script type="text/javascript" src="jquery.min.js"></script>
     <script type="text/javascript" src="bootstrap.min.js"></script>
       <script type="text/javascript" src="account.js"></script>
       <link rel="stylesheet" type="text/css" href="CSS/material-icons.css">
       <link rel="stylesheet" href="CSS/file/font-awesome.min.css">
</head>
<body>

<div class="header">
  <div class="header1">
  <img class="logo" src="CSS/Image/jU14FTa.jpg" alt="Metro Rail" width="100" height="100">
  </div>
</div>
<div class="topnav">
  <a href="logOut">LOG OUT</a>
  <a href="schedule.jsp">SCHEDULE</a>
  <a href="fare.jsp">FARE</a>
   <a href="#">HOME</a>
  
</div>
<div class="container emp-profile">
            
                <div class="row">
                    <div class="col-md-4">
                        <div class="profile-img" >
                            <img src="CSS/Image/p2.jpg" alt="Profile picture"/>
                            <div class="file btn btn-lg btn-primary">
                                Change Photo
                                <input type="file" name="file"/>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="profile-head">
                                    <h5>
                                        <output ><% out.println(name); %></output>
                                    </h5>
                                    <h6>
                                        <output ><% out.println(type); %></output>
                                    </h6>
                                    <p class="proile-rating">RANKINGS : <span>8/10</span></p>
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Travel History</a>
                                </li>
                               
                            </ul>
                        </div>
                    </div>
                    
                </div>
                <div class="row">
                    <div class="col-md-4">
           <div class="profile-work ">
           
              <div class="menu profile-work card ">
                <ul class="list">
                   
                    <li class="active py-2">
                        <a href="User_Profile.jsp">
                            <i class="material-icons">home</i>
                            <span >Home</span>
                        </a>
                    </li>
                    <li class=" py-2">
                        <a href="CreatAccount.jsp">
                           <i class="material-icons">credit_card</i>
                             <span>Create Account</span>
                        </a>
                    </li>
                    <li class=" py-2">
                        <a href="BuyTicket.jsp">
                            <i class="material-icons">layers</i>
                            <span>Buy Ticket</span>
                        </a>
                    </li>
                    <li class=" py-2">
                        <a href="pages/typography.html">
                            <i class="material-icons">text_fields</i>
                            <span>Recharge</span>
                        </a>
                    </li>
                    <li class=" py-2">
                        <a href="CheckBalance.jsp">
                           <i class="material-icons">account_balance</i>
                            <span>Account Balance</span>
                        </a>
                    </li>
                     <li class=" py-2">
                        <a href="#">
                           <i class="material-icons">history</i>
                            <span>History</span>
                        </a>
                    </li>
                   </ul>
            </div>
                         
                           
                        </div>
                    </div>
                    
                    <div class="col-md-8">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                         
                                   <div class="container">
                                   
  <table  class="table table-striped table-dark">
  <tr>
    <th>ORIGIN</th>
    <th>DESTINATION </th> 
    <th>TRAVEL COST</th>
    <th>TRAVEL DATE</th>
    
  </tr>
  	 	<% 	 	
		  if(rs!=null)
		  {
			  try {
					 while(rs.next())
						{
		  out.print("<tr>");
		  out.print("<td>");
		  out.print(rs.getString(2));
		  out.print("</td>");
		  
		  
		  out.print("<td>");
		  out.print(rs.getString(3));
		  out.print("</td>");
		  
		 
		  out.print("<td>");
		  out.print(rs.getString(4)+" <small> BDT<//small>");
		  out.print("</td>");
		  

		  out.print("<td>");
		  out.print(rs.getString(5));
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
                                   </div>
                            </div>
                           
                            
                        </div>
                    </div>
                </div>
          
</div>

<div class="footer">
<b>
  <a href="#">Terms & Conditions</a> 
  <a href="#">Privacy Policy</a> 
  <a href="#">Contact Us</a>
</b>  
</div>



</body>
</html>