package data;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class OrderUser {
	private User user;
	private Cart cart;
	
	public OrderUser() {}
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	

}
