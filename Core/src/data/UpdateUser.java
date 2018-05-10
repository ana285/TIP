package data;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement
public class UpdateUser {
	private String email;
	private String oldpassword;
	private String newpassword;
	private String reppassword;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getOldpassword() {
		return oldpassword;
	}
	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}
	public String getNewpassword() {
		return newpassword;
	}
	public void setNewpassword(String newpassword) {
		this.newpassword = newpassword;
	}
	public String getReppassword() {
		return reppassword;
	}
	public void setReppassword(String reppassword) {
		this.reppassword = reppassword;
	}
}
