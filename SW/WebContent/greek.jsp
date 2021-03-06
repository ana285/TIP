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
<link rel="stylesheet" href="css/greek.css">
<script src="js/script.js"></script>
</head>

<body onload="loadKitchen('LoadGreek');">
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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="">Greek Kitchen <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="mexic.jsp"> &nbsp; Mexican Kitchen </a></li>
							<li><a href="italian.jsp"> &nbsp; Italian Kitchen</a></li>
							<li><a href="french.jsp"> &nbsp; French Kitchen </a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Food <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#Appetizers"> &nbsp; Appetizers </a></li>
							<li><a href="#Soup"> &nbsp; Soup </a></li>
							<li><a href="#Salad"> &nbsp; Salad </a></li>
							<li><a href="#Entrees"> &nbsp; Entrees </a></li>
							<li><a href="#Dessert"> &nbsp; Dessert </a></li>
							<li><a href="#Drinks"> &nbsp; Drinks </a></li>
						</ul></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">My Account <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<% 
								if(session.getAttribute("email") == null){
							%>
							<li><a href="register.jsp"><span
									class="glyphicon glyphicon-user"></span> &nbsp; Sign Up </a></li>
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-log-in"></span> &nbsp; Log In</a></li>
							<% }
								else
							{ %>
							<li><a href="mycart.jsp"><span
									class="glyphicon glyphicon-shopping-cart" data-count="
									<%Cart cart = (Cart) session.getAttribute("cart");
											if(cart != null){
												int y=0;
												int x = cart.getOrder().size();
												for(int i=0;i<x;++i){
													y+=cart.getOrder().get(i).getQuantity();
												}
												out.println(y);
												}%>"></span> &nbsp; My
									cart </a></li>
							<li><a href="myaccount.jsp"><span
									class="glyphicon glyphicon-home"></span> &nbsp; My account </a></li>
							<li><a href="logout.jsp"><span
									class="glyphicon glyphicon-log-out"></span> &nbsp; Log Out </a></li>
							<% } %>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	
	<div id="myCarousel" class="carousel slide col-lg-12 col-offset-2">
		<div class="carousel-inner">
			<div class="item active">
				<img src="images/Coperta8.jpg" alt="Plating" class="img-responsive">
				<div class="carousel-caption">
					<h1>Zorba Greek Night!</h1>
					<h2>SOON</h2>
				</div>
			</div>
		</div>
		<br />
	</div>

	<div class="container text-center">	
			<%
				if(session.getAttribute("name")!=null){
			%>
			<h2 style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;"> 
				Kalosórisma, 
				<%
				String[] p = session.getAttribute("name").toString().split(" ");
				String nume="";
				for(int i=0;i<p.length;++i)
				{
					nume = nume + p[i].substring(0,1).toUpperCase() + p[i].substring(1).toLowerCase() + " ";
					//out.print(session.getAttribute("name").toString().substring(0,1).toUpperCase() + session.getAttribute("name").toString().substring(1).toLowerCase());			
				}
				out.print(nume);
				%> ! 
				What do you want to eat today?
			</h2>
			<%}
				else {
			%>
			<h2 style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;"> 
				Kalosórisma ! What do you want to eat today?
			</h2>
			<% } %>
		<br />
		<br />
		
		<!-- APPETIZERS -->
		
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Appetizers">Appetizers</h3>
		<hr>
		<div id="Appetizers_div">

		</div>
		
		<!-- SOUP -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Soup">Soup</h3>
		<hr>
		<div id="Soup_div">

		</div>
		
		<!-- SALAD -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Salad"> Salad </h3>
		<hr>
		<div id="Salad_div">

		</div>
		
		<!-- ENTREES -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Entrees"> Entrees/Main dishes</h3>
		<hr>
		<div id="Entrees/MainDishes_div">

		</div>
		
		
		<!-- DESSERT -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Dessert"> Dessert </h3>
		<hr>
		<div id="Dessert_div">

		</div>
		
		
		<!-- DRINKS -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Drinks"> Drinks</h3>
		<hr>
		<div id="Drinks_div">

		<%if (session.getAttribute("empty") != null && (boolean)session.getAttribute("empty") == false ) {
			%>
			<script>
				Alert();
			</script>
			<%
			session.removeAttribute( "empty" );
				}
			%>
		</div>
		<% if( session.getAttribute("email") == null)
			{
			
			%>		
			
			<style type = "text/css">
			
				.btnAdd{
				display: none;
				}
			</style>
			
			<%
			}
		else{
			session.setAttribute("page","greek.jsp");
		}
			%>
		
	</div>
	

	<footer class="container-fluid text-center">
		<div>&copy; TI - PROIECT 2018</div>
	</footer>
</body>
</html>