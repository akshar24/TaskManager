package TaskManager;

import javax.persistence.*;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Entity(name="userdatabase")
public class User {
	private String name;
	private String role;
	private String workPhone;
	private String workEmail;
	private String location;
	@Id
	private String username;
	private String password;
	private String company;
	private String title;
	private String department;
	public User(String name, String role, String workPhone, String workEmail, String location, String username, String password,
			 String title, String department, String company) {
		this.name = name;
		this.role = role;
		this.workPhone = workPhone;
		this.workEmail = workEmail;
		this.location = location;
		this.username = username;
		this.password = password;
		this.company = company;
		this.title = title;
		this.department = department;
	}
	public User() {}
	public void setFirstName(String fn) {
		name  = fn + " " + name.split(" ")[1];
	}
	public void setLastName(String ln) {
		name = name.split(" ")[0] + " "+ ln;
	}
	public void setworkPhone(String phone) {
		this.workPhone = phone;
		
	}
	public void setworkEmail(String email) {
		this.workEmail = email;			
	}
	public String getFirstName() {
		return name.split(" ")[0];
	}
	public String getName() {
		return name;
	}
	public String getWorkEmail() {
		return workEmail;
	}
	public String getWorkPhone() {
		return workPhone;
	}
	public String getUserName() {
		return username;
	}
	public String getLocation() {
		return location;
	}
	public String getTitle() {
		return title;
	}
	public String getDepartment() {
		return department;
	}
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String c) {
		this.company = c;
	}
	public String getRole() {
		return role;
	}
	public String getPassword() {
		return password;
	}
}
