package servicii.web;
import java.io.IOException;
 import com.fasterxml.jackson.databind.ObjectMapper;

import Manager.DBManager;
import data.OrderUser;

public class AddOrderServiceApp{

    public static String postOrder(String order) throws IOException {
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