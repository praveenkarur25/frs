<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
	<title>Add Flight</title>
   
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<style>
@import url('https://fonts.googleapis.com/css?family=Numans');
@import url('https://fonts.googleapis.com/css?family=Gothic+A1|Kaushan+Script|Libre+Baskerville|Lobster');

.container{
height: 30%;
align-content: center;
}
.card{
height: 550px;
margin-left:200px; 
margin-top: 100px;
width: 700px;
background-color: rgba(0,0,0,0.5) !important;
overflow-y:auto;
}
.card-body{
font-size: 18px;
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
.table{
	background-color: rgba(0,0,0,0.5) !important;
	color:white !important;
}
.btn:hover{
	background-color:#ffc312;
}
.btn:active{
	background:black;
}
.text-intro {
	width: 90%;
	margin: auto;
	padding-left:400px;
	padding-top: 610px;
}
.btn:focus{
	background:black;
}
label{
	color:white;
}
form{
	color:white;
}
.highlight{
	background-color:#ffc312;
	color:black !important;
}
</style>
<body>

	<div class="sidenav tab mt-5 pt-5">
	    <a href="http://localhost:9080/FRS/Flights.jsp" class="pt-4 highlight"><i class="fas fa-plane-departure">      FLIGHTS</i></a>
	    <a href="http://localhost:9080/FRS/Route.jsp" class="pt-4"><i class="fas fa-map-marked-alt">    ROUTE</i></a>
	    <a href="http://localhost:9080/FRS/Schedule.jsp" class="pt-4"><i class="fas fa-clock">    SCHEDULE</i></a>
	    <a href="http://localhost:9080/FRS/Passenger_Details.jsp" class="pt-4"><i class="fas fa-users">  PASSENGER DETAILS</i></a>
	</div>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card">
		
			<div class="card-header">
				
				<h3>Flight Details</h3>
				
			</div>
			<div class="card-body">
				<form action="addflight" method="post">
					<div class="form-group">
						Flight name &emsp;&emsp;: <input type="text" style="width:170px" id="flightName" name="flightName" placeholder="Flight name" required>
						
				    </div>
				    <br>
				    <div class="form-group">
				    	From &emsp;&emsp;&emsp;&emsp;&emsp;: <input type="text" style="width:170px" name="from" placeholder="From Airport" required>
				    	
				    	&emsp;To &emsp;&emsp;&emsp;&emsp;: <input type="text" style="width:170px" name="to" placeholder="To Airport" required>
				    </div>
				    <br>
				    <div class="form-group">
				    	
				    	Departure time&emsp;: <input type="text" style="width:170px" name="depTime" placeholder="hh:mm" required>
				    	&emsp;Arrival time : <input type="text" style="width:170px" name="arrTime" placeholder="hh:mm" required>
				    </div>
				    <br>
				    <div class="form-group">
				    	Class &emsp;&emsp;&emsp;&emsp;&emsp; :<input type="text" style="width:170px; margin-left:4px;" name="class" value="Economy" readonly>
				    </div>
				    <br>
    				<div class="form-group">
				      <label for="fare">Fare &emsp;&emsp;&emsp;&emsp;&emsp;&#8377</label>
				      <input type="number" style="width:170px" id="fare" name="fare" placeholder="500" required>
    				</div>
    				
    				<div class="form-group">
				      <label for="fare">Availabe Days &emsp;:</label>
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Mon" checked>Mon
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Tue">Tue
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Wed">Wed
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Thu">Thu
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Fri">Fri
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Sat">Sat
				      <input type="checkbox" id="days" style="width:20px;height:15px;" name="days" value="Sun">Sun
    				</div>
				
    				<div class="d-flex justify-content-center">
    				<div>
    					<button type="submit" class="btn btn-primary">Add</button>
					</div>
				</form>
				
				<form action="Flights.jsp">
					<div">
    					<button type="submit" class="btn btn-primary ml-3">cancel</button>
					</div>
				</form>
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
function confirmed()
		{
			if(confirm('Are you sure want to logout?')) {
		        return true;
		       
		    }

		    return false;
			}
			</script>
</html>