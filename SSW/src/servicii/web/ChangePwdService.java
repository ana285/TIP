package servicii.web;

import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.UriInfo;

import Manager.DBManager;
import data.UpdateUser;
import data.User;

@Path("/change")
public class ChangePwdService {
	@POST
    @Produces({ MediaType.APPLICATION_JSON, MediaType.APPLICATION_XML })
    public String postUserStatus(@Context UriInfo uriInfo, UpdateUser user) {
		
        if (DBManager.getinstance().checkLogin(user)&&DBManager.getinstance().setUserInfo(user)) {
            return "true";
        } else {
            return "false";
        }
        
    }
	
	
}
