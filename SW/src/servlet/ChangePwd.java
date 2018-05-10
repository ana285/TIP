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
import com.fasterxml.jackson.databind.module.SimpleModule;

import data.Encrypt;
import data.SessionUser;
import data.UpdateUser;
import data.User;
import data.UserDeserializer;

/**
 * Servlet implementation class ChangePwd
 */
@WebServlet("/ChangePwd")
public class ChangePwd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePwd() {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Change Password");

		String email = request.getParameter("VEmail");
		String oldpassword = (String)request.getParameter("VOldPassword");
		String newpassword = (String)request.getParameter("VNewPassword");
		String reppassword = (String)request.getParameter("VRepPassword");
		//criptam parola
		String hashedpassword = Encrypt.generateHash(oldpassword);
		oldpassword = hashedpassword;
		System.out.println(oldpassword);
		String hashedpassword2 = Encrypt.generateHash(newpassword);
		newpassword = hashedpassword2;
		System.out.println(newpassword);
		String hashedpassword3 = Encrypt.generateHash(reppassword);
		reppassword = hashedpassword3;
		HttpSession session = request.getSession();
		UpdateUser user = new UpdateUser();
		user.setEmail(email);
		user.setOldpassword(oldpassword);
		user.setNewpassword(newpassword);
		user.setReppassword(reppassword);
		if(!newpassword.equals(reppassword)) {
			session.setAttribute("error_change", "Check that both New and Repeat Password fields to have the same value!");
			request.getRequestDispatcher("myaccount.jsp").forward(request, resp);
		}else {
			ClientConfig config = new ClientConfig();
			Client client = ClientBuilder.newClient(config);
			client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
			WebTarget service = client.target(getBaseURI());
			Response response;

			response = service.path("rest").path("change").request().post(Entity.entity(user, MediaType.APPLICATION_XML), Response.class);
			String data = response.readEntity(String.class);
			System.out.println("Verificare cu baza de date: "+data);
			if(data.equals("false")) {
				System.out.println("Parola incorecta");
				session = request.getSession();
				session.setAttribute("error_change", "Incorrect password!");
				request.getRequestDispatcher("myaccount.jsp").forward(request, resp);
			}else {

				System.out.println("Login User Response Status: " + response.getStatus());
				session.setAttribute("error_change", "");
				resp.sendRedirect("myaccount.jsp");

			}

		}

	}

}
