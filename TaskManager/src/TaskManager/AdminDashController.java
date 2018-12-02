package TaskManager;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/Admin")
public class AdminDashController {
	@RequestMapping("/showAdminDash")
	public String showAD(HttpSession session) {
		AdminManageUser amu = new  AdminManageUser((User)session.getAttribute("User"));
		amu.getAllUsers(session);
		return "adminDash";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "loginPage";
	}
	@RequestMapping("/deleteUser")
	public String deleteUsers(@RequestParam("id") String id, HttpSession session) {
		AdminManageUser amu = new  AdminManageUser((User)session.getAttribute("User"));
		amu.deleteUser(id);
		amu.getAllUsers(session);
		return "adminDash";
	}
	@RequestMapping("/profile")
	public String profile() {
		return "profile";
	}
	
}
