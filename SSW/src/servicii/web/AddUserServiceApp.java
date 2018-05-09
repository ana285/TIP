package servicii.web;

import Manager.DBManager;
import data.User;

public class AddUserServiceApp {

	
    public static boolean postUser2(User user) {
        boolean response;
        if (DBManager.getinstance().insertUser(user)) {
           response = true;
        } else {
            response = false;
        }        
        return response;
    }
	
	
}
