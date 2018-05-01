package servicii.web;

import java.util.List;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import Manager.DBManager;
import data.Product;


@Path("/VerifyProduct")
public class VerifyProduct {
	@GET
	@Path("{product}")
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public Product getProducts(@PathParam("product") String product) {
        System.out.println("product de la verificare cart");
        return DBManager.getinstance().getProduct(product);      
    }
}