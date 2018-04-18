package servicii.web;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.UriInfo;

import Manager.DBManager;
import data.User;

import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MultivaluedMap;
import javax.ws.rs.core.Response.Status;

@Path("/login")
public class LoginUserService {
	@POST
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public String postUserStatus(@Context UriInfo uriInfo, User user) {
        System.out.println("Bla2");
        
        if (DBManager.getinstance().checkLoginInfo(user)) {
            return "true";
        } else {
            return "false";
        }
        
    }
	@GET
	@Path("{email}")
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public User getUserID(@PathParam("email") String email) {
        System.out.println("Bla3");
        return DBManager.getinstance().getUserInfo(email);
        
        
    }
}
