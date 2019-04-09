<!DOCTYPE>
<html>
<head>
    <title>Registration</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="CSS/Signup.css">
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

<div class="regpart" style="background-image: url('CSS/Image/image20.jpg'); "  >
<div class="reg-box">
    <h1>Create a new account</h1>
	
	<form action="registration" method="POST">
	<div class="textbox">
	<i class="fa fa-user" aria-hidden="true"></i>
	<input type="text" placeholder="Enter your frist name" name="fname"  required>
	</div>
	
	<div class="textbox">
	<i class="fa fa-user" aria-hidden="true"></i>
	<input type="text" placeholder="Enter your last name" name="lname"  required>
	</div>
	
	<div class="textbox">
	<i class="fa fa-envelope" aria-hidden="true"></i>
	<input type="email" placeholder="Enter your email" name="email"  required >
	</div>
	
	<div class="textbox">
	<i class="fa fa-lock" aria-hidden="true"></i>
	<input type="password" placeholder="Enter a Password" name="pass"  required>
	</div>
	
	<div class="textbox">
	<i class="fa fa-lock" aria-hidden="true"></i>
	<input type="password" placeholder="Re-type password" name="ReTypePassword"  required>
	</div>
	
	<div class="textbox">
	<i class="fa fa-mobile" aria-hidden="true"></i>
	<input type="text" placeholder="Enter your mobile number" name="mbnumber" required>
	</div>
	
	<!--  <div class="textbox">
	<i class="fa fa-user-sex" aria-hidden="true"></i>
	<input type="radio" name="gender" id="male" value="Male" checked> Male <input type="radio" name="gender" id="female" value="Female" > Female <input type="radio" name="gender" id="female" value="Other" > Other
	</div>	-->
	<input class="btn" type="submit" name="" value="Sign Up">
	</form>

</div></div>

<div class="footer">
<b>
  <a href="#">Terms & Conditions</a> |
  <a href="#">Privacy Policy</a> |
  <a href="#">Contact Us</a>
</b>  
</div>



</body>
</html>