package TaskManager;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.LinkedList;
import java.util.List;
import java.util.PriorityQueue;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.ui.Model;

import java.util.*;
import java.util.LinkedList;

import javax.servlet.http.HttpSession;

import sun.security.ssl.SSLContextImpl.TLS10Context;
/*
 * Queries to be written in:
 * private getAllTasks()
 * editTask
 * deleteTask
 * startTask
 * stopTask
 * approveTask
 * disapproveTask
 */
public class UserManageTask {
	public class TaskData implements Comparable{
		private Task task;
		private String id;
		
		public TaskData(Task task, String id) {
			this.task= task;
			this.id = id;
		}
		@Override
		public int compareTo(Object arg0) {
			TaskData t = (TaskData)arg0;
			return new Integer(this.task.getPriorty()).compareTo(t.task.getPriorty());
		}
		public Task getTask() {
			return task;
		}
		public void setTask(Task task) {
			this.task = task;
		}
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		
	}
	
	private User user;
	public UserManageTask(User user) {
		this.user = user;
	}
	private LinkedList[] getAllTasks() {
		LinkedList[] list = new LinkedList[2];
		String company = user.getCompany();
		String team = user.getDepartment();
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		List<Task> tlist = session.createQuery("FROM tasklist").list();
		list[0] = new LinkedList<Task>();
		list[1] = new LinkedList<String>();
		for(Task t : tlist) {
			if(t.getTask_company().equals(company) && t.getTeam_assoc().equals(team)){
				list[0].addLast(t);
				list[1].addLast(t.getTask_name());
			}
		}
		return list;
	}
	public  void getAllTasks(HttpSession session) {
		LinkedList[] list = this.getAllTasks();
		LinkedList<Task> tasks = (LinkedList<Task>)list[0];
		LinkedList<String> ids = (LinkedList<String>)list[1];
		LinkedList<TaskData> tid = this.sortByPriority(ids, tasks);
		session.setAttribute("Tasks", tid);
	}
	private LinkedList<TaskData> sortByPriority(LinkedList<String> ids, LinkedList<Task> tasks){
		PriorityQueue<TaskData> pq  = new PriorityQueue<>();
		LinkedList<TaskData> tid = new LinkedList<>();
		for(Task task: tasks) {
			tid.addLast(new TaskData(task, ids.pop()));
		}
		for(TaskData d: tid) {
			pq.add(d);
		}
		tid = new LinkedList<TaskData>();
		while(!pq.isEmpty()) {
			tid.addLast(pq.remove());
		}
		return tid;
	}
	public boolean  deleteTask(String id) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		
		Task task = new Task();
		task = (Task) session.get(Task.class, id);
		
		session.delete(task);
		
		session.getTransaction().commit();
		session.close();
		
		return true;
		
	}
	public Task editTask(String id) {		
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Task task = (Task) session.get(Task.class, id);
		
		if(task.getStatus()) {
			
			return null;
		}else {
			return task;
		}
	}
	public void startTask(String id) {
		Timestamp ts = new Timestamp(Calendar.getInstance().getTimeInMillis());
		String starttime = ts.toString();
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Task task = (Task) session.get(Task.class, id);
		task.setStartTime(starttime);
		session.update(task);
		session.getTransaction().commit();
		sessionFactory.close();
		session.close();
	}
	public void stopTask(String id) {
		Timestamp ts = new Timestamp(Calendar.getInstance().getTimeInMillis());
		String stoptime = ts.toString();
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Task task = (Task) session.get(Task.class, id);
		task.setStopTime(stoptime);
		session.update(task);
		session.getTransaction().commit();
		sessionFactory.close();
		session.close();
	}
	public void approveTask(String id) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Task task = (Task) session.get(Task.class, id);
		task.setStatus(true);
		session.update(task);
		session.getTransaction().commit();
		sessionFactory.close();
		session.close();
	}
	public void disapproveTask(String id) {
		SessionFactory sessionFactory = new Configuration().configure().buildSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		Task task = (Task) session.get(Task.class, id);
		task.setStatus(false);
		session.update(task);
		session.getTransaction().commit();
		sessionFactory.close();
		session.close();
	}
 
}
