<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" session="true" import="data.Cart"%>
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
<link rel="stylesheet" href="css/style.css">
<link rel="icon" href="images/logo.ico" type="image/x-icon">
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
					<li><a href="greek.jsp">Greek Kitchen</a></li>
					<li><a href="mexic.jsp">Mexican Kitchen</a></li>
					<li><a href="italian.jsp">Italian Kitchen</a></li>
					<li><a href="french.jsp">French Kitchen</a></li>
					<li class="drodown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">My Account <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<%
								if (session.getAttribute("email") == null) {
							%>
							<li><a href="register.jsp"><span
									class="glyphicon glyphicon-user"></span> &nbsp; Sign Up </a></li>
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-log-in"></span> &nbsp; Log In</a></li>
							<%
								} else {
							%>
							<li><a href="mycart.jsp"><span
									class="glyphicon glyphicon-shopping-cart"
									data-count="
<%Cart cart = (Cart) session.getAttribute("cart");
				if (cart != null) {
					int y = 0;
					int x = cart.getOrder().size();
					for (int i = 0; i < x; ++i) {
						y += cart.getOrder().get(i).getQuantity();
					}
					out.println(y);
				}%>"></span>
									&nbsp; My cart </a></li>
							<li><a href="myaccount.jsp"><span
									class="glyphicon glyphicon-home"></span> &nbsp; My account </a></li>
							<li><a href="logout.jsp"><span
									class="glyphicon glyphicon-log-out"></span> &nbsp; Log Out </a></li>
							<%
								}
							%>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- SLIDESHOW -->
	<div id="myCarousel" class="carousel slide col-lg-12 col-offset-2">
		<!-- INDICATORI -->
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<!-- COPERTA -->
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/Coperta1.jpg" alt="Plating" class="img-responsive">
				<div class="carousel-caption">
					<h1>Welcome to Revenue!</h1>
					<br />
					<%
						if (session.getAttribute("email") == null) {
					%>
					<button onclick="location.href='register.jsp'" name="button"
						class="btn btn-default">Create Account</button>
					<%
						}
					%>
				</div>
			</div>

			<div class="item">
				<div class="carousel-caption">
					<h1>Revenue Street Food!</h1>
					<h3>
						<a href="#table" style="text-decoration: none; color: white;">29
							October 2019</a>
					</h3>
					<br />
				</div>
				<img src="images/StreetFood.jpg" alt="Street Food">
			</div>

			<div class="item">
				<img src="images/FourSeasonFourCountries.jpg" alt="Four Countries">
				<div class="carousel-caption">
					<h1>FOUR DIFFERENT COUNTRIES!</h1>
					<h3>FOUR SEASON CUISINE</h3>
				</div>
			</div>

			<!-- CONTROL STANGA-DREAPTA -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
		<br />
	</div>

	<!-- SPECIFIC GRECESC -->
	<div class="container text-center">
		<h2
			style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;">START
			THE DAY WITH US!</h2>
		<br /> <br />

		<div class="row">
			<div class="col-md-6">
				<img src="images/TraditionalGrecesc.jpg" alt="Traditional Grecesc"
					class="img-responsive">
			</div>

			<div class="col-sm-6">
				<h4 style="text-transform: uppercase;">Chicken Souvlaki with
					Pita Bread</h4>
				<br />
				<p>Souvlaki is one of the most popular street foods in Greece
					and for good reason. It's stuffed with well cooked and seasoned
					meat, garnished with a cooling tzatziki sauce, wrapped in a
					delicious crispy pita and best of all? It tastes like heaven!
					Souvlaki stands for "meat-on-a-skewer", however the majority of
					Greeks and especially those from Athens call any type of pita
					wrapped meat a souvlaki, specifying the type of meat and method of
					roasting separately. For example Souvlaki with chicken Gyros or
					Souvlaki with pork Skewers.</p>
				<p>The most important step in making the perfect, traditional
					Greek chicken souvlaki is nothing else but the marinade! For this
					traditional chicken souvlaki recipe, the chicken is first marinated
					to soak up all the wonderful Mediterranean flavours and then
					grilled to high temperature, to get all crunchy, nicely coloured
					and juicy. Select some good quality chicken breasts and season with
					a selection of Greek spices like oregano, coat with extra virgin
					olive oil and lemon juice and flavour with garlic. Marinading your
					chicken souvlaki in the fridge for at least half an hour will allow
					the aromas to infuse the souvlaki and give it the desired flavours.
				</p>
			</div>

		</div>
	</div>

	<!-- SPECIFIC MEXICAN -->
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h4 style="text-transform: uppercase;">Chorizo and Avocado
					Breakfast Tacos</h4>
				<br />
				<p>Tacos for breakfast? You bet!</p>
				<p>Whether you have leftover chorizo from a previous meal, or
					you are just looking for a heartier way to jazz up your morning
					routine, we can't think of a better way to start your day than to
					take this classic Tex-Mex meal from dinner to fuel-powered
					breakfast. It's as simple as adding eggs!</p>
				<p>Perfect for a Cinco de Mayo celebration or a fun weekend
					brunch, you can transform the mundane breakfast of scrambled eggs
					with a few simple and basic ingredients, such as avocados, onions,
					tomatoes, and cheese. Have fun additions like tater tots, sour
					cream, beans, salsa, hot sauce, bacon, and chives, and get your
					kids engaged by creating a build-your-own-taco bar!</p>
				<p>If you're ovo-vegetarian, you can leave out the chorizo (and
					bacon).</p>
			</div>
			<div class="col-md-6">
				<img src="images/TraditionalMexican.jpg" alt="Traditional Mexican"
					class="img-responsive">
			</div>
		</div>
	</div>

	<!-- SPECIFIC FRANCEZ -->
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<img src="images/Macarons.jpg" alt="Macarons" class="img-responsive">
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<h4 style="text-transform: uppercase;">Macarons</h4>
				<p>Macarons are the delicious sweet cookies filled with butter
					cream. Macarons come in many colours so you can distinguish on the
					taste of the filling such as pink for raspberry taste, brown for
					chocolate, yellow for vanilla or lemon, green for pistachio, blue
					for ...blueberry... and mmmh, the French macaroons melt in the
					mouth!</p>
			</div>

			<!-- SPECIFIC ITALIAN -->
			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<img src="images/TraditionalItalian.jpg" alt="Traditional Italian"
					class="img-responsive">
			</div>

			<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
				<h4 style="text-transform: uppercase;">Italian Beef</h4>
				<p>This is a favorite Italian beef recipe , made with a pot
					roast and Italian salad dressing. The pepperoncini adds extra
					flavor to the meat.</p>
				<p>Thicken the liquids to make a sauce for the beef or serve the
					shredded beef with some of the juices and prepared brown gravy.</p>
			</div>
		</div>
	</div>

	<!-- TABELA XML CU DATELE ORGANIZATORICE PENTRU STREET FOOD -->
	<div class="container">
		<div class="row">
			<div class="col-md-6" id="continut">
				<h4 style="text-transform: uppercase;">
					<a id="table" style="color: black;"> Where can you find us ? </a>
				</h4>
				<table id="tabel">
					<tr style="background-color: #551A8B;">
						<th>CITY</th>
						<th>DATE</th>
						<th>LOCATION</th>
						<th>HOUR</th>
					</tr>
				</table>
				<br />
			</div>
			<div class="col-md-6">
				<img src="images/StreetFood1.jpg" alt="Street Food Revenue"
					class="img-responsive">
			</div>
		</div>
	</div>

	<!-- FOOTER TI PROIECT 2018 -->
	<footer class="container-fluid text-center">
		<div>&copy; TI - PROIECT 2018</div>
	</footer>


</body>
</html>