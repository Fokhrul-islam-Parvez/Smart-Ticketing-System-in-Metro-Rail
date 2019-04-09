

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
 
 <%!
    String userID="";
    String type=" ";
    String name=" ";
   %>
    <%
    sessionCreate check=new sessionCreate();
    userID=check.checkSession(request, response);
    type=(String) session.getAttribute("type");
    name=(String) session.getAttribute("name");
    
    %>


<!DOCTYPE html >
<html>
<head>
    <title>Buy Ticket</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
     <link rel="stylesheet" type="text/css" href="CSS/BuyTicket.css">
     
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
                                    <a class="nav-link active " id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Fare and Distance</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link " id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Ticket Buying</a>
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
                        <a href="#">
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
                        <a href="history.jsp">
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
                      <div class="tab-pane fade show active " id="home" role="tabpanel" aria-labelledby="home-tab">       
                         <div class="container">
      						<table class="table table-dark">
         						 <tbody>
           					   	  <tr>
             					    <td colspan="1">        
                  				    <fieldset>

 <h1>Select Stations</h1>  
 <form action="BuyTicket" method="post">
  <table>
      <tr> <td><label for="source">Origin:</label></td>
           <td> <select required name="source" class="browser-default custom-select"> 
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
      <tr> <td><label for="destination">Destination:</label></td>
           <td><select required name="destination" class="browser-default custom-select">
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
       //    db.ConnectionClose(st, con);
           %>
          							  
          						 </select></td></tr>
   						</table>
 

                       <div class="">
                        <input type="submit" class="btn btn-secondary btn-lg btn-block" name="btnAddMore" value="Submit"/>
                       </div>
					 </form>

                  </fieldset>
                </td>
                 <td colspan="2">        
                  <fieldset>
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
				  </fieldset>
                </td>
             </tr>
          </tbody>
       </table>
    </div>
 </div>
                  
        
   <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
 <div class="container"> 
                      <h1 class="bg-dark my-0 text-center font-weight-bold  text-light">Select Stations</h1>  
 <form action="TicketBuyingCalculation" method="post">
  <table class="table table-dark my-0">
  
      <tr> <td class=" text-center"><label class="h3 "for="source">Origin:</label></td>
           <td> <select required name="source" class="browser-default custom-select"> 
           		<option selected value="">Select Option</option>
           <%
           rs=db.ExecuteQuery(st, query);
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
      <tr> <td class=" text-center"><label class="h3 " for="destination">Destination:</label></td>
           <td><select required name="destination" class="browser-default custom-select">
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
 

                       <div class="">
                        <!--  <input type="submit" class="btn btn-secondary btn-lg btn-block"  value="Buy Ticket"/>-->
                        <button class="btn btn-secondary btn-lg btn-block" type="submit">Buy Ticket</button>
                       </div>
					 </form>
                      
               
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