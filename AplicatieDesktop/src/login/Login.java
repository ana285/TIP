/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;
import java.net.URI;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.ws.rs.core.UriBuilder;

import data.Product;

/**
 *
 * @author Sabina
 */
public class Login {

	private static int userID = -1;
	private static String email = "";
	private static String name = "";
	private static String telephone = "";
	private static String address1= "";
	private static String address2 = "";
	
	
    public static HashMap<Product, Integer> MyCart;
    private static Product currentProduct = new Product();
	
	static {

        MyCart = new HashMap<>();
	}
	
    public static void addInCart(Product prod)
    {
    	if(MyCart.get(prod)!=null)
        {
    		MyCart.put(prod, MyCart.get(prod)+1);
        }
    	else
    	{
    		MyCart.put(prod, 1);
    	}

    }
    
    public static void removeFromCart(String name)
    {
    	for(Product key: MyCart.keySet())
    	{
    		if(key.getName().equals(name))
    		{
    			int freq = MyCart.get(key);
    			if(freq == 1)
    			{
    				MyCart.remove(key);
    				break;
    			}
    			else
    				MyCart.put(key, freq-1);
    		}
    	}
    }
    
    public static void clearCart()
    {
    	MyCart.clear();
    }
    
    public static double getTotalPrice()
    {
    	double s = 0;
    	int freq;
    	

    	for(Product key: MyCart.keySet())
    	{
    		freq = MyCart.get(key);
    		s += freq*key.getPrice(); 
    	}
    		
    	return Math.floor(s * 100) / 100;
    }
    
    public static void putCurrentProduct(Product p)
    {
    	currentProduct.setImg(p.getImg());
    	currentProduct.setName(p.getName());
    	currentProduct.setIngredients(p.getIngredients());
    }
    
    public static Product getCurrentProduct()
    {
    	return currentProduct;
    }
    
	public static int getUserID() {
		return userID;
	}

	public static void setUserID(int userID) {
		Login.userID = userID;
	}

	public static String getEmail() {
		return email;
	}

	public static void setEmail(String email) {
		Login.email = email;
	}

	public static String getName() {
		return name;
	}

	public static void setName(String name) {
		Login.name = name;
	}

	public static String getTelephone() {
		return telephone;
	}

	public static void setTelephone(String telephone) {
		Login.telephone = telephone;
	}

	public static String getAddress1() {
		return address1;
	}

	public static void setAddress1(String address1) {
		Login.address1 = address1;
	}

	public static String getAddress2() {
		return address2;
	}

	public static void setAddress2(String address2) {
		Login.address2 = address2;
	}
	   
    public static void main(String[] args) {
        // TODO code application logic here
        
    }
    
}
