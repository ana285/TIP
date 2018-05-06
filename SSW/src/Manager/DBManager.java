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

import data.Product;
import data.SessionUser;
import data.User;


public class DBManager {

	private Connection con;
	private Statement st;
	private ResultSet rs;
	
	private static DBManager instance = new DBManager();
	private DBManager(){
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/tip", "root", "");
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

	public ArrayList<String> getIngredients_List(String productName){
		ArrayList<String> ingredients = new ArrayList<String>() ;
		String sql = "SELECT i.name as i_name FROM ingredients i, ingredients_food ifood, food f "
				+ "WHERE f.id=ifood.id_food AND ifood.id_ingredients=i.id AND f.name=?;";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productName);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String s = rs.getString("i_name");
				System.out.println(s);
				ingredients.add(s);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return ingredients;
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
	
	public Product getProduct(String prod){
		Product pr = new Product();
		ResultSet rs2;
		String sql = "Select f.name as f_name, f.bucatarie, f.price, f.image_path, ft.name as ft_name " + 
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
				String name = rs2.getString("f_name");
				System.out.println(name);
				pr.setIngredients(getIngredients_List(name));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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