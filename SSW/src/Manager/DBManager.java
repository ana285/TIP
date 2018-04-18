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

import data.SessionUser;
import data.User;


public class DBManager {

	private Connection con;
	private Statement st;
	private ResultSet rs;
	PreparedStatement selectUsers;
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


	

}