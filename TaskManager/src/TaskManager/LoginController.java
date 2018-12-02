package TaskManager;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Login")
@SessionAttributes("personObj")

public class LoginController {
	
	@RequestMapping("/showLogin")
	public String showLogin() {
		return "loginPage";
	}
	@RequestMapping("/processLogin")
	public String processLogin(@RequestParam("username") String username,
			@RequestParam("password") String password,
			@RequestParam("company") String company_name,
			Model model, HttpSession session) {
		String data[] = {username, password,company_name};
		LoginHandler lh = new LoginHandler(data);
		User user = lh.logInUser(model);
		if(user != null) {
			session.setAttribute("User", user);
			String role = user.getRole();
			if(role.equals("Admin")) {
				AdminManageUser amu = new  AdminManageUser((User)session.getAttribute("User"));
				amu.getAllUsers(session);
				return "adminDash";
			}else if(role.equals("Manager")) {
				UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
				umt.getAllTasks(session);
				return "userDash";
			}else if(role.equals("teamuser")) {
				UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
				umt.getAllTasks(session);
				return "userDash";
			}else {
				return "loginPage";
			}
		}else {
			return "loginPage";
		}
		
	}
	
}
