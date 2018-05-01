package servicii.web;
import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import Manager.DBManager;
import data.Product;
import data.User;

import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response.Status;

@Path("/product")
public class ProductService {
	@GET
	@Path("{kitchen}")
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public List<Product> getProducts(@PathParam("kitchen") String kitchen) {
        System.out.println("kitchen");
        return DBManager.getinstance().getProducts(kitchen);
        
        
    }
}
