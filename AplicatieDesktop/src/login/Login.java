/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package login;
import java.util.ArrayList;
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
	
    public static List<Product> MyCart;
    private static Product currentProduct = new Product();
	
	static {
		FrenchKitchen = servicii.web.ProductServiceApp.getProducts("french");
		GreekKitchen = servicii.web.ProductServiceApp.getProducts("greek");
		ItalianKitchen = servicii.web.ProductServiceApp.getProducts("italian");
		MexicanKitchen = servicii.web.ProductServiceApp.getProducts("mexican");
        MyCart = new ArrayList<>();
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
        MyCart.add(prod);
        System.out.println(MyCart.get(MyCart.size()-1).getName());
    }
    
    public static void removeFromCart(int id)
    {
    	MyCart.remove(id);
    }
    
    public static void clearCart()
    {
    	MyCart.clear();
    }
    
    public static double getTotalPrice()
    {
    	double s = 0;
    	for(int i = 0; i < MyCart.size(); i++)
    	{
    		s += MyCart.get(i).getPrice();
    	}
    	return s;
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
