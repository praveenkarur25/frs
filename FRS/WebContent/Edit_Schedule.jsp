<%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="com.frs.xyz.service.Flight_Details"%>
<%@page import="com.frs.xyz.controller.EditSchedule"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page language="java"
	import="com.frs.xyz.bean.*,java.util.*,com.frs.xyz.dao.*,com.frs.xyz.util.*"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
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
<jsp:include page="AdminPage.jsp" />

<!DOCTYPE html>
<html>
<head>
<title>edit_schedule</title>

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
	height: 30%;
	align-content: center;
}

.card {
	height: 470px;
	margin-left: 250px;
	margin-right: 1px;
	margin-top: 130px;
	width: 700px;
	background-color: rgba(0, 0, 0, 0.5) !important;
	overflow-y: auto;
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
	border: none !important;
}

.btn:active {
	background: black;
	border: none !important;
}

.btn:focus {
	background: black;
	border: none !important;
}

label {
	color: white;
}

form {
	color: white;
}

.highlight {
	background-color: #ffc312;
	color: black !important;
}

.text-intro {
	width: 90%;
	margin: auto;
	padding-left: 400px;
	padding-top: 610px;
}
</style>
<body>

	<div class="sidenav tab mt-5 pt-5">
		<a href="http://localhost:9080/FRS/Flights.jsp" class="pt-4 "><i
			class="fas fa-plane-departure"> FLIGHTS</i></a> <a
			href="http://localhost:9080/FRS/Route.jsp" class="pt-4 "><i
			class="fas fa-map-marked-alt"> ROUTE</i></a> <a
			href="http://localhost:9080/FRS/Schedule.jsp" class="pt-4 highlight"><i
			class="fas fa-clock"> SCHEDULE</i></a> <a href="http://localhost:9080/FRS/Passenger_Details.jsp" class="pt-4"><i
			class="fas fa-users"> PASSENGER DETAILS</i></a>
	</div>
	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">

				<div class="card-header">

					<h3>Schedule Details</h3>

				</div>
				<div class="card-body">
					<form action="schedule" method="post">
						<div class="form-group">

							<%
								String flightid = request.getParameter("flightid");
								Connection connection = null;
								PreparedStatement preparedStatement = null;
								ResultSet resultSet = null;
								String query = "select flightid,routeid,departuretime,travelduration,availabledays from frs_tbl_schedule where flightid='"
										+ flightid + "'";
								try {
									connection = DBUtil.getConnection();
									preparedStatement = connection.prepareStatement(query);
									resultSet = preparedStatement.executeQuery(query);

									while (resultSet.next()) {

										out.println(
												"<div class=form-group>Flight ID :&emsp;&emsp;&emsp;&emsp; <input type=text style=width:190px  name=flightid value="
														+ resultSet.getString("flightid")
														+ "  readonly></div><div class=form-group>Route ID :&emsp;&emsp;&emsp;&emsp; <input type=text style=width:150px name=routeid value="
														+ resultSet.getString("routeid") + " readonly>"
														//From : <input type=text style=width:150px name=from value="
														//+ resultSet.getString("flight_From")
														//+ " readonly>Via : <input type=text style=width: 150px name=from value="
														//+ resultSet.getString("via")
														///+ " readonly> To : <input type=text style=width:150px name=from value="
														//+ resultSet.getString("flight_to")
														//	+ " readonly>

														+ "</div><div class=form-group>Departure Time :&emsp; <input type=text style=width: 150px name=departuretime value="
														+ resultSet.getString("departuretime")
														+ " required></div><div class=input-group mb-3><label for=fare>Travel Duration : &emsp;</label> <input type=number style=width:60px; margin-left:3px; name=duration value="
														+ resultSet.getString("travelduration")
														+ " required><div class=input-group-append ><span class=input-group-text >Hours</span></div></div>"
														+ "</div><div class=form-group checks>Available Days :&emsp; ");
										String days[] = resultSet.getString("availabledays").split(",");
										int flag = 1;
										int i=0;
										for (int j = 0; j < 7; j++) {
											if (flag == 1 && days[i].equals("Mon")) {
												out.println("<input type=checkbox name=days value=Mon checked>Mon");
												flag++;
												i++;
												continue;

											} else if (flag == 1) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Mon >Mon");
												flag++;continue;

											}
											if (flag == 2 && days[i].equals("Tue")) {
												out.println(
														"<input type=checkbox name=days style=width:15px;height:15px; value=Tue checked>Tue");
												flag++;i++;continue;
											} else if (flag == 2) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Tue >Tue");
												flag++;continue;
											}
											if (flag == 3 && days[i].equals("Wed")) {
												out.println(
														"<input type=checkbox name=days style=width:15px;height:15px; value=Wed checked>Wed");
												flag++;i++;continue;
											} else if (flag == 3) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Wed >Wed");
												flag++;continue;
											}
											if (flag == 4 && days[i].equals("Thu")) {
												out.println(
									"<input type=checkbox name=days style=width:15px;height:15px; value=Thu checked>Thu");
												flag++;i++;continue;
											} else if (flag == 4) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Thu >Thu");
												flag++;continue;
											}
											if (flag == 5 && days[i].equals("Fri")) {
												out.println(
														"<input type=checkbox name=days style=width:15px;height:15px; value=Fri checked>Fri");
												flag++;i++;continue;
											} else if (flag == 5) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Fri >Fri");
												flag++;continue;
											}
											if (flag == 6 && days[i].equals("Sat")) {
												out.println(
														"<input type=checkbox name=days style=width:15px;height:15px; value=Sat checked>Sat");
												flag++;i++;continue;
											} else if (flag == 6) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Sat >Sat");
												flag++;continue;
											}
											if (flag == 7 && days[i].equals("Sun")) {
												out.println(
														"<input type=checkbox name=days style=width:15px;height:15px; value=Sun checked>Sun");
												flag++;i++;continue;
											} else if (flag == 7) {
												out.println("<input type=checkbox name=days style=width:15px;height:15px; value=Sun >Sun");
												flag++;continue;
											}
											
										}

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



						<div class="d-flex justify-content-center">
							<div>
								<button type="submit" class="btn btn-primary">Submit</button>
							</div>
					</form>

					<form action="Schedule.jsp">
						<div>
							<button type="submit" class="btn btn-primary ml-3">cancel</button>
						</div>
					</form>
					</div>
					</div>
				</div>
			</div>
		
		<div class="card-footer">
			<div class="d-flex justify-content-center links"></div>
		</div>
</div>
	
	<div class="container">
		<div class="text-intro">

			<p>Copyright &#x00A9 2019-Wipro Technologies. All rights reserved
			</p>
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
</html>