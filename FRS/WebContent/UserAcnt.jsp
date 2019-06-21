<%@page import = "java.util.*" %>
<%@page import="com.frs.xyz.controller.Register"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="com.frs.xyz.service.Flight_Details"%>
<%@page import="com.frs.xyz.util.DBUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
	<title>User Accounts</title>
   
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">

</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Numans');
@import url('https://fonts.googleapis.com/css?family=Gothic+A1|Kaushan+Script|Libre+Baskerville|Lobster');
.body{
	font-family: 'Numans', sans-serif;
	font-size:16px;
	}
	p{
	color:black;
	font-size:1em;
	}
.navbar-brand  span{
	color: #FFC312;
	font-size:25px;font-weight:700;letter-spacing:0.1em;
    font-family: 'Numans', sans-serif;
}
.navbar-brand {
	color: #fff;
	font-size:25px;
    font-family: 'Numans', sans-serif;
	font-weight:700;
	letter-spacing:0.1em;
}
.navbar-nav .nav-item .nav-link{
	padding: 1.1em 1em!important;
	font-size: 120%;
    font-weight: 500;
    letter-spacing: 1px;
    color: #fff;
   font-family: 'Numans', sans-serif;
}
.navbar-nav .nav-item .nav-link:hover{color:#FFC312;}
.navbar-expand-md .navbar-nav .dropdown-menu{
	border-top:3px solid #fed136;
}
.dropdown-item:hover{background-color:#FFC312;color:#fff;}
nav{-webkit-transition: padding-top .3s,padding-bottom .3s;
    -moz-transition: padding-top .3s,padding-bottom .3s;
    transition: padding-top .3s,padding-bottom .3s;
    border: none;
	}
	
 .shrink {
    padding-top: 0;
    padding-bottom: 0;
    background-color: #212529;
}
.text-intro{
	width:90%;
	margin:auto;
	text-align:center;
	padding-top:610px;
}
html,body{
background-image: url('https://static.toiimg.com/thumb/65576160/Airplane.jpg?width=748&height=499');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}
.container{
height:20%;
}
.card{
height: 625px;
margin-top: 50 px;
margin-bottom: auto;
margin-left:250px;
width: 800px;
background-color: rgba(0,0,0,0.5) !important;
}
.card-title h1{
color: white;
text-align: center;
padding:20px 10px 0px 30px;
}
.card-header h3{
color: white;
text-align: center;
}
input:focus{
outline: 0 0 0 0  !important;
box-shadow: 0 0 0 0 !important;
}
.login_btn{
color: black;
background-color: #FFC312;
width: 100px;
}
.login_btn:hover{
color: black;
background-color: white;
}
.links{
color: white;
}
.links a{
margin-left: 6px;
color:#FFC312;
}
.btn {
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}
.btn {
  text-transform: uppercase;
  letter-spacing: 1px;
  -webkit-transition: 0.3s;
  -o-transition: 0.3s;
  transition: 0.3s;
}
.btn.btn-primary {
  background: #FFC312;
  color: #fff;
  border: none !important;
  border: 2px solid transparent !important;
}
.btn.btn-primary:hover, .btn.btn-primary:active, .btn.btn-primary:focus {
  box-shadow: none;
  background: #FFC312;
  color: #303030 !important;
}
.btn:hover, .btn:active, .btn:focus {
  background: white !important;
  color: #fff;
  outline: none !important;
}
.btn.btn-default:hover, .btn.btn-default:focus, .btn.btn-default:active {
  border-color: transparent;
}
.btn.btn-outline {
  background: transparent;
  color: #FFC312;
  border: 2px solid #FFC312 !important;
}
.btn.btn-outline:hover, .btn.btn-outline:focus, .btn.btn-outline:active {
  background: #FFC312 !important;
  color: #fff !important;
}
.tab-content .btn {
  letter-spacing: 0;
  text-transform: none;
  font-weight: bold;
  font-size: 18px;
}
</style>
<body onkeydown = "return(event.keyCode != 116)">
<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
	<div class="container">
  <!-- Brand -->
  <a class="navbar-brand" href="#">XYZ FLIGHT SERVICES</a>

  <!-- Toggler/collapsibe Button -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Navbar links -->
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="#" onclick="return confirm()"><i class="fas fa-home"></i>Home</a>
      </li>
	   <li class="nav-item">
        <a class="nav-link" href="#" onclick="return confirm()"><i class="fas fa-ticket-alt"></i>My Bookings</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"  style="color:#ffc312;"><i class="fas fa-user" style="color:#ffc312;"></i>My Account</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#"  onclick="return confirm()" id="logout" onClick="return confirmed()"><i class="fas fa-sign-out-alt"></i>Logout</a>
      </li>
    
    </ul>
  </div>
	</div>
</nav>


<section id="about">
<div class="container">
	<div class="text-intro">
	
		<p></p>
	</div>
</div>
</section>
<div class="d-flex justify-content-start h-100">
		<div class="card text-white">
			<div class="card-header text-center mt-3">
				<h5>My Profile</h5>
			</div>
			<div class="card-body ">
			<form action="update" method ="post">  
<%
String userid = (String)request.getAttribute("userid");
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
String query = "select firstname,lastname,email,phonenumber from frs_tbl_users_profile where userid ='"+userid+"' ";
try{
	connection = DBUtil.getConnection();
	preparedStatement = connection.prepareStatement(query);
	resultSet = preparedStatement.executeQuery(query);
	while(resultSet.next()){ %>

	
			
			
		
				<div class="row">
					<div class="col">
						<div class="input-field">
							<label for="usr_id">User ID&emsp;&emsp;&emsp;:</label>
							<input type="text" id="usr_id" name="userid" value=<%=userid %> readonly/>
						</div> 
					</div>
					<div class="col">
				
						<div class="input-field">
							<label for="email">Email ID&emsp;:</label>
							<input type="text" id="email"  value=<%=resultSet.getString("email") %> readonly/>
						</div>
					</div>
				</div><br>
				<div class="row">
						<div class="col">
							<div class="input-field">
								<label for="fname">Firstname&emsp; :</label>
								<input type="text" id="fname"  value=<%=resultSet.getString("firstname")%> readonly/>
							</div>
						</div>
						<div class="col">
							<div class="input-field">
								<label for="lname">Lastname:</label>
								<input type="text" id="lname"  value=<%=resultSet.getString("lastname")%> readonly/>
							</div>
						</div>
				</div><br>		
				<div class="row">
					<div class="col">
						<div class="input-field">
							<label for="date-start">Date Of Birth:</label>
							<input type="text" id="date-start" style="width:210px;" name ="dob" placeholder="mm/dd/yyyy" value="" required/>
						</div>
					</div>
					<div class="col">
						<div class="input-field">
							<label for="gender">Gender&emsp;:</label>
							<input type="radio" name="gender" value="male" required> Male
							<input type="radio" name="gender" value="female" required> Female
							<input type="radio" name="gender" value="other" required> Other 
						</div>
					</div>
				</div><br>
				<div class="row">
					<div class="col">
						<div class="input-field">
							<label for="street">Street&emsp;&emsp;&emsp; :</label>
							<input type="text" style="width:300px; margin-left:5px;" name="street" placeholder="street"  required/>
						</div>
					</div>
					
				</div><br>
				<div class="row">
					<div class="col">
						<div class="input-field">
							<label for="district">District&emsp;&emsp;&emsp;:</label>
							<input type="text" id="district" name = "district" placeholder="district"  required/>
						</div>
					</div>
					<div class="col">
						<div class="input-field">
							<label for="city">City&emsp;&emsp;&emsp;:</label>
							<input type="text" name="city" placeholder="city"  required/>
						</div>
					</div>
					
				</div><br>
				<div class="row">
					<div class="col">
						<div class="input-field">
							<label for="state">State&emsp;&emsp;&emsp;&emsp;:</label>
							<input type="text" id="state" placeholder="" value="" required/>
						</div>
					</div>
					<div class="col">
						<div class="input-field">
							<label for="pincode">Pincode&emsp;:</label>
							<input type="tel" id="pincode" pattern="[0-9]{6}" maxlength="6" style="width:210px;" placeholder="" value="" required/>
						</div>
					</div>
					
				</div><br>
				<div class="row">
					<div class="col">
						<label for="mobile_no">Mobile No&emsp; :</label>
						<input type="tel" name="phonenumber" pattern="[0-9]{10}" maxlength="10" style="margin-left:5px;" placeholder="" value=<%=resultSet.getString("Phonenumber")%> required/>
					</div>
				</div><br><br>
				<div class="row">
					<div class="col text-center">
						<input type="submit" class="btn btn-primary" value="Save Changes">
					</div>
				</div>
				</form>	
			</div>
		</div>
	</div>
<%}}catch(Exception e){
					e.printStackTrace();
							}%>
</body>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap-datepicker.min.js"></script>
	<script src="js/main.js"></script>

<script>
$(document).on("scroll", function(){
	if
  ($(document).scrollTop() > 86){
	  $("#banner").addClass("shrink");
	}
	else
	{
		$("#banner").removeClass("shrink");
	}
});
</script>

<script>
function confirmed()
{
	if(confirm('Are you sure want to logout?')) {
        return true;
    }
    return false;
	}
	
	function confirm(){
		alert("submit form");
		return false;
	}
</script>
</html>