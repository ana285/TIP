package servlet;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
import data.Product;
import data.ProductDeserializer;

@WebServlet("/LoadGreek")
public class LoadGreek extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadGreek() {
		super();
		// TODO Auto-generated constructor stub
	}
	private static URI getBaseURI() {
		//TODO change the port to whatever is the server running on
		return UriBuilder.fromUri("http://localhost:8081/SSW/").build();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Greek");
		
		ClientConfig config = new ClientConfig();
		Client client = ClientBuilder.newClient(config);
		client.property(HttpUrlConnectorProvider.SET_METHOD_WORKAROUND, true);
		WebTarget service = client.target(getBaseURI());
		Response response;
		response = service.path("rest").path("product").path("Greek").request().accept(MediaType.APPLICATION_JSON).get(Response.class);
		//ArrayList<HashMap> data = response.readEntity(ArrayList.class);
		String data = response.readEntity(String.class);
		int status = response.getStatus();
		//for(int i=0;i<data.size();i++)
		System.out.println(data);
		//ArrayList<Product> lista = new ArrayList<Product>();
		if (status==200){
			resp.getWriter().append(data);
		
			//for (HashMap item : data) {
//				if(item.get("type")==)
			//	System.out.println(item.get("name"));
				
				//getServletContext().getRequestDispatcher("/WebContent/greek.jsp").forward(request, resp);
				/*ObjectMapper mapper = new ObjectMapper();
				SimpleModule module = new SimpleModule("ProductDeserializer");
				module.addDeserializer(Product.class, new ProductDeserializer());
				mapper.registerModule(module);
				Product product= new Product();
				product = mapper.readValue(item, Product.class);
				System.out.println(product.getName());
				lista.add(product);*/
			//}
		}else {
			
		}
	}
	}


