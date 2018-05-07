package servicii.web;

import java.util.List;

import Manager.DBManager;
import data.Product;

public class ProductServiceApp {
	
	    public static List<Product> getProducts(String kitchen) {
	        System.out.println("kitchen");
	        return DBManager.getinstance().getProducts(kitchen);  
	    }

}
