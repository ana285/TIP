package Manager;

import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import data.Ingredient;
import data.OrderProduct;
import data.OrderUser;
import data.Product;
import data.SessionUser;
import data.UpdateUser;
import data.User;


public class DBManager {

	private Connection con;
	private Statement st;
	private ResultSet rs;

	private static DBManager instance = new DBManager();
	private DBManager(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3307/tip", "root", "");
			st = con.createStatement();
		}catch(Exception ex){
			throw new Error(ex);
		}
	}

	public static DBManager getinstance() {
		return instance;
	}

	public boolean checkLoginInfo(User user){
		try{
			String query = "select * from user";
			rs = st.executeQuery(query);
			while(rs.next()){
				String dbName = rs.getString("name");
				String dbPassword = rs.getString("password");
				String dbEmail = rs.getString("email");
				int dbId = rs.getInt("id");
				String dbTelephone = rs.getString("telephone");
				String dbAddress1 = rs.getString("address1");
				String dbAddress2 = rs.getString("address2");

				if(user.getEmail().equals(dbEmail) && user.getPassword().equals(dbPassword))
				{

					//User user = new User();
					SessionUser sessionUser = SessionUser.getInstance();
					user.setId(dbId);
					user.setName(dbName);
					user.setEmail(dbEmail);
					user.setTelephone(dbTelephone);
					user.setAddress1(dbAddress1);
					user.setAddress2(dbAddress2);
					sessionUser.setUser(user);


					return true;
				}
			}

		}catch (Exception ex){
			System.out.println(ex);
		}
		return false;
	}
	
	public boolean checkLogin(UpdateUser user){
		try{
			System.out.println("Check");
			String query = "select * from user";
			rs = st.executeQuery(query);
			while(rs.next()){
				String dbPassword = rs.getString("password");
				String dbEmail = rs.getString("email");
				if(!user.getReppassword().equals(user.getNewpassword())) return false;
				if(user.getEmail().equals(dbEmail) && user.getOldpassword().equals(dbPassword))
				{
					return true;
				}
			}

		}catch (Exception ex){
			System.out.println(ex);
			ex.printStackTrace();
		}
		return false;
	}
	
	public boolean setUserInfo(UpdateUser user) {
		System.out.println(user.getNewpassword()+" "+user.getEmail());
			String sql = "UPDATE user SET password = '"+user.getNewpassword()+"' WHERE email='"+user.getEmail()+"';";
			
			try {
				Statement pstmt = con.createStatement();
				pstmt.executeUpdate(sql);
				return true;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return false;
	}



	public boolean isUserInDatabase(String email) {
		try{
			String query = "select * from user";
			rs = st.executeQuery(query);
			while(rs.next()) {
				String dbEmail = rs.getString("email");
				if(email.equals(dbEmail)) {
					return true;
				}
			}
		}catch (Exception ex){
			System.out.println(ex);
		}
		return false;
	}


	public User getUserInfo(String email)
	{
		try {
			rs = st.executeQuery("select * from user where email = '" + email+"'");
			while (rs.next())
			{
				User user = new User();
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setTelephone(rs.getString("telephone"));
				user.setAddress1(rs.getString("address1"));
				user.setAddress2(rs.getString("address2"));

				return user;
			}
			return null;
		} catch (Exception ex)
		{
			System.out.println(ex);
			return null;
		}
	}

	public boolean insertUser(User user) {
		try{
			if(isUserInDatabase(user.getEmail())) {
				return false;
			}
			String sql = "INSERT INTO user(email, password, name, telephone, address1, address2) VALUES(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, user.getEmail());
			pstmt.setString(2, user.getPassword());
			pstmt.setString(3, user.getName());
			pstmt.setString(4, user.getTelephone());
			pstmt.setString(5, user.getAddress1());
			pstmt.setString(6, user.getAddress2());
			pstmt.executeUpdate();
			return true;

		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
	}

	public ArrayList<Ingredient> getIngredients_List(String productName){
		ArrayList<Ingredient> ingredients = new ArrayList<Ingredient>() ;
		String sql = "SELECT i.name as i_name , ifood.quantity as quantity, i.quantity as totalQuantity FROM ingredients i, ingredients_food ifood, food f "
				+ "WHERE f.id=ifood.id_food AND ifood.id_ingredients=i.id AND f.name=?;";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productName);
			rs = pstmt.executeQuery();

			while(rs.next()) {
				Ingredient ing = new Ingredient();
				String s = rs.getString("i_name");
				int q = rs.getInt("quantity");
				int totalQ = rs.getInt("totalQuantity");
				System.out.println(s + " " + q + " " + totalQ);
				ing.setName(s);
				ing.setQuantity(q);
				ing.setTotalQuantity(totalQ);
				ingredients.add(ing);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ingredients;
	}

	public boolean VerifyProductCanBeInserted(OrderProduct product)
	{
		boolean retVal = true;
		for(int i = 0; i < product.getProduct().getIngredients().size(); ++i)
		{
			String sql = "Select quantity from ingredients where name='" + product.getProduct().getIngredients().get(i) + "';";
			PreparedStatement pstmt;
			try {
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					int q = rs.getInt("quantity");
					if(q < product.getProduct().getIngredients().get(i).getQuantity())
					{
						retVal = false;
					}
				}

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}



		return retVal;
	}

	public ArrayList<Product> getProducts(String kitchen){
		ArrayList<Product> products = new ArrayList<Product>();
		ResultSet rs2;
		String sql = "Select f.name as f_name, f.price, f.image_path, ft.name as ft_name " + 
				"from food f, food_type ft " + 
				"where f.id_food_type=ft.id AND bucatarie='"+kitchen+"';";
		try {
			//PreparedStatement pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, kitchen);
			Statement pstmt = con.createStatement();

			rs2 = pstmt.executeQuery(sql);
			int i=0;
			//rs.last();

			//System.out.println(rs.getRow());
			//rs.beforeFirst();
			while(rs2.next()) {
				System.out.println(i);
				Product pr = new Product();

				pr.setName(rs2.getString("f_name"));
				pr.setImg(rs2.getString("image_path"));
				pr.setPrice(rs2.getDouble("price"));
				pr.setKitchen(kitchen);
				pr.setType(rs2.getString("ft_name"));
				String name = rs2.getString("f_name");
				System.out.println(name);
				pr.setIngredients(getIngredients_List(name));
				products.add(pr);

				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return products;
	}



	public boolean insertOrder(OrderUser order)
	{
		boolean retVal = true;
		System.out.println("insert Order");
		System.out.println(order.getCart().getOrder().size());
		try {
			//inserare comanda
			String sql = "INSERT INTO orders(id_user, price) VALUES(?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);

			User user = getUserInfo(order.getUser().getEmail());
			if(user != null) {

				pstmt.setInt(1, user.getId());
				pstmt.setDouble(2, order.getCart().getTotalPrice());

				pstmt.executeUpdate();
				System.out.println("Inserted in Order");

				ResultSet rs2;
				//preluare id comanda
				sql = "SELECT LAST_INSERT_ID() last;";
				Statement st = con.createStatement();
				rs2 = st.executeQuery(sql);

				while(rs2.next()) {
					int id_order = Integer.parseInt(rs2.getString("last"));

					System.out.println("Id Order: " + id_order);
					System.out.println(order.getCart().getOrder().size());
					//inserare in tabela de legatura order_food
					for(int i = 0; i < order.getCart().getOrder().size(); ++i)
					{
						if(VerifyProductCanBeInserted(order.getCart().getOrder().get(i)))
						{
							Product product = getProduct(order.getCart().getOrder().get(i).getProduct().getName());
							System.out.println("Produs: " + product.getName());
							int id_food = product.getId();
							double amount = product.getPrice() * order.getCart().getOrder().get(i).getQuantity();
							int quantity = order.getCart().getOrder().get(i).getQuantity();
							String sql2 = "INSERT into order_food(id_food, id_order, amount, quantity) VALUES (?,?,?,?)";
							PreparedStatement pstmt2 = con.prepareStatement(sql2);

							pstmt2.setInt(1,id_food);
							pstmt2.setInt(2,id_order);
							pstmt2.setDouble(3, amount);
							pstmt2.setInt(4, quantity);
							pstmt2.executeUpdate();
							System.out.println("Inserted in Order_food "+ id_food + " " + id_order);

							//scadem ingredientele folosite la prdus
							for(int j = 0; j < product.getIngredients().size(); ++j)
							{
								//preluam cantitate actuala din baza de date
								int quant = getIngredientQuantity(product.getIngredients().get(j).getName());
								quant -= product.getIngredients().get(j).getQuantity() * quantity;
								String sql3 = "UPDATE ingredients " + 
										"SET quantity = " + quant + 
										" WHERE name = '" + product.getIngredients().get(j).getName() + "';";
								System.out.println(sql3);
								PreparedStatement pstmt3 = con.prepareStatement(sql3);
								pstmt3.executeUpdate();
							}
						}else {
							retVal = false;
							break;
						}
					}
				}	
			}
			else {
				retVal = false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return retVal;
	}

	public int getIngredientQuantity(String ingredient) throws SQLException
	{
		int quantity = 0;
		String sql = "SELECT quantity FROM ingredients WHERE name= '"+ingredient+"';";
		rs = st.executeQuery(sql);
		while(rs.next()){
			quantity = rs.getInt("quantity");
		}
		return quantity;
	}

	public Product getProduct(String prod){
		Product pr = new Product();
		ResultSet rs2;
		String sql = "Select f.id as id, f.name as f_name, f.bucatarie, f.price, f.image_path, ft.name as ft_name " + 
				"from food f, food_type ft " + 
				"where f.id_food_type=ft.id AND f.name='"+prod+"';";
		try {
			Statement pstmt = con.createStatement();
			rs2 = pstmt.executeQuery(sql);

			if(rs2.next()) {
				pr.setName(rs2.getString("f_name"));
				pr.setImg(rs2.getString("image_path"));
				pr.setPrice(rs2.getDouble("price"));
				pr.setKitchen(rs2.getString("bucatarie"));
				pr.setType(rs2.getString("ft_name"));
				pr.setId(rs2.getInt("id"));
				String name = rs2.getString("f_name");
				System.out.println(name);
				pr.setIngredients(getIngredients_List(name));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("Date produs extrase din baza de date cu succes");
		return pr;
	}

	
	public boolean checkLoginInfoApp(User user, String password){
		try{
			String query = "select * from user";
			rs = st.executeQuery(query);
			while(rs.next()){
				
				String dbPassword = rs.getString("password");
				String dbEmail = rs.getString("email");
				
				System.out.println(user.getEmail() + " " + dbEmail);				
				System.out.println(password + " " + dbPassword);
				
				if(user.getEmail().equals(dbEmail) && password.equals(dbPassword))
				{	
					return true;
				}
			}

		}catch (Exception ex){
			System.out.println(ex);
		}
		return false;
	}
	
	public User getUserInfoApp(int id)
	{
		try {
			rs = st.executeQuery("select * from user where id = " + id + ";");
			while (rs.next())
			{
				User user = new User();
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setId(rs.getInt("id"));
				user.setTelephone(rs.getString("telephone"));
				user.setAddress1(rs.getString("address1"));
				user.setAddress2(rs.getString("address2"));
				
				return user;
			}
			return null;
		} catch (Exception ex)
		{
			System.out.println(ex);
			return null;
		}
	}


}