package TaskManager;


import java.util.Arrays;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/TeamuserAdd")
public class TeamUserAddController {
	@RequestMapping("/showTUAdd")
	public String showMAdd() {
		return "teamUserAdd";
	}
	@RequestMapping("/processTAD")
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
			Registration register = new UserRegistration("teamUser", data); 
		
			String result = register.register();
			int length = result.length();
			if(length> 0) {
				result = "Errors: " + result;
			}
			model.addAttribute("TURegError", result);
			register.clean();
			data = null;
		
			if(length == 0) {
				return "userDash";
			}
			else { 
				return "teamUserAdd";
			}
		
			
		}
}
