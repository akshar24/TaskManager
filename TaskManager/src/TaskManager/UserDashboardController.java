package TaskManager;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/userdashboard")
public class UserDashboardController {

	@RequestMapping("/showUDash")
	public String showUDash(HttpSession session) {
		UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		umt.getAllTasks(session);
		return "userDash";
	}
	@RequestMapping("/deleteTask")
	public String deleteTask(@RequestParam("id") String id, HttpSession session) {
		UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		umt.deleteTask(id);
		umt.getAllTasks(session);
		return "userDash";
	}
	@RequestMapping("/editTask")
	public String editTask(@RequestParam("id") String id, HttpSession session, Model model) {
	 UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
	 Task result = umt.editTask(id);
	 if(result == null) {
		 model.addAttribute("TaskStatusError", "This task has been approved.Changes are not allowed");
		 return "userDash";
	 }else {
		 session.setAttribute("TaskToBeEdited", result);
		 return "taskConfig";
	 }
	}
	@RequestMapping("/startTime")
	public String startTask(@RequestParam("id")String id, HttpSession session) {
		 UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		 umt.startTask(id);
		umt.getAllTasks(session);
		
		return "userDash";
	}
	@RequestMapping("/stopTime")
	public String stopTask(@RequestParam("id")String id, HttpSession session) {
		 UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		  umt.stopTask(id);
		umt.getAllTasks(session);
		
		return "userDash";
	}
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
	 session.invalidate();
	 return "loginPage";
	 }
	@RequestMapping("/approveTask")
	public String approve(@RequestParam("id") String id, HttpSession session) {
		 UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		 umt.approveTask(id);
		 umt.getAllTasks(session);
		 return "userDash";
	}
	@RequestMapping("/disapproveTask")
	public String disapprove(@RequestParam("id") String id, HttpSession session) {
		 UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		 umt.disapproveTask(id);
		 umt.getAllTasks(session);
		 return "userDash";
	}
	@RequestMapping("/profile")
	public String profile() {
		return "userprofile";
	}
}
