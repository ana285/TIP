package data;

import java.util.ArrayList;

public class Cart {
	private ArrayList<OrderProduct> order;
	private double totalPrice;
	
	public Cart()
	{
		order = new ArrayList<OrderProduct>();
		setTotalPrice(0);
	}
	
	public void DeleteCart()
	{
		order = null;
		totalPrice = 0;
	}
	public ArrayList<OrderProduct> getOrder(){
		return order;
	}
	public OrderProduct getOrderProduct(String name)
	{
		OrderProduct prod = null;
		for(int i = 0; i < order.size(); ++i)
		{
			if(order.get(i).getProduct().getName().equals(name))
			{
				prod = order.get(i);
			}
		}
		return prod;
	}

	public void AddProduct(Product prod)
	{
		OrderProduct product = getOrderProduct(prod.getName());
		if(null != product)
		{
			product.setQuantity(product.getQuantity() + 1);
			setTotalPrice(getTotalPrice() +product.getProduct().getPrice());
		}
		else 
		{
			product = new OrderProduct();
			product.setProduct(prod);
			product.setQuantity(1);
			order.add(product);
			setTotalPrice(getTotalPrice() + product.getProduct().getPrice());
		}
	}
	
	public void RemoveProduct(Product prod)
	{
		OrderProduct product = getOrderProduct(prod.getName());
		if(null != product)
		{
			if(product.getQuantity() > 1) {
			product.setQuantity(product.getQuantity() - 1);
			setTotalPrice(getTotalPrice() - product.getProduct().getPrice());
		}
		else
		{
			 DeleteProduct(prod.getName());
		}
	}
	}
	
	public void DeleteProduct(String prodName)
	{
		for(int i = 0; i < order.size(); ++i)
		{
			if(order.get(i).getProduct().getName().equals(prodName))
			{
				totalPrice -= order.get(i).getQuantity()*order.get(i).getProduct().getPrice();
				order.remove(i); 
			}
		}
	}

	public double getTotalPrice() {
		double price = Math.round(totalPrice*100.0)/100.0;
		return price;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}

}
