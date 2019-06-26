<%@page import="java.util.*"%>
<%@page import="com.frs.xyz.controller.Register"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="com.frs.xyz.service.Flight_Details"%>
<%@page import="com.frs.xyz.util.DBUtil"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page session="true"%>
<%@ page import="com.frs.xyz.bean.TicketBean" %>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
<title>User Page</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<link rel="stylesheet" href="css/bootstrap-datepicker.min.css">

</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Numans');

@import
	url('https://fonts.googleapis.com/css?family=Gothic+A1|Kaushan+Script|Libre+Baskerville|Lobster')
	;

.body {
	font-family: 'Numans', sans-serif;
	font-size: 16px;
}

p {
	color: black;
	font-size: 1em;
}

.navbar-brand  span {
	color: #FFC312;
	font-size: 25px;
	font-weight: 700;
	letter-spacing: 0.1em;
	font-family: 'Numans', sans-serif;
}

.navbar-brand {
	color: #fff;
	font-size: 25px;
	font-family: 'Numans', sans-serif;
	font-weight: 700;
	letter-spacing: 0.1em;
}

.navbar-nav .nav-item .nav-link {
	padding: 1.1em 1em !important;
	font-size: 120%;
	font-weight: 500;
	letter-spacing: 1px;
	color: #fff;
	font-family: 'Numans', sans-serif;
}

.navbar-nav .nav-item .nav-link:hover {
	color: #FFC312 !important;
}

.navbar-expand-md .navbar-nav .dropdown-menu {
	border-top: 3px solid #fed136;
}

.dropdown-item:hover {
	background-color: #FFC312;
	color: #fff;
}

nav {
	-webkit-transition: padding-top .3s, padding-bottom .3s;
	-moz-transition: padding-top .3s, padding-bottom .3s;
	transition: padding-top .3s, padding-bottom .3s;
	border: none;
}

.dropdown-item:hover {
	background-color: #FFC312;
	color: #fff;
}

nav {
	-webkit-transition: padding-top .3s, padding-bottom .3s;
	-moz-transition: padding-top .3s, padding-bottom .3s;
	transition: padding-top .3s, padding-bottom .3s;
	border: none;
}

.shrink {
	padding-top: 0;
	padding-bottom: 0;
	background-color: #212529;
}

.text-intro {
	width: 90%;
	padding-left: 300px;
	padding-top: 10px;
}

html, body {
	background-image:
		url('https://static.toiimg.com/thumb/65576160/Airplane.jpg?width=748&height=499');
	background-size: cover;
	background-repeat: no-repeat;
	height: 100%;
	font-family: 'Numans', sans-serif;
}

.container {
	height: 10%;
}
/* Float four columns side by side */
.column1 {
	float: left;
	width: 25%;
	padding: 0 10px;
}

.column2 {
	float: left;
	width: 75%;
	padding: 0 10px;
}
/* Remove extra left and right margins, due to padding */
.row {
	margin: 0 -5px;
}
/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}
/* Responsive columns */
@media screen and (max-width: 600px) {
	.column1 {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
	.column2 {
		width: 100%;
		display: block;
		margin-bottom: 20px;
	}
}

.card {
	height: 525px;
	margin-top: 50;
	margin-bottom: auto;
	background-color: rgba(0, 0, 0, 0.5) !important;
	overflow-x: auto;
}

.card-title h1 {
	color: white;
	text-align: center;
	padding: 20px 10px 0px 30px;
}

.card-header h6 {
	color: white;
	text-align: center;
}

.login_btn {
	color: black;
	background-color: #FFC312;
	width: 100px;
}

.login_btn:hover {
	color: black;
	background-color: white;
}

.links {
	color: white;
}

.links a {
	margin-left: 6px;
	color: #FFC312;
}

.btn:hover {
	background-color: white;
	color: black;
	border: none !important;
}

.btn:active {
	background: black;
	border: none !important;
}

.btn:focus {
	border: none !important;
}

.btn:disabled {
	background: grey;
	border: none !important;
}

.tname {
	background: #007bff;
}
</style>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
		<div class="container">
			<!-- Brand -->
			<a class="navbar-brand" style="color: white;"><i
				class="fas fa-plane" style="font-size: 25px; color: #ffc312;"></i>XYZ
				FLIGHT SERVICES <i class="fas fa-plane"
				style="font-size: 25px; color: #ffc312;"></i></a>
			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<!-- Navbar links -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item "><a class="nav-link"
						href="http://localhost:9080/FRS/UserHome.jsp"
						style="color: #ffc312;"><i class="fas fa-home"
							style="color: #ffc312;"></i>Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:9080/FRS/MyBooking.jsp"
						style="color: #fff;"><i class="fas fa-ticket-alt"></i>My
							Bookings</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:9080/FRS/MyAccount.jsp"
						style="color: #fff;"><i class="fas fa-user"></i>My Account</a></li>
					<li class="nav-item"><a class="nav-link"
						href="http://localhost:9080/FRS/Logout.jsp" style="color: #fff;"
						id="logout" onClick="return confirmed()"><i
							class="fas fa-sign-out-alt"></i>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<section id="about">
		<div class="container">
			<div class="text-intro"></div>
		</div>
	</section>
	<div class="container">
		<div class="h-100">
			<form action="booking" method="post">
				<div class="row">
					<%
						String flightclass = (String) request.getParameter("class");
						int adult = Integer.parseInt(request.getParameter("adult"));
						int children = Integer.parseInt(request.getParameter("children"));
						String flightid = request.getParameter("flightid");
						String dateofjourney = request.getParameter("date");

						//out.println(flightclass);

						if (flightclass.equals("Economy")) {
					%>

					<jsp:include page="EconomySeat.jsp"><jsp:param
							value="<%=adult%>" name="adult" /></jsp:include>
					<%
						} else if (flightclass.equals("Business")) {
					%>
					<jsp:include page="BusinessSeat.jsp"><jsp:param
							value="<%=adult%>" name="adult" />
							<jsp:param
							value="<%=flightid%>" name="flightid" />
							<jsp:param
							value="<%=dateofjourney%>" name="date" />
							
							
							</jsp:include>
					<%
						} else {
					%>
					<jsp:include page="FirstSeat.jsp"><jsp:param
							value="<%=adult%>" name="adult" /></jsp:include>
					<%
						}
					%>



					<div class="column2">
						<div class="card text-white">
							<div class="card-body">
								<h5 class="card-title text-center">Passenger Details</h5>
								<br>



								<p class="tname text-black"
									style="background: #ffc312; width: 180px;">Adults Details</p>
								<table class="table table-hover text-white">
									<thead>
										<tr bgcolor=#003973>
											<th align="center"><font color="white">S.no</font></th>
											<th align="center"><font color="white">Name</font></th>
											<th align="center"><font color="white">Age</font></th>
											<th align="center"><font color="white">Gender</font></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 1; i <= adult; i++) {
										%>
										<tr>
											<td><%=i%></td>
											<td><label for="name"></label> <input type="text"
												id="name" name="name" required></td>
											<td><label for="age"></label> <input type="number"
												id="age" style="width: 70px;" min="6" max="65" value="6" required></td>
											<td><label class="radio-inline"><input
													type="radio" name=<%=i %> required>Male</label> <label
												class="radio-inline"><input type="radio"
													name=<%=i %> required>Female</label> <label
												class="radio-inline"><input type="radio"
													name=<%=i %> required>Other</label></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<br>
								<p class="tname text-black"
									style="background: #ffc312; width: 180px;">Children Details</p>
								<table class="table table-hover text-white">
									<thead>
										<tr bgcolor=#003973>
											<th align="center"><font color="white">S.no</font></th>
											<th align="center"><font color="white">Name</font></th>
											<th align="center"><font color="white">Age</font></th>
											<th align="center"><font color="white">Gender</font></th>
										</tr>
									</thead>
									<tbody>
										<%
											for (int i = 1; i <= children; i++) {
										%>
										<tr>
											<td><%=i%></td>
											<td><label for="name"></label> <input type="text"
												id="name"></td>
											<td><label for="age"></label> <input type="number"
												id="age" style="width: 70px;" min="1" max="5" value="1"></td>
											<td><label class="radio-inline"><input
													type="radio" name="radio2" required>Male</label> <label
												class="radio-inline"><input type="radio"
													name="radio2" required>Female</label> <label
												class="radio-inline"><input type="radio"
													name="radio2" required>Other</label></td>
										</tr>
										<%
											}
										%>
									</tbody>
								</table>
								<br>
								<p class="tname text-black"
									style="background: #ffc312; width: 180px;">Address Details</p>

								<%
									String userid = (String) session.getAttribute("userid");
									
									//String flightclass = (String)request.getParameter("class");
								
									//TicketBean ticket = new TicketBean();
									//ticket.setSeats(seat);
									//ticket.setFlightid(flightid);
									//ticket.setUserid(userid);
									
									//out.println(ticket.getFrom());
									
								//	request.setAttribute("flight", flightid);
									//HttpSession sess = request.getSession();
									//sess.setAttribute("flightid", flightid);
									//sess.setAttribute("userid", userid);
									Connection connection = null;
									PreparedStatement preparedStatement = null;
									ResultSet resultSet = null;
									String query = "select street,city,district,state,pincode,phonenumber,email  from frs_tbl_users_profile where userid ='"
											+ userid + "' ";
									try {
										connection = DBUtil.getConnection();
										preparedStatement = connection.prepareStatement(query);
										resultSet = preparedStatement.executeQuery(query);
										while (resultSet.next()) {
								%>
								<div class="row">
									<div class="col2" style="width: 65%;">
										<label for="streetname">Street name&emsp;:</label> <input
											type="text" id="streetname" style="width: 200px;"
											value=<%=resultSet.getString("street")%> required>
									</div>
									<input type="text" name="userid" value=<%=userid%> hidden>
									<input type="text" name="flightid" value=<%=flightid%> hidden>
									<input type="text" name="class" value=<%=flightclass%> hidden>
									
									<input type="text" name="date" value=<%=dateofjourney%> hidden>
								</div>
								<br>
								<div class="row">
									<div class="col1" style="width: 45%;">
										<label for="city">City/Town &emsp;&emsp;:</label> <input
											type="text" id="city" style="width: 170px;"
											value=<%=resultSet.getString("city")%> required>
									</div>
									<div class="col2" style="width: 55%;">
										<label for="district">District &emsp;:</label> <input
											type="text" id="district" style="width: 170px;"
											value=<%=resultSet.getString("district")%> required>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col2" style="width: 45%;">
										<label for="state">State &emsp;&emsp;&emsp;&emsp; :</label> <input
											type="tel" id="state" style="width: 170px;"
											value=<%=resultSet.getString("state")%> required>
									</div>
									<div class="col2" style="width: 55%;">
										<label for="pincode">Pincode&emsp;:</label> <input type="tel"
											id="pincode" style="width: 170px;" maxlength="6"
											pattern="[0-9]{6}" value=<%=resultSet.getString("pincode")%>
											required>
									</div>
								</div>
								<br>
								<div class="row">
									<div class="col2" style="width: 45%;">
										<label for="state">Mobile &emsp; &emsp;&emsp; : </label> <input
											type="tel" id="mobile" style="width: 170px;" maxlength="10"
											pattern="[0-9]{10}"
											value=<%=resultSet.getString("Phonenumber")%> required>
									</div>
									<div class="col2" style="width: 55%;">
										<label for="email">E-mail&emsp;&emsp;:</label> <input
											type="email" id="email" style="width: 170px;"
											value=<%=resultSet.getString("email")%> required>
									</div>
								</div>
								<br>
								<div class="text-center">
									<input class="btn btn-primary" onClick="return valid()"
										style="align: center;" type="submit" value="submit">
								</div>

								<%
									}
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>


</body>

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap-datepicker.min.js"></script>
<script src="js/main.js"></script>
<script>
	$(document).on("scroll", function() {
		if ($(document).scrollTop() > 86) {
			$("#banner").addClass("shrink");
		} else {
			$("#banner").removeClass("shrink");
		}
	});
</script>
<script>
	function confirmed() {
		if (confirm('Are you sure want to logout?')) {
			return true;
		}
		return false;
	}
</script>



</html>