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
<link rel="stylesheet" href="css/greek.css">
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
		
		<!-- BITES WITH SUN-DIRED- TOMATO -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/19.jpg" alt="BitesSunDriedTomato">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Bites with Sun-Dried Tomato</h4>
					<button id="myBtn1" class="btn3"
						onclick="afisareDetaliiProduse('1')">MORE</button>
					<button id="AddButton19" name="btn19" class="btn3" onclick="<% 
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
										Bites with Sun-Dried Tomato</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/19.jpg";
							x[0].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- ZUCCHINI PIE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/20.jpg" alt="ZucchiniPie">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Zucchini Pie</h4>
					<button id="myBtn2" class="btn3"
						onclick="afisareDetaliiProduse('2')">MORE</button>
					<button id="AddButton20" name="btn20" class="btn3" onclick="<% 
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
										Zucchini Pie</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/20.jpg";
							x[1].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- GREEK FIRED CHEESE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/21.jpg" alt="GreekFriedCheese">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Greek Fried Cheese</h4>
					<button id="myBtn3" class="btn3" onclick="afisareDetaliiProduse('3')">MORE</button>
					<button id="AddButton21" name="btn21" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Greek Fried Cheese</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/21.jpg";
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
	
		<!-- GREEK EASTER SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/22.jpg" alt="GreekEasterSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Greek Easter Soup</h4>
					<button id="myBtn4" class="btn3" onclick="afisareDetaliiProduse(4)">MORE</button>
					<button id="AddButton22" name="btn22" class="btn3" onclick="<% 
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
										Greek Easter Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/22.jpg";
							x[3].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- AVGOLEMONO -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/23.jpg" alt="Avgolemono">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Avgolemono</h4>
					<button id="myBtn5" class="btn3" onclick="afisareDetaliiProduse(5)">MORE</button>
					<button id="AddButton23" name="btn23" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Avgolemono</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/23.jpg";
							x[4].style.backgroundImage = "url('" + y + "')";
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- ARTICHOCKE AND FAVA STEW -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/24.jpg" alt="ArtichockeAndFavaStew">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Artichocke &amp; Fava Stew</h4>
					<button id="myBtn6" class="btn3" onclick="afisareDetaliiProduse(6)">MORE</button>
					<button id="AddButton24" name="btn24" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Artichocke &amp; Fava Stew</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/24.jpg";
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
		
		<!-- HORIATIKI -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/25.jpg" alt="Horiatiki">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Horiatiki</h4>
					<button id="myBtn7" class="btn3" onclick="afisareDetaliiProduse(7)">MORE</button>
					<button id="AddButton25" name="btn25" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Horiatiki</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/25.jpg";
							x[6].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- GREEK PASTA SALAD  -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/26.jpg" alt="GreekPastaSalad">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Greek Pasta Salad</h4>
					<button id="myBtn8" class="btn3" onclick="afisareDetaliiProduse(8)">MORE</button>
					<button id="AddButton26" name="btn26" class="btn3" onclick="<% 
								if(session.getAttribute("email") == null)
								{%>
									location.href='login.jsp';
								<% }%>
								">
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
										Greek Pasta Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/26.jpg";
							x[7].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- GRILLED ASPARAGUS AND ZUCCHINI -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/27.jpeg" alt="GrilledAsparagusAndZucchini">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Grilled Asparagus &amp; Zucchini</h4>
					<button id="myBtn9" class="btn3" onclick="afisareDetaliiProduse(9)">MORE</button>
					<button id="AddButton27" name="btn27" class="btn3" onclick="<% 
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
										Grilled Asparagus &amp; Zucchini</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/27.jpeg";
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
		
		<!-- GREEK STYLE GARLIC CHICKEN -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/28.jpg" alt="GreekStyleGarlicChicken">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Greek Style Garlic Chicken</h4>
					<button id="myBtn10" class="btn3"
						onclick="afisareDetaliiProduse(10)">MORE</button>
					<button id="AddButton28" name="btn28" class="btn3" onclick="<% 
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
										Greek Style Garlic Chicken</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/28.jpg";
							x[9].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MARINATED GREEK CHICKEN KABOBS -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/29.jpg" alt="MarinatedGreekChickenKabobs">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Marinated Chicken Kabobs</h4>
					<button id="myBtn11" class="btn3"
						onclick="afisareDetaliiProduse(11)">MORE</button>
					<button id="AddButton29" name="btn29" class="btn3" onclick="<% 
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
										Marinated Chicken Kabobs</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/29.jpg";
							x[10].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MELITZANES PAPOUTSAKIA -->		
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/30.jpg" alt="MelitzanesPapoutsakia">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Melitzanes Papoutsakia</h4>
					<button id="myBtn12" class="btn3"
						onclick="afisareDetaliiProduse(12)">MORE</button>
					<button id="AddButton30" name="btn30" class="btn3" onclick="<% 
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
										Melitzanes Papoutsakia</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/30.jpg";
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

		<!-- RHUBARB AND BERRY COMPOTE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/31.jpg" alt="RhubarbAndBerryCompote">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Rhubarb &amp; Berry Compote</h4>
					<button id="myBtn13" class="btn3"
						onclick="afisareDetaliiProduse(13)">MORE</button>
					<button id="AddButton31" name="btn31" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Rhubarb &amp; Berry Compote</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/31.jpg";
							x[12].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- WALNUT SPICE COOKIES -->

		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/32.jpg" alt="WalnutSpiceCookies">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Walnut Spice Cookies</h4>
					<button id="myBtn14" class="btn3"
						onclick="afisareDetaliiProduse(14)">MORE</button>
					<button id="AddButton32" name="btn32" class="btn3" onclick="<% 
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
										Walnut Spice Cookies</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/32.jpg";
							x[13].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- CHEESE PIE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/33.jpg" alt="CheesePie">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Cheese Pie</h4>
					<button id="myBtn15" class="btn3"
						onclick="afisareDetaliiProduse(15)">MORE</button>
					<button id="AddButton33" name="btn33" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">
										Cheese Pie</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/33.jpg";
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

		<!-- SANTORINI SUNRISE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/34.jpg" alt="SantoriniSunrise">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Santorini Sunrise</h4>
					<button id="myBtn16" class="btn3"
						onclick="afisareDetaliiProduse(16)">MORE</button>
					<button id="AddButton34" name="btn34" class="btn3" onclick="<% 
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
										Santorini Sunrise</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/34.jpg";
							x[15].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- NECTAR OF THE ANCIENT -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/35.jpg" alt="NectarOfTheAncient">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Nectar Of The Ancient</h4>
					<button id="myBtn17" class="btn3"
						onclick="afisareDetaliiProduse(17)">MORE</button>
					<button id="AddButton35" name="btn35" class="btn3" onclick="<% 
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
										Nectar Of The Ancient</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/36.jpg";
							x[16].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- RAKOMELO -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/greek/36.jpg" alt="Rakomelo">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Rakomelo</h4>
					<button id="myBtn18" class="btn3"
						onclick="afisareDetaliiProduse(18)">MORE</button>
					<button id="AddButton36" name="btn36" class="btn3" onclick="<% 
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
										Rakomelo
										</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/greek/36.jpg";
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