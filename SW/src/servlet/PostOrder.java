package servlet;
import java.io.IOException;
import java.net.URI;
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
import com.sun.corba.se.impl.orbutil.ObjectWriter;

import data.Cart;
import data.OrderUser;
import data.User;


@WebServlet("/postOrder")
public class PostOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static URI getBaseURI() {
		//TODO change the port to whatever is the server running on
		return UriBuilder.fromUri("http://localhost:8080/SSW/").build();
	}
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PostOrder() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("SERVLET Post Order:)");
		
		HttpSession session = request.getSession();
		Cart cart2 = (Cart) session.getAttribute("cart");
		String email = (String) session.getAttribute("email");
		User user = new User();
		user.setEmail(email);
		
		OrderUser order = new OrderUser();
		System.out.println("Cart:" + cart2.getOrder().get(0).getProduct().getName());
		order.setCart(cart2);
		System.out.println("Cart2:" + order.getCart().getOrder().size());
		order.setUser(user);	
		
		//OrderUser ????????? Cart [] in Servlet
		com.fasterxml.jackson.databind.ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		String data = ow.writeValueAsString(order);
		System.out.println("My string object:" + data);

		ClientConfig config = new ClientConfig();
        Client client = ClientBuilder.newClient(config);
      
        client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
		WebTarget service = client.target(getBaseURI());
		Response response;

		response = service.path("rest").path("addOrder").request(MediaType.TEXT_PLAIN).post(Entity.entity(data, MediaType.APPLICATION_JSON), Response.class);
		
		System.out.println(response.getStatus());
		System.out.println(response);
		
		if(response.getStatus() == 200) {
			String data2 = response.readEntity(String.class);
			if(data2.equals("true")) {
				System.out.println("Your order was put in place! Thank you for choosing us!");
				session.setAttribute("mesajCart", "Your order was put in place! Thank you for choosing us!");
			}else {
				System.out.println("Your order !");
				session.setAttribute("mesajCart", "We're sorry but you've delayed and someone more hungry than you consumed part of the ingredients for the food you wanted! :(");	
			}
			
		}
		else {
			System.out.println("Something went wrong! Windows type of error XD");
			session.setAttribute("mesajCart", "Something went wrong! Please try again.");
		}
		session.removeAttribute( "cart" );
		System.out.println(session.getAttribute("cart"));
		request.getRequestDispatcher("mycart.jsp").forward(request, resp);
}
}

