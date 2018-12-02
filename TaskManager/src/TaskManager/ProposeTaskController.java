package TaskManager;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.reactive.config.ResourceHandlerRegistry;

@Controller
@RequestMapping("/Task")
public class ProposeTaskController {
 
	@RequestMapping("/showStartTask")
	public String showST() {
		return "startTask";
	}
	@RequestMapping("/proposeTask")
	public String proposeTask(@RequestParam("task_name") String tname,
			@RequestParam("task_describe") String tdesc,
			@RequestParam("task_priority") String tprior
			, HttpSession session) {
		User user =(User)session.getAttribute("User");
		Registration tg = new TaskRegistration(Integer.parseInt(tprior), tdesc,user.getDepartment(),tname, user.getCompany());
		tg.register();
		tg.clean();
		return "startTask";
	}
	@RequestMapping("/updateTask")
	public String updateTask(
			@RequestParam("task_describe") String tdesc,
			@RequestParam("task_priority") String tprior
			, @RequestParam("id") String id,HttpSession session) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session1 = sessionFactory.openSession();
		session1.beginTransaction();
		Task task1 = (Task) session1.get(Task.class, id);
		task1.setDesc(tdesc);
		task1.setPriorty(Integer.parseInt(tprior));
		session1.update(task1);
		session1.getTransaction().commit();
		UserManageTask umt = new UserManageTask((User)session.getAttribute("User"));
		umt.getAllTasks(session);
		return "userDash";
	}
	
}
