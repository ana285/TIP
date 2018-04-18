<!DOCTYPE html>
<html lang="en">

<head>
<title>Revenue</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/file.css">
<script src="js/script.js"></script>
</head>

<body onload="afisareImagine()">
	<!-- BARA DE NAVIGARE -->
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<img src="images/logo.png" alt="Logo" id="icon"> <img
					src="images/Revenue.png" alt="Revenue" id="icon2">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="#">Greek Kitchen</a></li>
					<li><a href="#">Mexican Kitchen</a></li>
					<li><a href="#">Italian Kitchen</a></li>
					<li><a href="#">French Kitchen</a></li>
					<li class="drodown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">My Account <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="register.jsp"><span
									class="glyphicon glyphicon-user"></span> &nbsp; Sign Up </a></li>
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-log-in"></span> &nbsp; Log In</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-shopping-cart"></span> &nbsp; My
									cart </a></li>
							<li><a href="myaccount.jsp"><span
									class="glyphicon glyphicon-home"></span> &nbsp; My account </a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-log-out"></span> &nbsp; Log Out </a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container text-center">
		<h2
			style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;">CREATE ACCOUNT</h2>
		<br />
		<br />
		<div class="container4">
			<div class="left"></div>
			<div class="right">
				<div class="formBoxRegister">
					<form id="RegisterForm" action="" method="post"
						style="display: block;">

						<!-- SIGN UP EMAIL -->
						<label for="SEmail">Email</label> 
						<input type="email"
							name="SEmail" id="SEmail" tabindex="1" class="form-control"
							placeholder="Fill in with your Email address" value="" required>


						<!-- SIGN UP NAME -->
						<label for="SName">Name</label> 
						<input type="text" name="SName"
							id="SName" tabindex="2" class="form-control"
							placeholder="Fill in with your Name" value="" required>


						<!-- SIGN UP PASSWORD -->
						<label for="SPassword">Password</label> 
						<input type="password"
							name="SPassword" id="SPassword" tabindex="3" class="form-control"
							placeholder="Fill in with your Password" required>


						<!-- SIGN UP TELEPHONE -->
						<label for="STelephone">Telephone</label> 
						<input type="text"
							name="STelephone" id="STelephone" tabindex="4"
							class="form-control"
							placeholder="Fill in with your Telephone number" required>


						<!-- SIGN UP ADDRESS -->
						<label for="SAddress">Address</label> 
						<input type="text"
							name="SAddress" id="SAddress" tabindex="5" class="form-control"
							placeholder="Fill in with your Address" required> 
						
						<label for="SAddress2">Another Address</label> 
						<input type="text"
							name="SAddress2" id="SAddress2" tabindex="6" class="form-control"
							placeholder="Fill in with another Address" required>

						<!-- ERROR MESSAGE -->
						<span id="mesaj"></span>	
		

						<!--SIGN UP SUBMIT  -->
						<input type="submit" name="RegisterSubmit" id="RegisterSubmit"
							tabindex="7" value="Sign Up">


					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="container-fluid text-center">
		<div>&copy; TI - PROIECT 2018</div>
	</footer>

</body>
</html>
