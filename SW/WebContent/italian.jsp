<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" session="true"%>
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
<link rel="stylesheet" href="css/italy.css">
<link rel="icon" href="images/logo.ico" type="image/x-icon">
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
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="">Italian Kitchen <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="greek.jsp"> &nbsp; Greek Kitchen </a></li>
							<li><a href="mexic.jsp"> &nbsp; Mexican Kitchen</a></li>
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
									class="glyphicon glyphicon-shopping-cart" data-count="0"></span> &nbsp; My
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
				<img src="images/Coperta7.jpg" alt="Colazione" class="img-responsive">
				<div class="carousel-caption">
					<h1>Colazione at Revenue? </h1>
					<h2>Yes, every monday and tuesday!</h2>
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
				Ciao, 
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
				Ciao ! What do you want to eat today?
			</h2>
			<% } %>
		<br />
		<br />
		
		<!-- APPETIZERS -->
		
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Appetizers">Appetizers</h3>
		<hr>
		
		<!-- RICOTTA AND SCALLION FRITTERS -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/37.png" alt="RicottaAndScallionFritters">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Ricotta &amp; Scallion Fritters </h4>
					<button id="myBtn1" class="btn3"
						onclick="afisareDetaliiProduse('1')">MORE</button>
					<button id="AddButton37" name="btn37" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal1" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Ricotta &amp; Scallion Fritters
										</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/37.png";
							x[0].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- PESTO FOCACCIA -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/38.jpg" alt="PestoFocaccia">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Pesto Focaccia</h4>
					<button id="myBtn2" class="btn3"
						onclick="afisareDetaliiProduse('2')">MORE</button>
					<button id="AddButton38" name="btn37" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal2" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Pesto
										Focaccia</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/38.jpg";
							x[1].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- SCALLOPS WITH PESTO -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/39.jpg" alt="ScallopsWithPesto">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Scallops with Pesto</h4>
					<button id="myBtn3" class="btn3" onclick="afisareDetaliiProduse('3')">MORE</button>
					<button id="AddButton39" name="btn39" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal3" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Scallops
										with Pesto</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/39.jpg";
							x[2].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- SOUP -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Soup">Soup</h3>
		<hr>
	
		<!-- CHICKEPEA AND PASTA PESTO -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/40.jpg" alt="ChickenPosoleSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Chickpea With Pesto</h4>
					<button id="myBtn4" class="btn3" onclick="afisareDetaliiProduse(4)">MORE</button>
					<button id="AddButton40" name="btn40" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal4" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Chickpea With Pesto</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/40.jpg";
							x[3].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- WHITE BEAN SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/41.jpg" alt="WhiteSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">White Bean      
					Soup</h4>
					<button id="myBtn5" class="btn3" onclick="afisareDetaliiProduse(5)">MORE</button>
					<button id="AddButton41" name="btn41" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal5" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">White
										Bean Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/41.jpg";
							x[4].style.backgroundImage = "url('" + y + "')";
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- BREAD AND TOMATO SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/42.jpg" alt="BreadAndTomatoSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Bread &amp; Tomato Soup</h4>
					<button id="myBtn6" class="btn3" onclick="afisareDetaliiProduse(6)">MORE</button>
					<button id="AddButton42" name="btn42" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal6" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Bread &amp; Tomato
										Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/42.jpg";
							x[5].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- SALAD -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Salad"> Salad </h3>
		<hr>
		
		<!-- CAPRESE SALAD -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/43.jpg" alt="CapreseSalad">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7"> Caprese Salad</h4>
					<button id="myBtn7" class="btn3" onclick="afisareDetaliiProduse(7)">MORE</button>
					<button id="AddButton43" name="btn43" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal7" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Caprese
										Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/43.jpg";
							x[6].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- EGG SALAD  -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/44.jpg" alt="EggSalad">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Egg Salad</h4>
					<button id="myBtn8" class="btn3" onclick="afisareDetaliiProduse(8)">MORE</button>
					<button id="AddButton44" name="btn44" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal8" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Egg Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/44.jpg";
							x[7].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ARUGULA AND PINE NUT SALAD -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/45.jpg" alt="ArugulaAndPineNutSalad">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Aragula &amp; Pine Nut Salad</h4>
					<button id="myBtn9" class="btn3" onclick="afisareDetaliiProduse(9)">MORE</button>
					<button id="AddButton45" name="btn45" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal9" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Aragula &amp; Pine Nut Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/45.jpg";
							x[8].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- ENTREES -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Entrees"> Entrees/Main dishes</h3>
		<hr>
		
		<!-- RUGATONI PAJATA ALLA FINTA -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/46.jpg" alt="RugatoniPajataAllaFinta">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Rugatoni Pajata Alla Finta</h4>
					<button id="myBtn10" class="btn3"
						onclick="afisareDetaliiProduse(10)">MORE</button>
					<button id="AddButton46" name="btn46" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal10" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Rugatoni Pajata Alla Finta</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/46.jpg";
							x[9].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- LASAGNA -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/47.jpg" alt="Lasagna">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Lasagna</h4>
					<button id="myBtn11" class="btn3"
						onclick="afisareDetaliiProduse(11)">MORE</button>
					<button id="AddButton47" name="btn47" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal11" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Lasagna</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/47.jpg";
							x[10].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- PIZZA -->		
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/48.jpg" alt="Pizza">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Pizza</h4>
					<button id="myBtn12" class="btn3"
						onclick="afisareDetaliiProduse(12)">MORE</button>
					<button id="AddButton48" name="btn48" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal12" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Pizza</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/48.jpg";
							x[11].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- DESSERT -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Dessert"> Dessert </h3>
		<hr>

		<!-- MILK PUDDING -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/49.jpeg" alt="MilkPudding">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Milk Pudding</h4>
					<button id="myBtn13" class="btn3"
						onclick="afisareDetaliiProduse(13)">MORE</button>
					<button id="AddButton49" name="btn49" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				
				<div id="myModal13" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Milk
										Pudding</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/49.jpeg";
							x[12].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- COFFE GRANITA -->

		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/50.jpg" alt="CoffeGranita">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Coffe Granita</h4>
					<button id="myBtn14" class="btn3"
						onclick="afisareDetaliiProduse(14)">MORE</button>
					<button id="AddButton50" name="btn50" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal14" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Coffe Granita</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/50.jpg";
							x[13].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- LEMON GRANITA -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/51.jpg" alt="LemonGranita">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Lemon Granita</h4>
					<button id="myBtn15" class="btn3"
						onclick="afisareDetaliiProduse(15)">MORE</button>
					<button id="AddButton51" name="btn51" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal15" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">White
										Lemon Granita</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/51.jpg";
							x[14].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- DRINKS -->
		&nbsp;
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Drinks"> Drinks</h3>
		<hr>

		<!-- TRICOLORE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/52.jpg" alt="Tricolore">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Tricolore</h4>
					<button id="myBtn16" class="btn3"
						onclick="afisareDetaliiProduse(16)">MORE</button>
					<button id="AddButton52" name="btn52" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal16" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Tricolore</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/52.jpg";
							x[15].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- STRAWBERRY LASSI -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/53.jpg" alt="StrawberryLassi">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Strawberry Lassi</h4>
					<button id="myBtn17" class="btn3"
						onclick="afisareDetaliiProduse(17)">MORE</button>
					<button id="AddButton53" name="btn53" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal17" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Strawberry Lassi</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/53.jpg";
							x[16].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- CINNAMON HOT CHOCOLATE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/italian/54.jpg" alt="HotChocolate">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Cinnamon Hot Chocolate</h4>
					<button id="myBtn18" class="btn3"
						onclick="afisareDetaliiProduse(18)">MORE</button>
					<button id="AddButton54" name="btn54" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
					</button>
				</div>
				<div id="myModal18" class="modal">
					<div class="modal-content">
						<div class="modal-header">
							<span class="close">&times;</span>
						</div>
						<div class="modal-body">
							<div class="container5">
								<div class="left"></div>
								<div class="right">
									<br />
									<p
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Cinnamon Hot Chocolate</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/italian/54.jpg";
							x[17].style.backgroundImage = "url('" + y + "')";
						</script>
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
</body>
</html>