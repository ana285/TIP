<!DOCTYPE html>
<html lang="en">

<head>
<title>Revenue</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

<body>
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
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>


	<div class="container text-center">
		<h2
			style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;">THANK
			YOU FOR BEING OUR CLIENT!</h2>
		<br />
		<br />


		<h4
			style="text-align: center; font-family: Montsserrat; font-style: italic; font-size: 1.6em">PLEASE
			CHECK YOUR DATA!</h4>
		<hr>


		<div class="align1 alignLeft12">
			<form>
				<fieldset>

					<label class="align1" for="VEmail">Email</label>
					<div>
						<input type="email" class="form-control" name="VEmail" id="VEmail"
							readonly>
					</div>

					<br /> <label class="align1" for="VName">Name</label>
					<div>
						<input type="text" class="form-control" name="VName" id="VName"
							readonly>
					</div>


					<br /> <label class="align1" for="VTelephone"
						style="margin-left: 55%">Telephone</label>
					<div>
						<input style="margin-left: 55%" type="text" class="form-control"
							name="VTelephone" id="VTelephone" readonly>
					</div>

				</fieldset>
			</form>
		</div>

		<div class="align1 alignRight12">
			<form>
				<fieldset>


					<label class="align1" for="VAddress">First Address</label>
					<div>
						<input type="text" class="form-control" name="VAddress"
							id="VAddress" readonly>
					</div>

					<br /> <label class="align1" for="VAddress2">Second Address</label>
					<div>
						<input type="text" class="form-control" name="VAddress2"
							id="VAddress2" readonly>
					</div>


				</fieldset>
			</form>

		</div>

	</div>


	<div class="container">
		<hr>
		<div class="row">

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<img src="images/Restaurant.jpg" class="img-responsive" alt="Restaurant">
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<h4 style="text-transform: uppercase;">CONTACT</h4>
				<p style="float: left">If you have a problem with the food, our
					services,delivery guys, please contact us at the following
					addresses and phone numbers:
				</p>
				<p> &#9674; Street Restaurant | 3407 Greystone Drive | Austin MX 78731 | (511) 311-9111</p>
				<p> &#9674; (156) 121-7181</p>
				<p> &#9674; (267) 128-7182</p>
				

			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<img src="images/Facebook.jpg" class="img-responsive" alt="Facebook">
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<h4 style="text-transform: uppercase;">Visit Us</h4>
				<p>Contact us on Facebook and Instagram !</p>
				
				<img src="images/FacebookLogo.png" class="img-responsive" alt="Facebook" width="150">
				<a href="#">www.facebook.com/revenue5</a>
				<br />
				<br />
				<p>
					<img src="images/InstagramLogo.png" class="img-responsive" alt="Instagram" width="150">
					<a href="#">www.instagram.com/revenue5</a>
				</p>
			</div>


		</div>
	</div>


	<footer class="container-fluid text-center">
		<div>&copy; TI - PROIECT 2018</div>
	</footer>
</body>
</html>