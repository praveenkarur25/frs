<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="java.util.*"%>
<%@page language="java"%>
<%@page import="com.frs.xyz.util.DBUtil"%>
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
	<title>Flight Search</title>
   
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
height: 470px;
margin-top: 100 px;
margin-bottom: 10px;
margin-left:50px;
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
.column1 {
  float: left;
  width: 30%;
  padding: 0 10px;
}
.column2 {
  float: left;
  width: 67%;
  padding: 0 10px;
}
.row1 {margin: 0 -5px;}
.table{
	background-color: rgba(0,0,0,0.5) !important;
	color:white !important;
}
.breadth {
  width: 15%;
}
</style>
<body>
<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
	<div class="container">
  <a class="navbar-brand" href="#">ABC FLIGHT SERVICES</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsibleNavbar">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="collapsibleNavbar">
    <ul class="navbar-nav ml-auto">
      
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:9080/FRS/UserHome.jsp" style="color:#ffc312;"><i class="fas fa-home" style="color:#ffc312;"></i>Home</a>
      </li>
	   <li class="nav-item">
        <a class="nav-link" href="http://localhost:9080/FRS/SeatBooking.jsp"><i class="fas fa-ticket-alt"></i>My Bookings</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:9080/FRS/SeatBooking.jsp"><i class="fas fa-user"></i>My Account</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="http://localhost:9080/FRS/Login.jsp" id="logout" onClick="return confirmed()"><i class="fas fa-sign-out-alt"></i>Logout</a>
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



<div class="row1">
	<div class="column1">
	
		<div class="card text-white">
			<div class="card-body ">
			<form>
				<div class="row">
						<div class="col">
							<div class="input-field">
								<label for="from">From:</label>
								<input type="text" class="form-control" id="from-place" placeholder="enter city" required/>
							</div>
						</div>
						<div class="col">
							<div class="input-field">
								<label for="from">To:</label>
								<input type="text" class="form-control" id="to-place" placeholder="enter city" required/>
							</div>
						</div>
						</div><br>
				<div class="row">
					<div class="col-sm-7">
						<div class="input-field">
							<label for="date-start">Date:</label>
							<input type="text" class="form-control" id="date-start" placeholder="mm/dd/yyyy" required/>
						</div>
					</div>
					
				</div><br>
				<div class="row">
					<div class="col-sm-12">
							
								<label for="class">Class:</label>
									<select class="form-control">
										<option value="economy">Economy</option>
										<option value="first">First</option>
										<option value="business">Business</option>
									</select>
							
					</div>
				</div><br>
				<div class="row">
					<div class="col">
						<label for="class">Adult:</label>
							<select class="form-control">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
					</div>
					<div class="col">
						<label for="class">Children:</label>
							<select class="form-control">
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
							</select>
					</div>
				</div><br>
				<div class="row">
					<div class="col">
						<input type="submit" class="btn btn-primary btn-block" value="Search Flight">
					</div>
				</div>
				</form>
			</div>
		</div>
		</div>
		<div class="column2">
			<div class="card text-white">
				<div class="card-header">
					<h3>Flights</h3>	
				</div>
			<%
	ArrayList<String> flight =(ArrayList<String>) request.getAttribute("flightid");
//String flightid = request.getParameter("flightid");
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
for(String flightid : flight){
  String query = "select flightname,departuretime,Economy_class_fare,arrivaltime from frs_tbl_flight where flightid ='"+flightid+"' ";
		
try {
	connection = DBUtil.getConnection();
	preparedStatement = connection.prepareStatement(query);
	resultSet = preparedStatement.executeQuery();
	while(resultSet.next()){%>
				<div class="card-body">
					<form action="">
						<table class="table table-hover">
						    <thead>
						      <tr>
						        <th>Flight Name</th>
						        <th>Flight ID</th>
						        <th>Departure</th>
						        <th>Arrival</th>
						        <th>Fare</th>
						        <th></th>
						      </tr>
						    </thead>
						    <tbody>
						      <tr>
						        <td><%=resultSet.getString("flightid") %></td>
						        <td><%=resultSet.getString("flightname") %></td>
						        <td><%=resultSet.getString("departuretime") %></td>
						        <td><%=resultSet.getString("arrivaltime") %></td>
						        <td><%=resultSet.getString("economy_class_fare") %></td>
						        <td><a class="btn btn-primary btn-sm" style="background:#007bff;" href="http://localhost:9080/FRS/SeatBooking.jsp">Book</a>
						      </tr>
						       </tbody>
						        </table>
						        	</form></div>
						      <%} 
	} 


catch(Exception e){
					e.printStackTrace();
							}
							}%>
	
						      
						   
						
				
				
			</div>	
		</div>
</div>
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
</script>
</html>