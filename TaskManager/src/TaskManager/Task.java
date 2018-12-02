package TaskManager;

import javax.persistence.*;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Entity(name="tasklist")
public class Task {
	private String startTime;
	
	private int priorty;
	private String stoptime;
	private String desc1;
	private String team_assoc;
	@Id
	private String task_name;
	private String task_company;
	private boolean approved;
	public Task( int priorty, String desc1, String team_assoc, String task_name,
			String task_company) {
		this.startTime = "";
		this.priorty = priorty;
		this.desc1 = desc1;
		this.team_assoc = team_assoc;
		this.task_name = task_name;
		this.task_company = task_company;
		stoptime = "";
		this.approved = false;
	}
	public Task() {};
	public boolean getStatus() {
		return approved;
	}
	public void setStatus(boolean status) {
		this.approved = status;
	}
	public String getStopTime() {
		return stoptime;
	}
	public void setStopTime(String stoptime) {
		this.stoptime = stoptime;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public int getPriorty() {
		return priorty;
	}
	public void setPriorty(int priorty) {
		this.priorty = priorty;
	}
	public String getDesc() {
		return desc1;
	}
	public void setDesc(String desc1) {
		this.desc1 = desc1;
	}
	public String getTeam_assoc() {
		return team_assoc;
	}
	public void setTeam_assoc(String team_assoc) {
		this.team_assoc = team_assoc;
	}
	public String getTask_name() {
		return task_name;
	}
	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}
	public String getTask_company() {
		return task_company;
	}
	public void setTask_company(String task_company) {
		this.task_company = task_company;
	}
	
	
	
}
