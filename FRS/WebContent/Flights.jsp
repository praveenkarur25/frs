<%@page import="com.frs.xyz.controller.AddFlight"%>
<%@page import="com.frs.xyz.service.Flight_Details"%>
<%@page language="java"%>
<%@page import="java.sql.*"%>
<%@ page language="java" import="com.frs.xyz.bean.*,java.util.*,com.frs.xyz.dao.*,com.frs.xyz.util.*" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <jsp:include page="AdminPage.jsp"/>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
	<title>Flight Details</title>
   
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Numans');
@import url('https://fonts.googleapis.com/css?family=Gothic+A1|Kaushan+Script|Libre+Baskerville|Lobster');
.body{
	font-family: 'Numans', sans-serif;
	}
	
.container{
height: 20%;
align-content: center;
}

.card{
height: 570px;
margin-left:150px;
margin-right:1px; 
margin-top: 130px;
width: 1200px;
background-color: rgba(0,0,0,0.5) !important;
overflow-y:auto;
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

.sidenav a:focus {
	background-color:#ffc312;
	color: black;
}
.table{
	background-color: rgba(0,0,0,0.5) !important;
	color:white !important;
}
.btn{
background-color: #007bff;
color:white;
}
.btn.btn-a{
background-color:red;
color:white;
}
.btn:hover{
	background-color:#ffc312;
	color:black;
	border:none !important;
}
.btn:active{
	background:white;
	color:black;
	border:none !important;
}
.btn:focus{
	background:black;
	border:none !important;
}
.text-intro {
	width: 90%;
	margin: auto;
	padding-left:400px;
	padding-top: 610px;
}

.highlight{
	background-color:#ffc312;
	color:black !important;
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
				<form name="login" action="Edit_Flight.jsp" method="get">
					<table class="table table-hover">
					    <thead>
					      <tr bgcolor=#003973>
					        <th align="center"><font color="white">Flight ID</font></th>
					        <th align="center"><font color="white">Flight Name</font></th>
					        
					      <!--    <th align="center"><font color="white">From</font></th>
					        <th align="center"><font color="white">To</font></th> -->
					        <th align="center"><font color="white">Seating Capacity</font></th>
					       
					        <th align="center"><font color="white">Booked Seats</font></th>
					        <th></th>
					        <th></th>
					      </tr>
					    </thead>
					    <tbody>
<%
Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
String query = "select flight_name,flightid,booked_seats from frs_tbl_flight";
try{
	connection = DBUtil.getConnection();
	preparedStatement = connection.prepareStatement(query);
	resultSet = preparedStatement.executeQuery(query);
	while(resultSet.next()){
		out.println(" <tr><td>"+resultSet.getString("flightid")+"</td><td>"+
	resultSet.getString("flight_Name")+"</td><td>90"+
	//resultSet.getString("Departuretime")+"</td><td>"+
	//resultSet.getString("flight_From")+"</td><td>"+
	//resultSet.getString("flight_To")+"</td><td>"+
	//resultSet.getString("Arrivaltime")+
	"</td><td>"+
	resultSet.getInt("booked_seats")+"</td><td><form action=Edit_Flight.jsp><button class=btn btn-primary type=submit name=flightid value="+resultSet.getString("flightid")+">Edit</button></form></td></td><td><form action = delete method = post ><button type=submit class=btn btn-danger style='background:red;' name=flightid value="+resultSet.getString("flightid")+" onClick='return deleted()'>Delete</button></form></td></tr></tr>"
	);
	
	}
	
	
}
catch(Exception e){
	e.printStackTrace();
}
finally{
	DBUtil.close(connection, preparedStatement, resultSet);
}

%>
	
					      
					    </tbody>
					</table>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					<form action="AddFlights.jsp">
						<input class="btn btn-primary btn-sm" type="submit" value="ADD FLIGHTS">
					</form>
				</div>
			</div>
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

			
	
function deleted(){
	if(confirm('Are you sure want to Delete?')) {
        return true;
       
    }

    return false;
	}
		</script>
	<script>
		
	
	</script>
</html>