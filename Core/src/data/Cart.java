package data;

import java.util.ArrayList;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
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

	public boolean AddProduct(Product prod)
	{
		OrderProduct product = getOrderProduct(prod.getName());

		if(product != null) {
			boolean canPurcase = true;
			for(int i = 0; i < product.getProduct().getIngredients().size(); ++i)
			{
				int total = product.getProduct().getIngredients().get(i).getTotalQuantity();
				String ingName = product.getProduct().getIngredients().get(i).getName();
				int alreadyTotal = 0;
				System.out.println("Ing name:"+ingName);
				for(int j = 0; j < this.getOrder().size(); ++j)
				{
					System.out.println("\tProd name:"+this.getOrder().get(j).getProduct().getName());
					for(int k = 0; k < this.getOrder().get(j).getProduct().getIngredients().size(); ++k)
					{
						System.out.println("\t\tProd ing name:"+this.getOrder().get(j).getProduct().getIngredients().get(k).getName());
						if(this.getOrder().get(j).getProduct().getIngredients().get(k).getName().equals(ingName))
						{
							alreadyTotal += this.getOrder().get(j).getProduct().getIngredients().get(k).getQuantity() * this.getOrder().get(j).getQuantity();
						}
					}
				}
				System.out.println("Total:" + total);
				System.out.println("Already Total:" + alreadyTotal);
				alreadyTotal += product.getProduct().getIngredients().get(i).getQuantity();
				if((total - alreadyTotal) <= 0)
				{
					canPurcase = false;
					break;
				}
			}
			if(canPurcase == true) {
				product.setQuantity(product.getQuantity() + 1);
				setTotalPrice(getTotalPrice() +product.getProduct().getPrice());
				return true;
			}
		}
		else {
			product = new OrderProduct();
			product.setProduct(prod);
			product.setQuantity(1);	
		
			boolean canPurcase = true;
			for(int i = 0; i < product.getProduct().getIngredients().size(); ++i)
			{
				int total = product.getProduct().getIngredients().get(i).getTotalQuantity();
				String ingName = product.getProduct().getIngredients().get(i).getName();
				int alreadyTotal = 0;
				System.out.println("Ing name:"+ingName);
				for(int j = 0; j < this.getOrder().size(); ++j)
				{
					System.out.println("Prod name:"+this.getOrder().get(j).getProduct().getName());
					for(int k = 0; k < this.getOrder().get(j).getProduct().getIngredients().size(); ++k)
					{
						System.out.println("Prod ing name:"+this.getOrder().get(j).getProduct().getIngredients().get(k).getName());
						if(this.getOrder().get(j).getProduct().getIngredients().get(k).getName().equals(ingName))
						{
							alreadyTotal += this.getOrder().get(j).getProduct().getIngredients().get(k).getQuantity() * this.getOrder().get(j).getQuantity();
						}
					}
				}
				System.out.println("Total:" + total);
				System.out.println("Already Total:" + alreadyTotal);
				alreadyTotal += product.getProduct().getIngredients().get(i).getQuantity();
				if((total - alreadyTotal) <= 0)
				{
					canPurcase = false;
					break;
				}
			}
			if(canPurcase == true) {
				order.add(product);
				setTotalPrice(getTotalPrice() + product.getProduct().getPrice());
				return true;
			}
		}
		System.out.println("Nu mai puteti adauga");
	return false;
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
