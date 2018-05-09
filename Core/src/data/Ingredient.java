package data;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class Ingredient {
	private String name;
	private int quantity;
	private int totalQuantity;
	
	public Ingredient()
	{
		setQuantity(0);
		setName("");
	}
	
	public Ingredient(String name, int quantity)
	{
		this.setName(name);
		this.setQuantity(quantity);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public int getTotalQuantity() {
		return totalQuantity;
	}

	public void setTotalQuantity(int totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
}
