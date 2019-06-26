<%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="com.frs.xyz.service.Flight_Details"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page language="java"
	import="com.frs.xyz.bean.*,java.util.*,com.frs.xyz.dao.*,com.frs.xyz.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
	 <jsp:include page="AdminPage.jsp"/>
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
<title>edit Flight</title>

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">

<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Numans');

@import
	url('https://fonts.googleapis.com/css?family=Gothic+A1|Kaushan+Script|Libre+Baskerville|Lobster')
	;
.container {
	height: 20%;
	align-content: center;
}

.card {
	height: 460px;
	margin-left: 200px;
	margin-top: 130px;
	width: 700px;
	background-color: rgba(0, 0, 0, 0.5) !important;
	overflow-y: auto;
	font-size:18px;
}

.card-title h1 {
	color: white;
	text-align: center;
	padding: 20px 10px 0px 30px;
}

.card-header h3 {
	color: white;
	text-align: center;
}

.table {
	background-color: rgba(0, 0, 0, 0.5) !important;
	color: white !important;
}

.btn:hover {
	background-color: #ffc312;
	color: black;
	border: none !important;
}
.text-intro {
	width: 90%;
	margin: auto;
	padding-left:400px;
	padding-top: 610px;
}
.btn:active {
	background: black;
	border: none !important;
}

.btn:focus {
	background: black;
	border: none !important;
}

.highlight {
	background-color: #ffc312;
	color: black !important;
}

label {
	color: white;
}

form {
	color: white;
}
</style>
<body>
	
	<div class="sidenav tab mt-5 pt-5">
	<a href="http://localhost:9080/FRS/Flights.jsp" class="pt-4 highlight"><i
		class="fas fa-plane-departure"> FLIGHTS</i></a>
	<a href="http://localhost:9080/FRS/Route.jsp" class="pt-4"><i
		class="fas fa-map-marked-alt"> ROUTE</i></a>
	<a href="http://localhost:9080/FRS/Schedule.jsp" class="pt-4"><i class="fas fa-clock"> SCHEDULE</i></a>
	<a href="http://localhost:9080/FRS/Passenger_Details.jsp" class="pt-4"><i class="fas fa-users"> PASSENGER
			DETAILS</i></a>
	</div>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">

				<div class="card-header">

					<h3>Flight Details</h3>

				</div>
				<div class="card-body">
					<form action="edit" method="post">
						<div class="form-group">
							<%
								String flightid = request.getParameter("flightid");
								Connection connection = null;
								PreparedStatement preparedStatement = null;
								ResultSet resultSet = null;
								String query = "select flight_name,flightid,Booked_seats,Economy_class_fare from frs_tbl_flight where flightid='"
										+ flightid + "'";
								try {
									connection = DBUtil.getConnection();
									preparedStatement = connection.prepareStatement(query);
									resultSet = preparedStatement.executeQuery(query);

									while (resultSet.next()) {

										out.println("Flight name &emsp;&emsp;&emsp;: <input type=text style=width:190px id=flightName name=flightName value="
												+ resultSet.getString("flight_name")
												+ "  required>&emsp;&emsp;Flight ID &emsp;: <input type=text style=width:150px id=flightid name=flightid value="
												+ resultSet.getString("flightid")
												+ " readonly><br><div class=form-group>"
												//From : <input type=text style=width:150px name=from value="
												//+ resultSet.getString("flight_From")
												//+ " readonly>Via : <input type=text style=width: 150px name=from value="
												//+ resultSet.getString("via")
												///+ " readonly> To : <input type=text style=width:150px name=from value="
												//+ resultSet.getString("flight_to")
											//	+ " readonly>
												+"</div><div class=form-group>Class&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;: <input type=text style=width: 150px name=economy value=Economy readonly></div><div class=form-group><label for=fare>Fare&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; &#8377</label> <input type=number style=width: 150px id=fare name=fare value='"+resultSet.getString("Economy_class_fare")+"' required></div>"
												+"<div class=form-group>Seating Capacity&emsp;: <input type=text style=width: 150px name=economy value=90 readonly></div><div class=form-group>Booked Seats&emsp;&emsp; : <input type=text style=width: 150px name=economy value='"+resultSet.getString("booked_seats")+"'></div>");
									}
								} catch (Exception e) {
									e.printStackTrace();
								}

								finally {
									DBUtil.close(connection, preparedStatement, resultSet);
								}

								//	Flight ID : <input type="text" style="width:150px" id="flightid" name="flightid" value=flightid  readonly>
							%>
						</div>
						<br>





						<div class="d-flex justify-content-center">
							<div>
								<button type="submit" class="btn btn-primary">Save</button>
							</div>
					</form>

					<form action="Flights.jsp">
						<div">
							<button type="submit" class="btn btn-primary ml-3">cancel</button>
						</div>
					</form>
				</div>


			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links"></div>
			</div>
		</div>
	</div>
<div class="container">
			<div class="text-intro">

				<p>Copyright &#x00A9 2019-Wipro Technologies. All rights reserved </p>
			</div>
		</div>
</body>
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