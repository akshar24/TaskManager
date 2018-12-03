package TaskManager;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;

public class UserRegistration implements Registration {
	
	private User user;
	private String[] passwordToValidate;

	public UserRegistration(String which_user, String data[]) {
		init(which_user, data);
		passwordToValidate = new  String[] {data[5], data[8]};
	}
	
	private Object[] validateData() {

		validateUserRegistration v = new ValidateUserRegistration(user, passwordToValidate[0], passwordToValidate[1]);		
		return new Object[] {v.validationResult(), v};
	}
	@Override
	public String register() {
		Object[] results = validateData();
		boolean result = true;
		ValidateUserRegistration v = (ValidateUserRegistration) results[1];
		if (!result) {
			String errors = "";
			for (String error : v.errors()) {
				errors += error + "\n";
			}
			v.clean();
			return errors;
		} else {
			Session session = null;
			try {
				SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
				session = sessionFactory.openSession();
				session.beginTransaction();
				session.save(user);
				session.getTransaction().commit();
				sessionFactory.close();
				session.close();
			} catch (Exception e) {
				return "Failure";
			}
			v.clean();
			return "";
		}

	}

	@Override
	public void clean() {
		user = null;
		passwordToValidate= null;
	}
	private void init(String which_user, String[] data) {
		ClassPathXmlApplicationContext context = new ClassPathXmlApplicationContext("applicationContext2.xml");
		user = (User) context.getBean(which_user, new Object [] {data[0], data[1], data[2], data[3], data[4], data[5], data[6], data[7], data[9]});
		context.close();
	}
}
