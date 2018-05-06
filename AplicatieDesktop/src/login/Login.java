/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;
import java.io.IOException;
import java.net.URI;
import java.util.ArrayList;

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

import data.Encrypt;
import data.User;
/**
 *
 * @author Sabina
 */
public class Login {
	
	private static int userID = -1;
	//private static ArrayList<String> GreekImages;
	/*static {
		GreekImages = new ArrayList<String>();
		
	}*/
	  
	public static int getLoggedUserId()
	{
	    return userID;
	}
	   
	public static void putLoggedUserId(int ID)
	{
	   userID = ID;
	}
	   
    public static void main(String[] args) {
        // TODO code application logic here
        
        
        
    }
    
}
