package TaskManager;

import org.hibernate.*;
import org.hibernate.cfg.Configuration;
import org.hibernate.criterion.Restrictions;
import org.hibernate.mapping.List;
import org.springframework.ui.Model;

public class LoginHandler {
	public String data[];

	public LoginHandler(String[] data) {
		this.data = data;
	}

	public User logInUser(Model model) {
		return login(model);
	}

	private User login(Model model) {
		String given_username = data[0];
		String given_company = data[2];
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		User user = new User();
		boolean is_it_in_db;
		try{
			user = (User) session.get(User.class, data[0]);
			is_it_in_db = true;	
		} catch (Exception e) {
			is_it_in_db = false;
		}
		if(user == null) {
			return null;
		}
		String password_db = user.getPassword();
		String role_db = user.getRole();
		if (!is_it_in_db) {
			model.addAttribute("LoginError", "You are not registered for this product!!");
			return null;
		}

		if (!user.getUserName().equals(given_username)) {
			model.addAttribute("LoginError", "Username/Password is incorrect!");
			return null;
		}
		if (!password_db.equals(data[1])) {
			model.addAttribute("LoginError", "Username/Password is incorrect!");
			return null;
		}
		return user;

	}
}
