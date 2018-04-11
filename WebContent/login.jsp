<!DOCTYPE html>
<html lang="en">

<head>
<title>Revenue</title>
<meta http-equiv="Content-Type"
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

<body onload="tabelXML('xml/table.xml')">
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
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-user"></span> &nbsp; Sign Up </a></li>
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-log-in"></span> &nbsp; Log In</a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-shopping-cart"></span> &nbsp; My
									cart </a></li>
							<li><a href="#"><span
									class="glyphicon glyphicon-log-out"></span> &nbsp; Log Out </a></li>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- AUTHENTIFICATION -->

	<div class="container text-center">
		<h2
			style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;">AUTHENTIFICATION</h2>
		<br />
		<br />
		<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<img src="images/LoginLogo.png" alt="Logo" class="img-responsive">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-6">
								<a href="#" class="active" id="login-form-link">Login</a>
							</div>
							<div class="col-xs-6">
								<a href="#" id="register-form-link">Sign Up</a>
							</div>
						</div>
					</div>


					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">

								<!-- LOGIN PART -->
								<form id="login-form" action="" method="post" role="form"
									style="display: block;">

									<!-- LOGIN EMAIL -->
									<label for="LEmail">Email</label>
									<div class="form-group">
										<input type="text" name="LEmail" id="LEmail" tabindex="1"
											class="form-control" placeholder="Email">
									</div>

									<!-- LOGIN PASSWORD -->
									<label for="LPassword">Password</label>
									<div class="form-group">
										<input type="password" name="LPassword" id="LPassword"
											tabindex="2" class="form-control" placeholder="Password">
									</div>

									<!-- SUBMIT BUTTON -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="LoginSubmit" id="LoginSubmit"
													tabindex="3" class="form-control btn btn-login"
													value="Log In">
											</div>
										</div>
									</div>
								</form>

								<!-- SIGN UP PART -->
								<form id="register-form" action="" method="post" role="form"
									style="display: none;">

									<!-- SIGN UP EMAIL -->
									<label for="SEmail">Email</label>
									<div class="form-group">
										<input type="email" name="SEmail" id="SEmail" tabindex="1"
											class="form-control"
											placeholder="Fill in with your Email address" value="">
									</div>

									<!-- SIGN UP NAME -->
									<label for="SName">Name</label>
									<div class="form-group">
										<input type="text" name="SName" id="SName" tabindex="2"
											class="form-control" placeholder="Fill in with your Name"
											value="">
									</div>

									<!-- SIGN UP PASSWORD -->
									<label for="SPassword">Password</label>
									<div class="form-group">
										<input type="password" name="SPassword" id="SPassword"
											tabindex="3" class="form-control"
											placeholder="Fill in with your Password">
									</div>

									<!-- SIGN UP TELEPHONE -->
									<label for="STelephone">Telephone</label>
									<div class="form-group">
										<input type="text" name="STelephone" id="STelephone"
											tabindex="4" class="form-control"
											placeholder="Fill in with your Telephone number">
									</div>

									<!-- SIGN UP ADDRESS -->
									<label for="SAddress">Address</label>
									<div class="form-group">
										<input type="text" name="SAddress" id="SAddress" tabindex="5"
											class="form-control" placeholder="Fill in with your Address">
									</div>

									<label for="SAddress2">Another Address</label>
									<div class="form-group">
										<input type="text" name="SAddress2" id="SAddress2"
											tabindex="6" class="form-control"
											placeholder="Fill in with another Address">
									</div>

									<!--SIGN UP BUTTON  -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="RegisterSubmit"
													id="RegisterSubmit" tabindex="7"
													class="form-control btn btn-register" value="Sign Up">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>


	<footer class="container-fluid text-center">
		<div>&copy; TI - PROIECT 2018</div>
	</footer>

	<script>
		$(function() {

			$('#login-form-link').click(function(e) {
				$("#login-form").delay(100).fadeIn(100);
				$("#register-form").fadeOut(100);
				$('#register-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});
			$('#register-form-link').click(function(e) {
				$("#register-form").delay(100).fadeIn(100);
				$("#login-form").fadeOut(100);
				$('#login-form-link').removeClass('active');
				$(this).addClass('active');
				e.preventDefault();
			});

		});
	</script>

</body>
</html>