package data;

public class OrderProduct {
	private Product product;
	private int quantity;
	
	public OrderProduct()
	{
		setQuantity(0);
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
		quantity = 1;
	}
	
}
