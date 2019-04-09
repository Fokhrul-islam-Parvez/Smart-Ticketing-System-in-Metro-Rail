
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="backEnd.sessionCreate"%>
 
 
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
    <title>Account</title>
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
                                    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">Account Create</a>
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
                        <a href="#">
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
                                         
                                   <div class="container">
       <table class="table table-striped">
          <tbody>
             <tr>
                <td colspan="1">        
                      <fieldset>
                      <form action="CreateAccount" method="post">
                         <div class="form-group">
                            <label class="col-md-4 control-label">NID Number</label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="nid" name="NidNumber" placeholder="NID Number" class="form-control" required type="text"></div>
                            </div>
                         </div>
                         <div class="form-group">
                            <label class="col-md-7 control-label">Sonali Bank Treasury Number </label>
                            <div class="col-md-8 inputGroupContainer">
                               <div class="input-group"><span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span><input id="treasury" name="treasury" placeholder="Treasury Number" class="form-control" required type="text"></div>
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