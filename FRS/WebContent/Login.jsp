
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
<title>Login Page</title>

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
.field-icon{
float:right;
margin-right:-7px;
margin-top:5px;
position:relative;
z-index:2;
cursor:pointer;
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
	color: #FFC312;
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

.shrink {
	padding-top: 0;
	padding-bottom: 0;
	background-color: #212529;
}

.text-intro {
	width: 90%;
	margin: auto;
	text-align: center;
	padding-top: 610px;
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
	height: 30%;
	align-content: center;
}

.card {
	height: 330px;
	margin-top: auto;
	margin-bottom: auto;
	width: 400px;
	background-color: rgba(0, 0, 0, 0.5) !important;
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

.input-group-prepend span {
	width: 50px;
	background-color: #FFC312;
	color: black;
	border: 0 !important;
}

input:focus {
	outline: 0 0 0 0 !important;
	box-shadow: 0 0 0 0 !important;
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
</style>
<body>

	<nav class="navbar navbar-expand-md navbar-dark fixed-top" id="banner">
		<div class="container">
			<!-- Brand -->
			<a class="navbar-brand" style="color:white;"><i class="fas fa-plane"
				style="font-size: 25px; color: #ffc312;"></i>XYZ FLIGHT SERVICES <i class="fas fa-plane"
				style="font-size: 25px; color: #ffc312;"></i></a>

			<!-- Toggler/collapsibe Button -->
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>

			<!-- Navbar links -->
			<div class="collapse navbar-collapse" id="collapsibleNavbar">
				<ul class="navbar-nav ml-auto">

					<li class="nav-item"><a class="nav-link"
						href="http://localhost:9080/FRS/AboutUs.jsp">About us</a></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Helpline </a>
						<div class="dropdown-menu">
							<a class="dropdown-item">080-655412626</a> <a
								class="dropdown-item">xyzflights@helpline.com</a>
						</div></li>
				</ul>
			</div>
		</div>
	</nav>


	<section id="about">
		<div class="container">
			<div class="text-intro">

				<p>Copyright &#x00A9 2019-Wipro Technologies. All rights reserved </p>
			</div>
		</div>
	</section>

	<div class="container">
		<div class="d-flex justify-content-center h-100">
			<div class="card">

				<div class="card-header">

					<h3>Sign In</h3>

				</div>

				<div class="card-body">
					<form action="login" method="post">
					<div style="color:#ff0000;" >${exist}</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user"></i></span>
							</div>
							<input type="text" name="userid" class="form-control"
								placeholder="userid" required>

						</div>
						<div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="password" name="password" class="form-control"
								placeholder="password" id="password-field" required>
								<div class="form-control col-sm-1">
								<span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
								</div>
						</div>
						<div class="form-group">
							<input type="submit" onClick="return Validation()" value="Login"
								class="btn float-right login_btn" name="Login">
						</div>
					</form>
				</div>
				<div class="card-footer">
					<div class="d-flex justify-content-center links">
						Don't have an account?<a
							href="http://localhost:9080/FRS/Register.jsp">Sign Up</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
$(".toggle-password").click(function(){
	
	$(this).toggleClass("fa-eye fa-eye-slash");
	var input = $($(this).attr("toggle"));
	if(input.attr("type")=="password"){
		input.attr("type","text");
	}else{
		input.attr("type","password");
	}
});
</script>
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
	history.pushState(null,null,location.href);
	window.onpopstate=function(){
		history.go(1);
	};
	
</script>


</html>