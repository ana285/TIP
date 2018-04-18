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



@Path("/register")
public class AddUserService {
	
	@POST
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public Response postUser(@Context UriInfo uriInfo, User user) {
        System.out.println("Bla");
        Response response;
        if (DBManager.getinstance().insertUser(user)) {
            response = Response.created(uriInfo.getRequestUriBuilder().path(user.getEmail()).build()).entity(user).build();
        } else {
            response = Response.seeOther(uriInfo.getRequestUriBuilder().path(user.getEmail()).build()).build();
        }
        
        return response;
    }
}
