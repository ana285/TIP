package data;

//Singletone class
public class SessionUser {
	
	private static SessionUser instance;
	
	private User user;
	
	// Private Constructor
	
	private SessionUser()
	{
	}
		
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public static SessionUser getInstance ()
	{
		if (instance == null) {
			instance = new SessionUser();
		}
		return instance;
	}
	
	public static void removeInstance ()
	{
		instance = null;
	}
	
}