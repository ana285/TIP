/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import data.Product;

/**
 *
 * @author Sabina
 */
public class Login {
	
	private static int userID = -1;
	public static List<Product> GreekKitchen;
	public static List<Product> FrenchKitchen;
	public static List<Product> ItalianKitchen;
	public static List<Product> MexicanKitchen;
	
    public static HashMap<Product, Integer> MyCart;
    private static Product currentProduct = new Product();
	
	static {
		FrenchKitchen = servicii.web.ProductServiceApp.getProducts("french");
		GreekKitchen = servicii.web.ProductServiceApp.getProducts("greek");
		ItalianKitchen = servicii.web.ProductServiceApp.getProducts("italian");
		MexicanKitchen = servicii.web.ProductServiceApp.getProducts("mexican");
        MyCart = new HashMap<>();
	}
	  
	public static int getLoggedUserId()
	{
	    return userID;
	}
	   
	public static void putLoggedUserId(int ID)
	{
	   userID = ID;
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
	   
    public static void main(String[] args) {
        // TODO code application logic here
        
    }
    
}
