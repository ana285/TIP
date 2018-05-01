package servlet;
import java.io.IOException;
import java.net.URI;
import java.nio.charset.StandardCharsets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.client.Client;
import javax.ws.rs.client.ClientBuilder;
import javax.ws.rs.client.Entity;
import javax.ws.rs.client.WebTarget;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriBuilder;

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.client.HttpUrlConnectorProvider;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;

import data.Cart;
import data.Encrypt;
import data.OrderProduct;
import data.Product;
import data.ProductDeserializer;
import data.SessionUser;
import data.User;
import data.UserDeserializer;


@WebServlet("/MinusClass")
public class MinusClass extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static URI getBaseURI() {
		//TODO change the port to whatever is the server running on
		return UriBuilder.fromUri("http://localhost:8080/SSW/").build();
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MinusClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("SERVLET Cart remove button :)");
		String name = request.getParameter("Minus");

		HttpSession session = request.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		System.out.println("Bine");
		cart.RemoveProduct(cart.getOrderProduct(name).getProduct());

		session.setAttribute("cart", cart);
		System.out.println("Bine 2");


		request.getRequestDispatcher((String) session.getAttribute("page")).forward(request, resp);
	}
}

