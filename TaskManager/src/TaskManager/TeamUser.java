package TaskManager;
import javax.persistence.*;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
@Component
@Scope("prototype")
@Entity
public class TeamUser extends User {
	//User of type of TeamUser. 
	public TeamUser(String name, String workPhone, String workEmail, String location, String username, String password,
			String title, String department, String company) {
		super(name, "teamuser", workPhone, workEmail, location, username, password, title, department,company);
	}
	public TeamUser() {};
	
}