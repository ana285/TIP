package servicii.web;

import Manager.DBManager;
import data.User;

public class LoginUserServiceApp {
	
	
    public static String postUserStatus2(User user, String password) {
        System.out.println("Bla2");
        
        if (DBManager.getinstance().checkLoginInfoApp(user, password)) {
            return "true";
        } else {
            return "false";
        }
        
    }

    public static User getUserID2(String email) {
        System.out.println("Bla3");
        return DBManager.getinstance().getUserInfo(email);
        
        
    }
    
    public static User getUserID3(int id)
    {
        return DBManager.getinstance().getUserInfoApp(id);
    }

}
