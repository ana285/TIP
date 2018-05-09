package servicii.web;
import java.io.IOException;

import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Manager.DBManager;
import data.OrderUser;
import data.Product;

@Path("/addOrder")
public class AddOrderService{
	@POST
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML, MediaType.TEXT_PLAIN })
    public String postOrder(@Context UriInfo uriInfo, String order) throws JsonParseException, JsonMappingException, IOException {
        System.out.println("AddOrder service");
        System.out.println(order);
        
        ObjectMapper mapper = new ObjectMapper();
        OrderUser newOrder = mapper.readValue(order, OrderUser.class);
		System.out.println(newOrder.getUser().getEmail());
		System.out.println("Cartul meu:" + newOrder.getCart().getOrder().size());
        if (DBManager.getinstance().insertOrder(newOrder)) {
        	return "true";
        } else {
        	 return "false";
        }
    }
}
