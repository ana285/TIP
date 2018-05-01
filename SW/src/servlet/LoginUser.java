package servlet;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.Scanner;

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
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.glassfish.jersey.client.ClientConfig;
import org.glassfish.jersey.client.HttpUrlConnectorProvider;
import org.json.JSONException;
import org.json.JSONObject;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

import com.fasterxml.jackson.*;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.module.SimpleModule;

import data.SessionUser;
import data.User;
import data.UserDeserializer;
import data.Encrypt;
/**
 * Servlet implementation class LoginSession
 */
@WebServlet("/LoginUser")
public class LoginUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginUser() {
		super();
		// TODO Auto-generated constructor stub
	}
	private static URI getBaseURI() {
		//TODO change the port to whatever is the server running on
		return UriBuilder.fromUri("http://localhost:8080/SSW/").build();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		resp.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Logam user");
		String email = request.getParameter("LEmail");
		String password = request.getParameter("LPassword");
		//criptam parola
		if (!password.equals(null) && !password.equals("")){
			String hashedpassword = Encrypt.generateHash(password);
			password = hashedpassword;
			if(!email.equals(null) && !email.equals("") ) {
				System.out.println("Logam user bine bine");
				

				ClientConfig config = new ClientConfig();
				Client client = ClientBuilder.newClient(config);
				client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
				WebTarget service = client.target(getBaseURI());
				Response response;
				//response = service.path("rest").path("login").request().accept(MediaType.APPLICATION_XML).post(Entity.entity(user, MediaType.APPLICATION_XML), Response.class);
				//System.out.println(response);
				response = service.path("rest").path("login").path(email).request().accept(MediaType.APPLICATION_JSON).get(Response.class);
				String data = response.readEntity(String.class);
				int status = response.getStatus();
				System.out.println(data);

				if (status==200){
					ObjectMapper mapper = new ObjectMapper();
					SimpleModule module = new SimpleModule("UserDeserializer");
					module.addDeserializer(User.class, new UserDeserializer());
					mapper.registerModule(module);
					User user = new User();
					user = mapper.readValue(data, User.class);
					System.out.println(user.getEmail());
					SessionUser.getInstance().setUser(user);
					
					System.out.println("Logam user checkuim");
					HttpSession session = request.getSession();
					
					session.setAttribute("email", SessionUser.getInstance().getUser().getEmail());
					session.setAttribute("name", SessionUser.getInstance().getUser().getName());
					session.setAttribute("id", SessionUser.getInstance().getUser().getId());
					session.setAttribute("telephone", SessionUser.getInstance().getUser().getTelephone());
					session.setAttribute("address1", SessionUser.getInstance().getUser().getAddress1());
					session.setAttribute("address2", SessionUser.getInstance().getUser().getAddress2());
					session.setAttribute("cart", null);
					session.setAttribute("error", "You are already loged in as: ");
					System.out.println("" + session.getAttribute("telephone"));
					resp.sendRedirect("index.jsp");
				}else{
					System.out.println("Parola incorecta");
					
					HttpSession session = request.getSession();
					session.setAttribute("error", "Incorrect user or password!");
					request.getRequestDispatcher("login.jsp").forward(request, resp);
					
				}
			}
			else{
				request.setAttribute("mesaj", "Fields are mandatory!");
				request.getRequestDispatcher("login.jsp").forward(request, resp);
				
			}
		}
		else {
			request.setAttribute("mesaj", "Pasword is compulsory!");
			request.getRequestDispatcher("index.jsp").forward(request, resp);
			
		}






	}

}
