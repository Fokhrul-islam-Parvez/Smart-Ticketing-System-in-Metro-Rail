
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    String userID="";
    
    String type=" ";
    String name=" ";
    String email=" ";
    String phone=" ";
    String present_address=" ";
    String permanent_address=" ";
    String state=" ";
    String postal=" ";
    String country=" ";
    String nationality=" ";
    String fname=" ";
    String lname=" ";
    String city=" ";
   
     %>
    <%
    dbConnection db=new dbConnection();
    con=db.setConnection(databaseName, databasePassword);
    st=db.CreatStatement(con);
    sessionCreate check=new sessionCreate();
    userID=check.checkSession(request, response);
    
    
    String query="select * from USERREGISTRATION where ID='"+userID+"'";
  
   
    
    rs=db.ExecuteQuery(st, query);
    if(rs!=null)
    {
  	  try {
  			 while(rs.next())
  				{
  				 
  				    fname= rs.getString(4);
  				    lname= rs.getString(5);
  				    email = rs.getString(2);
  					name=rs.getString(4)+" "+rs.getString(5);
  				    phone=rs.getString(10);
  				    present_address=rs.getString(14);
  				    permanent_address=rs.getString(13);
  				    state=rs.getString(11);
  				    postal=rs.getString(12);
  				    country=rs.getString(16);
  				    type=rs.getString(15);
  				    nationality=rs.getString(7);
  				    city=rs.getString(17);
  				}
  		} catch (SQLException e) {
  			
  			e.printStackTrace();
  		}
    }
   
	session.setAttribute("name", name);
	session.setAttribute("type", type);
	rs.close();
    db.ConnectionClose(st, con);
    %>


<!DOCTYPE html >
<html>
<head>
    <title>Profile</title>
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
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">About</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">Edit Profile</a>
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
                        <a href="#">
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
                        <a href="history.jsp">
                           <i class="material-icons">history</i>
                            <span>History</span>
                        </a>
                    </li>
                   </ul>
            </div>
                         
                           
                        </div>
                    </div>
                    
                    <div class="col-md-7">
                        <div class="tab-content profile-tab" id="myTabContent">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                         
                                   <div class="container" >
                                    <table class="table table-striped">
      								    <tbody>
      								       <tr>
         								       <td colspan="1">        
             							         <fieldset>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Name</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(name); %></output></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Email</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(email); %></output></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Phone</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(phone); %></output></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Present Address</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(present_address); %></output></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Permanent Address</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(permanent_address); %></output></p>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <label>State/Province/Region</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(state); %></output></p>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <label>Postal Code/ZIP</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(postal); %></output></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>City</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(city); %></output></p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <label>Nationality</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(nationality); %></output></p>
                                            </div>
                                        </div>
                                         <div class="row">
                                            <div class="col-md-6">
                                                <label>Country</label>
                                            </div>
                                            <div class="col-md-6">
                                                <p><output ><% out.println(country); %></output></p>
                                            </div>
                                        </div>
                                        </fieldset>
                </td>
             </tr>
          </tbody>
       </table>
     </div>
 </div>
                           
 <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
 <div class="container">
       <table class="table table-striped">
          <tbody>
             <tr>
                <td colspan="1">        
                      <fieldset>
                      <form action="profileEdit" method="post">
                         <div class="form-group">
                            <label class="col-md-4 control-label">First Name</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="fname" name="fname" placeholder="First Name" class="form-control" required value="<% out.println(fname); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Last Name</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="lname" name="lname" placeholder="Last Name" class="form-control" required value="<% out.println(lname); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Email</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home "></i></span><input id="addressLine1" name="email" placeholder="Email" class="form-control" required value="<% out.println(email); %>" type="email"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">phone</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home "></i></span><input id="addressLine1" name="phone" placeholder="Phone" class="form-control" required value="<% out.println(phone); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Present Address</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine2" name="present_address" placeholder="Present Address" class="form-control" required value="<% out.println(present_address); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Permanent Address</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="addressLine2" name="permanent_address" placeholder="Permanent Address" class="form-control" required value="<% out.println(permanent_address); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">City</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="city" name="city" placeholder="City" class="form-control" required value="<% out.println(city); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">State/Province/Region</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="state" name="state" placeholder="State/Province/Region" class="form-control" required value="<% out.println(state); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Postal Code/ZIP</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-home"></i></span><input id="postcode" name="postal" placeholder="Postal Code/ZIP" class="form-control" required value="<% out.println(postal); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Nationality</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span><input id="email" name="nationality" placeholder="Nationality" class="form-control" required value="<% out.println(nationality); %>" type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-4 control-label">Country</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group">
                                  <span class="input-group-addon" style="max-width: 100%;"><i class="glyphicon glyphicon-list"></i></span>
                                  <select class="selectpicker form-control" name="country" required>
                                     <option value="Bangladesh" selected>Bangladesh</option>
                                     <option value="Pakistan">Pakistan</option>
                                     <option value="India">India</option>
                                  </select>
                               </div>
                            </div>
                         </div>                      
                         
                         <br>
                         <div class="col-md-8">
                        <input type="submit" class="btn btn-secondary btn-lg btn-block" name="btnAddMore" value="Submit"/>
                    </div>
                    </form>
                      </fieldset>
                </td>
             </tr>
          </tbody>
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