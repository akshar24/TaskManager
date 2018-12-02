package TaskManager;

import javax.persistence.*;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component
@Scope("prototype")
@Entity
public class Manager extends User {

	//User of type Manager. Inherits functionalities from User class
	public Manager(String name, String workPhone, String workEmail, String location, String username,
			String password, String title, String department, String company) {
		super(name, "Manager", workPhone, workEmail, location, username, password, title, department, company);
	}
	public Manager() {};
	
}