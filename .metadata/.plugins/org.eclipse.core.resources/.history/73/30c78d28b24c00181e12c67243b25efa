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



import data.User;
import data.Encrypt;

/**
 * Servlet implementation class AddUser
 */

@WebServlet("/AddUser")
public class AddUser extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static URI getBaseURI() {
        //TODO change the port to whatever is the server running on
        return UriBuilder.fromUri("http://localhost:8081/SSW/").build();
    }
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddUser() {
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
		System.out.println("Suuntem in SERVLET :)");
		String name = request.getParameter("SName");
		
		String password = request.getParameter("SPassword");
		if (!password.equals(null) && !password.equals("")){
			String hashedpassword = Encrypt.generateHash(password);
			password = hashedpassword;
		}
		else {
			request.setAttribute("mesaj", "Pasword is compulsory!");
			request.getRequestDispatcher("register.jsp").forward(request, resp);
		}
		
		String email = request.getParameter("SEmail");
		String telephone = request.getParameter("STelephone");
		String address1 = request.getParameter("SAddress");
		String address2 = request.getParameter("SAddress2");
		if (!name.equals(null) && !name.equals("") && !email.equals(null) && !email.equals("") 
				&& !telephone.equals(null) && !telephone.equals("") && !address1.equals(null) && !address1.equals("")){
			User user = new User();
			user.setEmail(email);
			user.setName(name);
			user.setPassword(password);
			user.setTelephone(telephone);
			user.setAddress1(address1);
			user.setAddress2(address2);
			
			ClientConfig config = new ClientConfig();
	        //config.register(Custom);
	        Client client = ClientBuilder.newClient(config);
	        // Next line of code is a workaround for using PATCH
	        // A value of true declares that the client will try to set unsupported HTTP method to java.net.HttpURLConnection via reflection.
	        // PATCH workaround:
	        //    - alternative to client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
	        //    - also allow PATCH to have a response body
	        //    - see user1648865 response from https://stackoverflow.com/questions/17897171/how-to-have-a-patch-annotation-for-jax-rs 
	        client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
			WebTarget service = client.target(getBaseURI());
			Response response;
			
			response = service.path("rest").path("register").request(MediaType.APPLICATION_XML).post(Entity.entity(user, MediaType.APPLICATION_XML), Response.class);
			System.out.println(response.getStatus());
			if(response.getStatus() == 201)
				request.getRequestDispatcher("login.jsp").forward(request, resp);
			else {
				HttpSession session = request.getSession();
				session.setAttribute("error", "This email already exists!");
				request.getRequestDispatcher("register.jsp").forward(request, resp);
			}
		}else{
			request.setAttribute("mesaj", "Fields are mandatory!");
			request.getRequestDispatcher("register.jsp").forward(request, resp);
		}
	}

}