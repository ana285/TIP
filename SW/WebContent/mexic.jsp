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
<link rel="stylesheet" href="css/mexic.css">
<script src="js/script.js"></script>
<link rel="icon" href="images/logo.ico" type="image/x-icon">
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
						data-toggle="dropdown" href="">Mexican Kitchen <span
							class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="greek.jsp"> &nbsp; Greek Kitchen </a></li>
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
				<img src="images/Coperta4.jpg" alt="Plating" class="img-responsive">
				<div class="carousel-caption">
					<h1>Revenue's first death day party!</h1>
					<h2>02 November 2018</h2>
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
				Bienvenida, 
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
				Bienvenida ! What do you want to eat today?
			</h2>
			<% } %>
		<br />
		<br />
		
		<!-- APPETIZERS -->
		
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Appetizers">Appetizers</h3>
		<hr>
		
		<!-- TOFU CHILLI ENCHILADAS -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/55.jpeg" alt="TofuChilliEnchiladas">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Tofu chilli enchiladas</h4>
					<button id="myBtn1" class="btn3"
						onclick="afisareDetaliiProduse('1')">MORE</button>
					<button id="AddButton55" name="btn55" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Tofu
										chilli enchiladas</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/55.jpeg";
							x[0].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MEXICAN CHICKEN WRAP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/56.jpeg" alt="MexicanChickenWrap">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mexican Chicken Wrap</h4>
					<button id="myBtn2" class="btn3"
						onclick="afisareDetaliiProduse('2')">MORE</button>
					<button id="AddButton56" name="btn56" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Mexican
										Chicken Wrap</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/56.jpeg";
							x[1].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- CHICKEN FAJITAS -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/57.jpeg" alt="ChickenFajitas">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Chicken Fajitas</h4>
					<button id="myBtn3" class="btn3" onclick="afisareDetaliiProduse('3')">MORE</button>
					<button id="AddButton57" name="btn57" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Chicken
										Fajitas</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/57.jpeg";
							x[2].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- SOUP -->
		<h3 style="text-transform: uppercase; font-family: 'Montserrat'; font-style: italic;" id="Soup">Soup</h3>
		<hr>
	
		<!-- CHICKEN POSOLE SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/58.jpg" alt="ChickenPosoleSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Chicken Posole Soup</h4>
					<button id="myBtn4" class="btn3" onclick="afisareDetaliiProduse(4)">MORE</button>
					<button id="AddButton58" name="btn58" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Chicken
										Posole Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/58.jpg";
							x[3].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- CHICKEN TORTILLA SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/59.png" alt="ChickenSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Chicken Tortilla      
					Soup</h4>
					<button id="myBtn5" class="btn3" onclick="afisareDetaliiProduse(5)">MORE</button>
					<button id="AddButton59" name="btn59" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Chicken
										Tortilla Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/59.png";
							x[4].style.backgroundImage = "url('" + y + "')";
								</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>


		<!-- MEXICAN CORN-AND-POBLANO SOUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/60.jpg" alt="ChickenPoblanoSoup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Corn &amp; Poblano Soup</h4>
					<button id="myBtn6" class="btn3" onclick="afisareDetaliiProduse(6)">MORE</button>
					<button id="AddButton60" name="btn60" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Corn &amp; Poblano
										Soup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/60.jpg";
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
		
		<!-- MEXICAN BEEF SALAD -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/61.jpeg" alt="nf">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mexican Beef Salad</h4>
					<button id="myBtn7" class="btn3" onclick="afisareDetaliiProduse(7)">MORE</button>
					<button id="AddButton61" name="btn61" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Mexican
										Beef Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/61.jpeg";
							x[6].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MEXICAN CHICKEN SALAD  -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/62.jpeg" alt="nf">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mexican Chicken Salad</h4>
					<button id="myBtn8" class="btn3" onclick="afisareDetaliiProduse(8)">MORE</button>
					<button id="AddButton62" name="btn62" class="btn3" onclick="<% 
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
										Mexican Chicken Salad</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/62.jpeg";
							x[7].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- LAYERED CHRISTMAS DIP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/63.jpg" alt="LayeredChristmasDip">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Layered Christmas Dip</h4>
					<button id="myBtn9" class="btn3" onclick="afisareDetaliiProduse(9)">MORE</button>
					<button id="AddButton63" name="btn63" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Layered Christmas
										Dip</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/63.jpg";
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
		
		<!-- MEXICAN BEANS -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/64.jpeg" alt="MexicanBeans">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mexican Beans</h4>
					<button id="myBtn10" class="btn3"
						onclick="afisareDetaliiProduse(10)">MORE</button>
					<button id="AddButton64" name="btn64" class="btn3" onclick="<% 
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
										Mexican Beans</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/64.jpeg";
							x[9].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MEXICAN BEEF ROAST -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/65.jpeg" alt="MexicanBeefRoast">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mexican Beef Roast</h4>
					<button id="myBtn11" class="btn3"
						onclick="afisareDetaliiProduse(11)">MORE</button>
					<button id="AddButton65" name="btn65" class="btn3" onclick="<% 
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
										Mexican Beef Roast</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/65.jpeg";
							x[10].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- MEXICAN BOWL -->		
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/66.jpg" alt="MexicanBowl">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Mexican Bowl</h4>
					<button id="myBtn12" class="btn3"
						onclick="afisareDetaliiProduse(12)">MORE</button>
					<button id="AddButton66" name="btn66"class="btn3" onclick="<% 
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
										Mexican Bowl</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/66.jpg";
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

		<!-- COCONUT AND STRAWBERRY PERFAIT -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/67.jpeg" alt="StrawberryPerfait">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Strawberry Perfait</h4>
					<button id="myBtn13" class="btn3"
						onclick="afisareDetaliiProduse(13)">MORE</button>
					<button id="AddButton67" name="btn67" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Strawberry
										Perfait</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/67.jpeg";
							x[12].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- SWEET POTATO AND MERINGUE PIE -->

		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/68.jpeg" alt="MeringuePie">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Sweet Potato &amp; Meringue Pie</h4>
					<button id="myBtn14" class="btn3"
						onclick="afisareDetaliiProduse(14)">MORE</button>
					<button id="AddButton68" name="btn68" class="btn3" onclick="<% 
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
										Sweet Potato &amp; Meringue Pie</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/68.jpeg";
							x[13].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- WHITE CHOCOLATE MUD CAKE -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/69.jpeg" alt="MudCake">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">White Chocolate Mud Cake</h4>
					<button id="myBtn15" class="btn3"
						onclick="afisareDetaliiProduse(15)">MORE</button>
					<button id="AddButton69"name="btn69"  class="btn3" onclick="<% 
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
										Chocolate Mud Cake</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/69.jpeg";
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

		<!-- STRAWBERRY VODKA CUP -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/70.jpeg" alt="StrawberryVodkaCup">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Strawberry Vodka Cup</h4>
					<button id="myBtn16" class="btn3"
						onclick="afisareDetaliiProduse(16)">MORE</button>
					<button id="AddButton70" name="btn70" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Strawberry
										Vodka Cup</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/70.jpeg";
							x[15].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- RASPBERRY WINE COCKTAIL -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/71.jpeg" alt="RaspberryWine">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Raspberry Wine Cocktail</h4>
					<button id="myBtn17" class="btn3"
						onclick="afisareDetaliiProduse(17)">MORE</button>
					<button id="AddButton71" name="btn71" class="btn3" onclick="<% 
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
										style="font-family: Montsserrat; text-align: center; font-style: italic; font-size: 1.7em;">Raspberry
										Wine Cocktail</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/71.jpeg";
							x[16].style.backgroundImage = "url('" + y + "')";
						</script>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- STRAWBERRY GIN COCKTAIL -->
		<div class="col-sm-4 thumb">
			<div class="thumbnail">
				<img src="images/mexican/72.jpeg" alt="StrawberryGinCocktail">
				<div class="caption">
					<h4 class="pull-right">$24.99</h4>
					<h4 style="color: #337AB7">Strawberry &amp; Gin Cocktail</h4>
					<button id="myBtn18" class="btn3"
						onclick="afisareDetaliiProduse(18)">MORE</button>
					<button id="AddButton72" name="btn72" class="btn3" onclick="<% 
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
										Strawberry &amp; Gin
										Cocktail</p>
									<br /> <br />
									<p>&nbsp; Ingredients:</p>
								</div>
								<script>
							var x = document.getElementsByClassName("left");
							var y = "images/mexican/72.jpeg";
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