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
<script src="https://code.jquery.com/jquery-2.2.4.js" charset="utf-8"></script>
<link rel="stylesheet" href="css/file.css">
<link rel="stylesheet" href="css/style.css">
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
					<li><a href="greek.jsp">Greek Kitchen</a></li>
					<li><a href="mexic.jsp">Mexican Kitchen</a></li>
					<li><a href="italian.jsp">Italian Kitchen</a></li>
					<li><a href="french.jsp">French Kitchen</a></li>
					<li class="drodown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">My Account <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu">
							<% 
						
						if(session.getAttribute("email") == null){
						%>
							<li><a href="register.jsp"><span
									class="glyphicon glyphicon-user"></span> &nbsp; Sign Up </a></li>
							<li><a href="login.jsp"><span
									class="glyphicon glyphicon-log-in"></span> &nbsp; Log In</a></li>
							<%}
						else
						{
							session.setAttribute("page", "mycart.jsp");
							%>
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
												}%>"></span>
									&nbsp; My cart </a></li>
							<li><a href="myaccount.jsp"><span
									class="glyphicon glyphicon-home"></span> &nbsp; My account </a></li>
							<li><a href="logout.jsp"><span
									class="glyphicon glyphicon-log-out"></span> &nbsp; Log Out </a></li>
							<%} %>
						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container text-center">


		<div class="row">
			<div class="shopping-cart">
				<!-- Title -->
				<h2
					style="font-family: Montsserrat; font-style: italic; font-size: 2.3em;">SHOPPING
					CART</h2>
				<br />
				<br />

				<%
					
					Cart cart = (Cart) session.getAttribute("cart");
				if(cart != null){
					int x = cart.getOrder().size();
					for(int i=0;i<x;++i){
				%>
				
				<!-- Product -->
				<div class="items">
					<div class="buttons">
					<form action="/RemoveClass" method="POST">
						<button type="submit" name="Remove" value="<% out.print(cart.getOrder().get(i).getProduct().getName()); %>" style="background:white; color:black; border:none;">
					      <span class="glyphicon glyphicon-remove" style="color:#551A8B"></span>
					    </button> 
					    </form>
					</div>

					<div class="image">
						<img src="<%out.print(cart.getOrder().get(i).getProduct().getImg()); %>" alt="" /> <!-- TREBUIE LUATA SI IMAGINEA DIN BAZA DE DATE --> 
					</div>

					<div class="description">
						<span><% out.print(cart.getOrder().get(i).getProduct().getName()); %></span> <span><% out.print(cart.getOrder().get(i).getProduct().getKitchen()); %></span>
					</div>

					<div class="quantity">
					<form action="/PlusClass" method="POST">
						<button class="plus-btn" name="Plus" value="<% out.print(cart.getOrder().get(i).getProduct().getName()); %>" type="submit" >
							<span class="glyphicon glyphicon-plus" style="color:#551A8B"></span>
						</button>
					</form>
						<input type="text" id = "<%out.print(cart.getOrder().get(i).getProduct().getName()); %>"name="name" value="<% out.print(cart.getOrder().get(i).getQuantity());%>">
					<form action="/MinusClass" method="POST">	
						<button class="minus-btn" name="Minus" value="<% out.print(cart.getOrder().get(i).getProduct().getName()); %>" type="submit">
							<span class="glyphicon glyphicon-minus" style="color:#551A8B"></span>
						</button>
					</form>
					</div>

					<div class="total-price"><% out.print(cart.getOrder().get(i).getProduct().getPrice()); %></div>
					
				</div>
				
				<%
					}
				%>
				<br/>
				
				<p style="text-align:right; font-size:16px; font-family:Montserrat; font-style:italic;">
					TOTAL : <% out.print(cart.getTotalPrice());%> &nbsp; &nbsp;
				</p>
				<br/>
				<br/>
				<%}else{ %>
				<h2
					style="font-family: Montsserrat; font-style: italic; font-size: 1.6em;">YOUR SHOPPING
					CART IS EMPTY!</h2>
				<% } %>
			</div>
		</div>

	</div>

	<!-- FOOTER TI PROIECT 2018 -->
	<footer class="container-fluid text-center">
		<div>&copy; TI - PROIECT 2018</div>
	</footer>


</body>
</html>