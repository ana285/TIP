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


@WebServlet("/AddCart")
public class AddCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static URI getBaseURI() {
		//TODO change the port to whatever is the server running on
		return UriBuilder.fromUri("http://localhost:8080/SSW/").build();
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddCart() {
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
		System.out.println("AddCart:doPost: Servlet called");
		String name = request.getParameter("AddButton");

		ClientConfig config = new ClientConfig();
	
		Client client = ClientBuilder.newClient(config);
		
		client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
		WebTarget service = client.target(getBaseURI());
		Response response;

		response = service.path("rest").path("VerifyProduct").path(name).request().accept(MediaType.APPLICATION_JSON).get(Response.class);
		System.out.println(response.getStatus());
		System.out.println(response);
		if(response.getStatus() == 200) {
			String data = response.readEntity(String.class);
			System.out.println(data);
			ObjectMapper mapper = new ObjectMapper();
			SimpleModule module = new SimpleModule("ProductDeserializer");
			module.addDeserializer(Product.class, new ProductDeserializer());
			mapper.registerModule(module);
			Product prod = new Product();
			prod = mapper.readValue(data, Product.class);
			HttpSession session = request.getSession();
			System.out.println(prod.getName());
			
			Cart cart = (Cart) session.getAttribute("cart");
			if(cart == null) {
				cart = new Cart();
			}
			boolean added = cart.AddProduct(prod);
			System.out.println("Produs adaugat in cart");
			session.setAttribute("empty", added);
			session.setAttribute("cart", cart);
			System.out.println("Bine 2");
			
			
			request.getRequestDispatcher((String) session.getAttribute("page")).forward(request, resp);
		}
		else {
			
		}
}
}

