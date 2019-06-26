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
								<h6 class="text-white ml-3 mb-0">First Class</h6><br><br>
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
				 
				      <ol class="seats" type="K">
				       <%if(seats.contains("K1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="K1" name="First"  value="K1" disabled />
				          <label for="K1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="K1" name="First"  value="K1" />
				          <label for="K1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("K2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="K2" name="First"  value="K2" disabled />
				          <label for="K2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="K2" name="First"  value="K2" />
				          <label for="K2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("K3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="K3" name="First"  value="K3" disabled />
				          <label for="K3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="K3" name="First"  value="K3" />
				          <label for="K3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("K4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="K4" name="First"  value="K4" disabled />
				          <label for="K4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="K4" name="First"  value="K4" />
				          <label for="K4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("K5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="K5" name="First"  value="K5" disabled />
				          <label for="K5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="K5" name="First"  value="K5" />
				          <label for="K5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("K6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="K6" name="First"  value="K6" disabled />
				          <label for="K6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="K6" name="First"  value="K6" />
				          <label for="K6">06</label>
				        </li>
				        <%} %>K
				        </ol>
				        
			          <ol class="seats" type="K">
				       <%if(seats.contains("L1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="L1" name="First"  value="L1" disabled />
				          <label for="L1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="L1" name="First"  value="L1" />
				          <label for="L1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("L2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="L2" name="First"  value="L2" disabled />
				          <label for="L2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="L2" name="First"  value="L2" />
				          <label for="L2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("L3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="L3" name="First"  value="L3" disabled />
				          <label for="L3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="L3" name="First"  value="L3" />
				          <label for="L3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("L4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="L4" name="First"  value="L4" disabled />
				          <label for="L4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="L4" name="First"  value="L4" />
				          <label for="L4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("L5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="L5" name="First"  value="L5" disabled />
				          <label for="L5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="L5" name="First"  value="L5" />
				          <label for="L5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("L6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="L6" name="First"  value="L6" disabled />
				          <label for="L6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="L6" name="First"  value="L6" />
				          <label for="L6">06</label>
				        </li>
				        <%} %>L
				        </ol>
				    <ol class="seats" type="K">
				       <%if(seats.contains("M1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="M1" name="First"  value="M1" disabled />
				          <label for="M1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="M1" name="First"  value="M1" />
				          <label for="M1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("M2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="M2" name="First"  value="M2" disabled />
				          <label for="M2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="M2" name="First"  value="M2" />
				          <label for="M2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("M3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="M3" name="First"  value="M3" disabled />
				          <label for="M3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="M3" name="First"  value="M3" />
				          <label for="M3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("M4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="M4" name="First"  value="M4" disabled />
				          <label for="M4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="M4" name="First"  value="M4" />
				          <label for="M4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("M5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="M5" name="First"  value="M5" disabled />
				          <label for="M5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="M5" name="First"  value="M5" />
				          <label for="M5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("M6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="M6" name="First"  value="M6" disabled />
				          <label for="M6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="M6" name="First"  value="M6" />
				          <label for="M6">06</label>
				        </li>
				        <%} %>M
				        </ol>  <ol class="seats" type="K">
				        <%if(seats.contains("N1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="N1" name="First"  value="N1" disabled />
				          <label for="N1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="N1" name="First"  value="N1" />
				          <label for="N1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("N2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="N2" name="First"  value="N2" disabled />
				          <label for="N2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="N2" name="First"  value="N2" />
				          <label for="N2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("N3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="N3" name="First"  value="N3" disabled />
				          <label for="N3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="N3" name="First"  value="N3" />
				          <label for="N3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("N4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="N4" name="First"  value="N4" disabled />
				          <label for="N4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="N4" name="First"  value="N4" />
				          <label for="N4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("N5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="N5" name="First"  value="N5" disabled />
				          <label for="N5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="N5" name="First"  value="N5" />
				          <label for="N5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("N6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="N6" name="First"  value="N6" disabled />
				          <label for="N6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="N6" name="First"  value="N6" />
				          <label for="N6">06</label>
				        </li>
				        <%} %>N
				      </ol>
				      <ol class="seats" type="K">
				        <%if(seats.contains("O1")){ %>
				        <li class="seat">
				         <input type="checkbox" id="O1" name="First"  value="O1" disabled />
				          <label for="O1">01</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="O1" name="First"  value="O1" />
				          <label for="O1">01</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("O2")){ %>
				        <li class="seat">
				         <input type="checkbox" id="O2" name="First"  value="O2" disabled />
				          <label for="O2">02</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="O2" name="First"  value="O2" />
				          <label for="O2">02</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("O3")){ %>
				        <li class="seat">
				         <input type="checkbox" id="O3" name="First"  value="O3" disabled />
				          <label for="K3">03</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="O3" name="First"  value="O3" />
				          <label for="O3">03</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("O4")){ %>
				        <li class="seat">
				         <input type="checkbox" id="O4" name="First"  value="O4" disabled />
				          <label for="O4">04</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="O4" name="First"  value="O4" />
				          <label for="O4">04</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("O5")){ %>
				        <li class="seat">
				         <input type="checkbox" id="O5" name="First"  value="O5" disabled />
				          <label for="O5">05</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="O5" name="First"  value="O5" />
				          <label for="O5">05</label>
				        </li>
				        <%} %>
				         <%if(seats.contains("O6")){ %>
				        <li class="seat">
				         <input type="checkbox" id="O6" name="First"  value="O6" disabled />
				          <label for="O6">06</label>
				        </li>
				        <%} 
				       else{%>
				        <li class="seat">
				         <input type="checkbox" id="O6" name="First"  value="O6" />
				          <label for="O6">06</label>
				        </li>
				        <%} %>O
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