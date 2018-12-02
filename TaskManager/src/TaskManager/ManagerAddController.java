package TaskManager;

import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/ManagerAdd")
public class ManagerAddController {
	@RequestMapping("/showManagerAdd")
	public String showMAdd() {
		return "managerAdd";
	}
	@RequestMapping("/processMAD")
	public String addManager(@RequestParam("firstname") String firstname, 
			@RequestParam("lastname") String lastname
			,@RequestParam("title") String title,
			@RequestParam("username") String username,
			@RequestParam("department") String department,
			@RequestParam("workphone") String workphone,
			@RequestParam("email") String email,
			@RequestParam("location") String location,
			@RequestParam("password") String password,
			@RequestParam("repassword") String repassword, Model model, HttpSession session){
			User user = (User)session.getAttribute("User");
			String company = user.getCompany();
			String[] data = {firstname + " " +lastname, workphone, email, location, username, password, title, department, repassword,company};
			Registration register = new UserRegistration("manager", data); 
			String result = register.register();
			int length = result.length();
			if(length> 0) {
				result = "Errors: " + result;
			}
			model.addAttribute("MRegError", result);
			register.clean();
			data = null;
			if(length == 0) {
				return "adminDash";
			}
			else { 
				return "managerAdd";
			}
		
			
		}
}
