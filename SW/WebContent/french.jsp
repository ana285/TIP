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
<link rel="stylesheet" href="css/french.css">
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
						data-toggle="dropdown" href="">French Kitchen <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="mexic.jsp"> &nbsp; Mexican Kitchen </a></li>
							<li><a href="italian.jsp"> &nbsp; Italian Kitchen</a></li>
							<li><a href="greek.jsp"> &nbsp; Greek Kitchen </a></li>
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
							<li><a href=""><span
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
				<img src="images/Coperta9.jpg" alt="Plating" class="img-responsive">
				<div class="carousel-caption">
					<h1>FRANCE - The city of love, fashion and art!</h1>
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
				Bienvenue, 
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
				Bienvenue ! What do you want to eat today?
			</h2>
			<% } %>
		<br />
		<br />
		
		<!-- APPETIZERS -->
		
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Appetizers">Appetizers</h3>
		<hr>
		
		<!-- RATATOUILLE APPETIZER PIZZA -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/1.jpg" alt="RatatouilleAppetizerPizza">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Ratatouille Appetizer Pizza</h4>
					<button id="myBtn1" class="btn3"
						onclick="afisareDetaliiProduse('1')">MORE</button>
					<button id="AddButton1" name="btn1" class="btn3">
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
										Ratatouille Appetizer Pizza</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/1.jpg";
							x[0].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ALSATIAN BACON AND ONION TART -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/2.jpg" alt="AlsatianBaconAndOnionTart">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Alsatian Bacon &amp; Onion Tart</h4>
					<button id="myBtn2" class="btn3"
						onclick="afisareDetaliiProduse('2')">MORE</button>
					<button id="AddButton2" name="btn2" class="btn3">
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
										Alsatian Bacon &amp; Onion Tart</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/2.jpg";
							x[1].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- SALMON RILLETES -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/3.jpg" alt="SalmonRilletes">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Salmon Rilletes</h4>
					<button id="myBtn3" class="btn3" onclick="afisareDetaliiProduse('3')">MORE</button>
					<button id="AddButton3" name="btn3" class="btn3">
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Salmon Rilletes</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/3.jpg";
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
	
		<!-- BLACK BEAN SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/4.jpg" alt="BlackBeanSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Black Bean Soup</h4>
					<button id="myBtn4" class="btn3" onclick="afisareDetaliiProduse(4)">MORE</button>
					<button id="AddButton4" name="btn4" class="btn3">
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
										Black Bean Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/4.jpg";
							x[3].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- FRENCH GARLIC SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/5.jpg" alt="FrenchGarlicSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">French Garlic Soup</h4>
					<button id="myBtn5" class="btn3" onclick="afisareDetaliiProduse(5)">MORE</button>
					<button id="AddButton5" name="btn5" class="btn3">
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">French Garlic Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/5.jpg";
							x[4].style.backgroundImage = "url('" + y + "')";
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- PUMPKIN SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/6.jpg" alt="PumpkinSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Pumpkin Soup</h4>
					<button id="myBtn6" class="btn3" onclick="afisareDetaliiProduse(6)">MORE</button>
					<button id="AddButton6" name="btn6" class="btn3">
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Pumpkin Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/6.jpg";
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
		
		<!-- FRENCH CORN AND RADISH SALAD -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/7.jpg" alt="FrenchCornSalad">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">French Corn &amp; Salad</h4>
					<button id="myBtn7" class="btn3" onclick="afisareDetaliiProduse(7)">MORE</button>
					<button id="AddButton7" name="btn7" class="btn3">
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										French Corn &amp; Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/7.jpg";
							x[6].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- FRENCH ROASTED BEET SALAD  -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/8.jpg" alt="FrenchRoastedBeetSalad">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Greek Pasta Salad</h4>
					<button id="myBtn8" class="btn3" onclick="afisareDetaliiProduse(8)">MORE</button>
					<button id="AddButton8" name="btn8" class="btn3">
						ADD&nbsp;<span class="glyphicon glyphicon-shopping-cart"></span>
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
										French Roasted Beet Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/8.jpg";
							x[7].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- SALAD WITH PINE NUTS -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/9.jpg" alt="SaladWithPineNuts">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Salad with Pine Nuts</h4>
					<button id="myBtn9" class="btn3" onclick="afisareDetaliiProduse(9)">MORE</button>
					<button id="AddButton9" name="btn9" class="btn3">
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
										Salad with Pine Nuts</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/27.jpeg";
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
		
		<!-- STEAK DIANE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/10.jpg" alt="SteakDiane">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Steak Diane</h4>
					<button id="myBtn10" name="btn10" class="btn3"
						onclick="afisareDetaliiProduse(10)">MORE</button>
					<button id="AddButton10" class="btn3">
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
										Steak Diane</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/10.jpg";
							x[9].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- CHICKEN DIJON -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/11.jpg" alt="ChickenDijon">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Chicken Dijon</h4>
					<button id="myBtn11" class="btn3"
						onclick="afisareDetaliiProduse(11)">MORE</button>
					<button id="AddButton11" name="btn11" class="btn3">
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
										Chicken Dijon</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/11.jpg";
							x[10].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- BASQUE-STYLE FISH -->		
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/12.jpg" alt="BaskueStyleFish">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Baskue-Style Fish</h4>
					<button id="myBtn12" class="btn3"
						onclick="afisareDetaliiProduse(12)">MORE</button>
					<button id="AddButton12" name="btn12" class="btn3">
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
										Baskue-Style Fish</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/12.jpg";
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
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Drinks"> Dessert </h3>
		<hr>

		<!-- MOCHA DACQUOISE CAKE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/13.jpg" alt="MochaDacqouiseCake">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mocha Dacqouise Cake</h4>
					<button id="myBtn13" class="btn3"
						onclick="afisareDetaliiProduse(13)">MORE</button>
					<button id="AddButton131" name="btn13" class="btn3">
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Mocha Dacqouise Cake</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/13.jpg";
							x[12].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- MACARONS -->

		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/14.jpg" alt="Macarons">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Macarons</h4>
					<button id="myBtn14" class="btn3"
						onclick="afisareDetaliiProduse(14)">MORE</button>
					<button id="AddButton14" name="btn14" class="btn3">
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
										Macarons</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/14.jpg";
							x[13].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- BUTTER TART WITH BLACKBERRIES -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/15.jpg" alt="ButterTartWithBlackberries">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Butter Tart with Blackberries</h4>
					<button id="myBtn15" class="btn3"
						onclick="afisareDetaliiProduse(15)">MORE</button>
					<button id="AddButton15" name="btn15" class="btn3">
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Butter Tart with Blackberries</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/15.jpg";
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

		<!-- ARNAUD FRENCH 75 -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/16.jpg" alt="ArnaudFrench75">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Arnaud French 75</h4>
					<button id="myBtn16" class="btn3"
						onclick="afisareDetaliiProduse(16)">MORE</button>
					<button id="AddButton16" name="btn16" class="btn3">
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
										Arnaud French 75</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/16.jpg";
							x[15].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ANTEBELLUM MINT JULEP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/17.jpg" alt="AntebellumMintJulep">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Antebellum Mint Julep</h4>
					<button id="myBtn17" class="btn3"
						onclick="afisareDetaliiProduse(17)">MORE</button>
					<button id="AddButton17" name="btn17" class="btn3">
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
										Antebellum Mint Julep</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/17.jpg";
							x[16].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- THE GREEN THUMB -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/french/18.jpg" alt="TheGreenThumb">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">The Green Thumb</h4>
					<button id="myBtn18" class="btn3"
						onclick="afisareDetaliiProduse(18)">MORE</button>
					<button id="AddButton18" name="btn18" class="btn3">
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
										The Green Thumb
										</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/french/18.jpg";
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