<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java"%>
<%@page import="com.frs.xyz.util.DBUtil"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>User Page</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"crossorigin="anonymous">
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
	h2{
	color:white;
	font-family: 'Numans', sans-serif;
	}
html,body{
background-image: url('https://static.toiimg.com/thumb/65576160/Airplane.jpg?width=748&height=499');
background-size: cover;
background-repeat: no-repeat;
height: 100%;
font-family: 'Numans', sans-serif;
}
.container{
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
.row {margin: 0 -5px;}
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
.card{
height: 525px;
margin-top: 10;
margin-bottom: auto;
background-color: rgba(0,0,0,0.5) !important;
overflow-x:auto;
}
.card-title h1{
color: white;
text-align: center;
padding:20px 10px 0px 30px;
}
.card-header h6{
color: white;
text-align: center;
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

.seatClass{
	color:white;
	margin-left:0px;
}
.btn:hover{
	background-color:#ffc312;
	color:black;
	border:none !important;
}
.btn:active{
	background:black;
	border:none !important;
}
.btn:focus{
		border:none !important;
}
.btn:disabled{
	background:grey;
	border:none !important;
}
.tname{
	background:#007bff;
}
<!-- SEAT LAYOUT -->
.ol {
  list-style: none;
}
.seats {
 display: flex;
 
  height:20px;
}
.seat {
  display: flex;
  flex: 0 0 12.28571428571429% !important;
  padding: 2px;
  position: relative ;
  width:40px;
  height:20px;
}
.seat:nth-child(3) {
  margin-right: 7%;
}
.seat:nth-child(6) {
  margin-right: 5%;
}
.seat input[type=checkbox] {
  
  position: absolute;
  opacity: 0;
}
.seat input[type=checkbox]:checked + label {
  background: blue;
}
.seat input[type=checkbox]:disabled + label {
  background: grey;
  overflow: hidden;
  display: block;
  position: relative;
  width: 100%;
  text-align: center;
  font-size: 15px;
  font-weight: bold;
  line-height: 1rem;
  padding: 5px 2px !important;
  border-radius: 3px;
  margin-bottom: -0.9rem;
}
.seat input[type=checkbox]:disabled + label:after {
  content: "";
  text-indent: 0;
  position: absolute;
  top: 5px;
  left: 50%;
  transform: translate(-50%, 0%);
}
.seat input[type=checkbox]:disabled + label:hover {
  box-shadow: none;
  cursor: not-allowed;
}
.seat label {
  display: block;
  position: relative;
  width: 100%;
  text-align: center;
  font-size: 11px;
  font-weight: bold;
  line-height: 1rem;
  padding: 5px 2px !important;
  background:#007bff;
  border-radius: 3px;
  margin-bottom: -.9rem;
 
}
.seat label:before {
  content: "";
  position: absolute;
  width: 75%;
  top: 0px;
  left: 50%;
  transform: translate(-50%, 0%);
  background: rgba(255, 255, 255, 0.4);
  border-radius: 3px;
}
.seat label:hover {
  cursor: pointer;
  box-shadow:blue;
  background:#FFC312;
}
.seat label:active {
background:blue;
}
.seat label:focus {
background:blue;
}
</style>
<body>


 
			<div class="column1">
				<div class="card">
					<div class="card-body">
						<h2 class="card-title text-white text-start">Seat Layout</h2><br><br>
				 	<div class="input-group form-group  d-flex justify-content-center seatClass">
								<h6 class="text-white ml-3 mb-0">Business Class</h6><br><br>
				    <div class="wrapper">
				  <%   Connection connection = null;
PreparedStatement preparedStatement = null;
ResultSet resultSet = null;
String seats ="";
String flightid =(String)request.getParameter("flightid");
String dateofjourney = (String)request.getParameter("date");

String sql ="select seats from frs_tbl_booking_details where flightid ='"+flightid+"' and dateofjourney= '"+dateofjourney+"'";
	

	try {
		connection = DBUtil.getConnection();
		preparedStatement = connection.prepareStatement(sql);
		resultSet = preparedStatement.executeQuery();
		while (resultSet.next()) {
			seats = seats + resultSet.getString("seats");
		}
		//out.println(seats);
		
	}
		catch(Exception e){
			e.printStackTrace();
		}
				  %>
				 
				      <ol class="seats" type="A">
				       <%if(seats.contains("F1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="F1" name="Business"  value="F1" disabled />
				          <label for="F1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="F1" name="Business"  value="F1" />
				          <label for="F1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("F2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="F2" name="Business"  value="F2" disabled />
				          <label for="F2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="F2" name="Business"  value="F2" />
				          <label for="F2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("F3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="F3" name="Business"  value="F3" disabled />
				          <label for="F3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="F3" name="Business"  value="F3" />
				          <label for="F3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("F4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="F4" name="Business"  value="F4" disabled />
				          <label for="F4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="F4" name="Business"  value="F4" />
				          <label for="F4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("F5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="F5" name="Business"  value="F5" disabled />
				          <label for="F5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="F5" name="Business"  value="F5" />
				          <label for="F5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("F6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="F6" name="Business"  value="F6" disabled />
				          <label for="F6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="F6" name="Business"  value="F6" />
				          <label for="F6">06</label>
				        </li>
				        <%} %>F
				        </ol>
				        
			          <ol class="seats" type="A">
				       <%if(seats.contains("G1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="G1" name="Business"  value="G1" disabled />
				          <label for="G1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="G1" name="Business"  value="G1" />
				          <label for="G1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("G2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="G2" name="Business"  value="G2" disabled />
				          <label for="G2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="G2" name="Business"  value="G2" />
				          <label for="G2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("G3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="G3" name="Business"  value="G3" disabled />
				          <label for="G3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="G3" name="Business"  value="G3" />
				          <label for="G3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("G4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="G4" name="Business"  value="G4" disabled />
				          <label for="G4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="G4" name="Business"  value="G4" />
				          <label for="G4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("G5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="G5" name="Business"  value="G5" disabled />
				          <label for="G5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="G5" name="Business"  value="G5" />
				          <label for="G5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("G6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="G6" name="Business"  value="G6" disabled />
				          <label for="G6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="G6" name="Business"  value="G6" />
				          <label for="G6">06</label>
				        </li>
				        <%} %>G
				        </ol>
				    <ol class="seats" type="A">
				       <%if(seats.contains("H1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="H1" name="Business"  value="H1" disabled />
				          <label for="H1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="H1" name="Business"  value="H1" />
				          <label for="H1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("H2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="H2" name="Business"  value="H2" disabled />
				          <label for="H2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="H2" name="Business"  value="H2" />
				          <label for="H2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("H3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="H3" name="Business"  value="H3" disabled />
				          <label for="H3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="H3" name="Business"  value="H3" />
				          <label for="H3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("H4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="H4" name="Business"  value="H4" disabled />
				          <label for="H4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="H4" name="Business"  value="H4" />
				          <label for="H4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("H5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="H5" name="Business"  value="H5" disabled />
				          <label for="H5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="H5" name="Business"  value="H5" />
				          <label for="H5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("H6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="H6" name="Business"  value="H6" disabled />
				          <label for="H6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="H6" name="Business"  value="H6" />
				          <label for="H6">06</label>
				        </li>
				        <%} %>H
				        </ol>
				         <ol class="seats" type="A">
				        <%if(seats.contains("I1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="I1" name="Business"  value="I1" disabled />
				          <label for="I1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="I1" name="Business"  value="I1" />
				          <label for="I1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("I2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="I2" name="Business"  value="I2" disabled />
				          <label for="I2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="I2" name="Business"  value="I2" />
				          <label for="I2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("I3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="I3" name="Business"  value="I3" disabled />
				          <label for="I3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="I3" name="Business"  value="I3" />
				          <label for="I3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("I4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="I4" name="Business"  value="I4" disabled />
				          <label for="I4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="I4" name="Business"  value="I4" />
				          <label for="I4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("I5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="I5" name="Business"  value="I5" disabled />
				          <label for="I5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="I5" name="Business"  value="I5" />
				          <label for="I5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("I6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="I6" name="Business"  value="I6" disabled />
				          <label for="I6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="I6" name="Business"  value="I6" />
				          <label for="I6">06</label>
				        </li>
				        <%} %>I
				      </ol>
				      <ol class="seats" type="A">
				        <%if(seats.contains("J1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="J1" name="Business"  value="J1" disabled />
				          <label for="J1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="J1" name="Business"  value="J1" />
				          <label for="J1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("J2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="J2" name="Business"  value="J2" disabled />
				          <label for="J2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="J2" name="Business"  value="J2" />
				          <label for="J2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("J3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="J3" name="Business"  value="J3" disabled />
				          <label for="F3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="J3" name="Business"  value="J3" />
				          <label for="J3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("J4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="J4" name="Business"  value="J4" disabled />
				          <label for="J4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="J4" name="Business"  value="J4" />
				          <label for="J4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("J5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="J5" name="Business"  value="J5" disabled />
				          <label for="J5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="J5" name="Business"  value="J5" />
				          <label for="J5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("J6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="J6" name="Business"  value="J6" disabled />
				          <label for="J6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="J6" name="Business"  value="J6" />
				          <label for="J6">06</label>
				        </li>
				        <%} %>J
				       </ol>
				    </div> 
			</div>
					<div class="row">
						<div class="col-5">
							<span class="total-score text-white" id="count"><h6 class="mt-2">Seat : <span class="number">0</span></span></h6>
 						</div>
 	
 						<div class="col-3">
							<input type="button" onclick="return validation()" class="btn btn-primary btn-sm-2 ml-4 verify " value="done">
 						</div>
 					</div>		
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
<script type="text/javascript">
<%		int adult =(Integer.parseInt(request.getParameter("adult")));
%>


		var count=0;
		var prev_numall = 0;
		var numberAll=0;
		const chex = document.querySelectorAll('input[type="checkbox"]:not([disabled])');
		const total = document.querySelector('.total-score .number')
		document.querySelector('.wrapper').addEventListener('change', function(event) {
		numberAll = this.querySelectorAll('input[type="checkbox"]:checked').length
		if(prev_numall != numberAll){
			count=0;
			prev_numall = numberAll;
		}
		total.innerHTML = numberAll
		if(numberAll >= <%= adult%>){
			for(var i=0;i<chex.length;i++)
				{
				if(!chex[i].checked)
					{
					chex[i].disabled= true;
					}
				
				}
			
		}else{
			for(var i=0;i<chex.length;i++)
			{
			if(!chex[i].checked)
				{
				chex[i].disabled= false;
				}
			
			}
		}
		
		const list = event.target.closest('.list')
		const numberList = list.querySelectorAll('input[type="checkbox"]:checked').length
		list.querySelector('.list-score.number').innerHTML = numberList})
</script>
<script type="text/javascript">
		function validation()
		{
			if(numberAll><%=adult%> || numberAll<<%=adult%>){
				alert("Please select only the number of seats you requested.");
				return false;
			}else{
				count++;
			}
		}
</script>
<script type="text/javascript">
		function valid()
		{
			if(count>0){
				return true;
			}else{
				alert("Please press DONE button");
				return false;
			}
		}
</script>


</html>