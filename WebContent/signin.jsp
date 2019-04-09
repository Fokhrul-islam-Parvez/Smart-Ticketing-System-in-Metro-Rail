<!DOCTYPE html >
<html>
<head>
    <title>Login</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="CSS/signin.css">
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

<div class="loginpart" style="background-image: url('CSS/Image/image15.jpg');" >
<div class="login-box">
    <h1>Login</h1>
	
	<form action="login" target="" method="POST">
	<div class="textbox">
	<i class="fa fa-user" aria-hidden="true"></i>

	<input type="email" placeholder="somthing@gmail.com" name="uemail">
	</div>
	
	<div class="textbox">
	<i class="fa fa-lock" aria-hidden="true"></i>

	<input type="password" placeholder="Password" name="upass" value="">
	</div>
	<br>
	<a style="float:right;" href="#">Forgot Password?</a>
	<br><br>
	<input class="btn" type="submit" name="" value="Sign in">
	</form>
	<br>
	<p>New user?<b><a style="color:#4caf50;" href="Signup.html">Sign Up</a></b></p>
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