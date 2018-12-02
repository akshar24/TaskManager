<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import ="java.sql.Timestamp" %>
<%@ page import="TaskManager.*" %>
<%@ page import = "java.time.*" %> 
<!DOCTYPE html>
<html>
	<head>
		
		<%
			User user3 = (User)session.getAttribute("User");
			if(user3.getRole().equals("Manager")){
					out.println(" <title>Manager Dashboard 4 Task Management Inc.</title>");
			}else {
					ut.println(" <title>Team User Dashboard 4 Task Management Inc.</title>");
			}
		 %>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		
		
		<!-- styles -->
	
		<!--link href="./bootstrap1.1/css/bootstrap.min.css" rel="stylesheet" media="screen"-->
			<spring:url value = "/resources/bootstrap/css/bootstrap.min.css" var = "main" />
		<!-- styles -->
		
		<spring:url value = "/resources/css/styles.css" var = "styles" />
		
 	   
 	   <spring:url value = "/resources/css/bootstrap-datetimepicker.min.css" var = "date" />
 	   	
	 	<spring:url value = "/resources/jquery/jquery-1.8.3.min.js" var = "jquery" />
	 	<spring:url value = "/resources/bootstrap1.1/js/bootstrap.min.js" var = "bootstrap" />
	 	<spring:url value = "/resources/js/bootstrap-datetimepicker.js" var = "bootstrap1" />
	 	<spring:url value = "/resources/js/locales/bootstrap-datetimepicker.fr.js" var = "bootstrap2" />
	 	<spring:url value = "/resources/Bootstrap-Admin-Theme-prototype/vendors/datatables/dataTables.bootstrap.css" var = "admin" />
		<spring:url value = "/resources/Bootstrap-Admin-Theme-prototype/vendors/datatables/js/jquery.dataTables.min.js" var = "admin1" />
		<spring:url value = "/resources/js/custom.js" var = "custom" />
		<spring:url value = "/resources/Bootstrap-Admin-Theme-prototype/vendors/datatables/dataTables.bootstrap.js" var = "admin2" />
 	   	<spring:url value = "/resources/js/tables.js" var = "table" />
 	   	<spring:url value = "/resources/js/DashJs/strtStpBttn.js" var = "dash" />
 	   <link href="${main}"rel="stylesheet" />
 	   <link href="${styles}"rel="stylesheet" />
 	   <link href="${date}" rel="stylesheet" media="screen" />
	
	
	<link href="${admin}" rel="stylesheet" media="screen">
		<script type="text/javascript" src="${jquery}" charset="UTF-8"></script>
		<script type="text/javascript" src="${bootstrap}"></script>
		<script type="text/javascript" src="${bootstrap1}" charset="UTF-8"></script>
		<script type="text/javascript" src="${bootstrap2}" charset="UTF-8"></script>
 	   <script src="${admin1}"></script>
 	   <script src="${admin2}"></script>
 	   <script src="${custom}"></script>
 	   <script src="${table}"></script>
 	   <script src="${dash}"></script>
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://code.jquery.com/jquery.js"></script>
	<!-- jQuery UI -->
	<script src="https://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<!--script src="bootstrap/js/bootstrap.min.js"></script-->
	</head>
	 
	<body>
		<div class="header">
			 <div class="container">
				<div class="row">
				   <div class="col-md-5">
					  <!-- Logo -->
					  <div class="logo">
					  <%
					  	User user2 = (User)session.getAttribute("User");
					  	if(user2.getRole().equals("Manager")){
					  		out.println(" <h1><a href=\"../userdashboard/showUDash\">Manager Dashboard</a></h1>");
					  	}else {
					  		out.println(" <h1><a href=\"../userdashboard/showUDash\">Team User Dashboard</a></h1>");
					  	}
					  %>
						
					  </div>
				   </div>
				   <div class="col-md-2">
					  <div class="navbar navbar-inverse" role="banner">
						  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
							<ul class="nav navbar-nav">
							  <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
								<ul class="dropdown-menu animated fadeInUp">
								  <li><a href="../userdashboard/profile">Profile</a></li>
								  <li><a href="../userdashboard/logout">Logout</a></li>
								</ul>
							  </li>
							</ul>
						  </nav>
					  </div>
				   </div>
				</div>
			 </div>
		</div>  
	 
		<div class="page-content" vertical-align="left">
			<div class="row">
			  <div class="col-md-2">
				<div class="sidebar content-box" style="display: block;">
					<ul class="nav">
						<!-- Main menu -->
						<li class="current"><a href ="../userdashboard/showUDash"><i class="glyphicon glyphicon-home"></i> Dashboard</a></li>
						<li><a href="../Task/showStartTask"><i class="glyphicon glyphicon-calendar"></i> Propose Task</a></li>
						<% 
							User user = (User)session.getAttribute("User");
							String role = user.getRole();
							if(role.equals("Manager")){
								out.println("<li><a href=\"../TeamuserAdd/showTUAdd\"><i class=\"glyphicon glyphicon-calendar\"></i>Add TeamUser</a></li>");
							}
						%>
						<li><a href="../userdashboard/showUDash"><i class="glyphicon glyphicon-list"></i>Completed Tasks</a></li>
						</li>
					</ul>
				 </div>
				</div>
			<div class="col-md-10">
				<div class="content-box-large">
					<div class="panel-heading">
						<dif class="panel-title">Active Tasks</dif>
					</div>
					<div class="panel-body">
						<p style = "color:red;">${TaskStatusError}</p>
						<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
							<thead>
								<tr>
									<th> Task Id</th>
									<th> Task Priority </th>
									<th>Task Name</th>
									<th>Task Start Time </th>
									<th>Task Stop Time</th>
									<th>Total Time Spent</th>t
									<th> Task Description </th>
									<%
										if(role.equals("Manager")){
											out.println("<th>ApproveTask</th>");
											out.println("<th>DisApproveTask</th>");
										}
									%>
									<th>StartTime</th>
									<th> StopTime</th>
									<th> Delete</th>
									<th> Edit</th>
								</tr>
							</thead>
							<tbody>
								<!--insert data here-->
								<%
									LinkedList<UserManageTask.TaskData> tasks = (LinkedList<UserManageTask.TaskData>)session.getAttribute("Tasks");
									User user1 =  (User)session.getAttribute("User");
									String role1 = user1.getRole();
									for(UserManageTask.TaskData task: tasks){
										out.println("<tr class = \"odd gradeA\">");
										
										String id = task.getId();
										String p = task.getTask().getPriorty() + "";
										String name = task.getTask().getTask_name() + "";
										String st = task.getTask().getStartTime();
										if(st.length() == 0) st = "None";
										String sst = task.getTask().getStopTime();
										if(sst.length() == 0) sst = "None";
										String totaltime = "";
										if(st.equals("None") || sst.equals("None")){
											totaltime = "None";
										}else{
											
											Timestamp ts = Timestamp.valueOf(st);
											Timestamp ts1 = Timestamp.valueOf(sst);
											//making sure startitme or stoptime is not null means not recorded
											//making sure timestamp for start and stop time are not empty and starttime is not less than or equal to stoptime
											if(ts != null && ts1 !=null && ts.compareTo(ts1) <= 0){
												LocalDateTime start = ts.toLocalDateTime();
												LocalDateTime stop = ts1.toLocalDateTime();
												Duration s = Duration.between(start, stop);// duration between startime and stoptime
												long days = (s.toDays() < 0 )? 0: s.toDays();
												long hours = (s.toHours() < 0) ?0:s.toHours();
												long mins = (s.toMinutes() < 0)? 0: s.toMinutes();
												long secs = s.getSeconds() - (mins * 60);
												mins = mins - (hours * 60);
												hours = hours - (24 * days);
												long[] results = {days, hours, mins, secs};
												LocalTime time = (results == null) ? LocalTime.of(0, 0, 0): LocalTime.of((int)results[1], (int)results[2], (int)results[3]);
												String time_duration = (results == null) ? String.format(" %d day(s),  %s:00", 0, time.toString()):String.format(" %d day(s), %s", results[0], time.toString());	
												totaltime  = time_duration;
											}else{
												totaltime = "None";
											}
											
										}
										String desc = task.getTask().getDesc();
										out.println("<td>" + id + "</td>");
										out.println("<td>" + p + "</td>");
										out.println("<td>" + name + "</td>");
										out.println("<td>" + st + "</td>");
										out.println("<td>" + sst+ "</td>");
										out.println("<td>" +totaltime+ "</td>");
										out.println("<td>" + desc + "</td>");
										if(role1.equals("Manager")){
											out.println("<td><form action = \"../userdashboard/approveTask\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">Approve</button></form></td>");
											out.println("<td><form action = \"../userdashboard/disapproveTask\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">DisApprove</button></form></td>");
										}
										
										out.println("<td><form action = \"../userdashboard/startTime\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">StartTask</button></form></td>");
										out.println("<td><form action = \"../userdashboard/stopTime\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">StopTask</button></form></td>");
										out.println("<td><form action = \"../userdashboard/deleteTask\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">Delete</button></form></td>");
										out.println("<td><form action = \"../userdashboard/editTask\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">Edit</button></form></td>");
										
										out.println("</tr>");
										
										
									}
									
									
								%>
								
				
							</tbody>
							</table>
						</div>
					</div>
					</div>
				</div>
			</div>
		</div>
	

    </body>
	
	<footer>
		<div class="container">
		<hr>
			<Strong>Devs: Akshar, Jessica, Tina, Matt, Singh</Strong>
		</div>
	</footer>
	
	<!--<script>
		var mixBut = document.getElementById("mixBut");

		mixBut.addEventListener("click", Start);
		
		function Start(){
				console.log("Started");
				mixBut.removeEventListener("click", Start);
				mixBut.addEventListener("click", Stop);
				mixBut.value = "Stop";
		}
		
		function Stop(){
				console.log("Stopped");
				mixBut.removeEventListener("click", Stop);
				mixBut.addEventListener("click", Start);
				mixBut.value = "Start";
		}
	</script>-->

	<script>
         
        function init() {
             
            var stopwatch1 = new Timer("timerLabel1", "start1");
            document.getElementById("start1").onclick = function(){
                stopwatch1.start();
            }
            /*document.getElementById("reset1").onclick = function(){
                stopwatch1.reset();
            }*/
             
            var stopwatch2 = new Timer("timerLabel2", "start2");
            document.getElementById("start2").onclick = function(){
                stopwatch2.start();
            }
            /*document.getElementById("reset2").onclick = function(){
                stopwatch2.reset();
            }*/
             
            var stopwatch3 = new Timer("timerLabel3", "start3");
            document.getElementById("start3").onclick = function(){
                stopwatch3.start();
            }
           /* document.getElementById("reset3").onclick = function(){
                stopwatch3.reset();
            }*/
             
             
            document.getElementById("moveAllBtn").onclick = function(){
                 
                if (document.getElementById("moveAllBtn").value == 'START') {
                    stopwatch1.status = 0;
                    stopwatch2.status = 0;
                    stopwatch3.status = 0;
                     
                } else {
                    stopwatch1.status = 1;
                    stopwatch2.status = 1;
                    stopwatch3.status = 1;
                }
                 
                stopwatch1.start();
                stopwatch2.start();
                stopwatch3.start();
                 
            }       
             
        }
         
         
        function Timer(timerLabelId, startBtnId) {
            this.status = 0;
            this.time = 0;
            this.timerLabel = document.getElementById(timerLabelId);
            this.startBtn = document.getElementById(startBtnId);
        }
         
        Timer.prototype.start = function() {
             
            if (this.status == 0) {
                this.status = 1;
                this.startBtn.value = "STOP";
                this.count();
                 
            } else {
                this.status = 0;
                this.startBtn.value = "START";
  
            }           
        }
         
        Timer.prototype.count = function() {
             
            if (this.status == 1) {
                var that = this;
                setTimeout(function(){
                    that.time++;
                    that.timerLabel.innerHTML = getTime(this.time);
                    that.count();
                }, 10);
                document.getElementById("moveAllBtn").value = 'STOP';
                 
            } else {
                document.getElementById("moveAllBtn").value = 'START';
            }
        }
         
        /*Timer.prototype.reset = function() {
            this.status = 0;
            this.time = 0;
            this.startBtn.value = "START";
            this.timerLabel.innerHTML = "00:00.00";
        }*/
         
         
        function getTime(time) {
             
        	var t  = 100/60;
            var min = Math.floor(time/t);
            var sec = Math.floor(time/100);
            var mSec = time%100;
             
            if (min < 10) {
                min = "0" + min;
            }
            if (sec >= 60) {
                sec = sec % 60;
            }
            if (sec < 10) {
                sec = "0" + sec;
            }
             
            return (min + ":" + sec + "." + mSec);
             
        }
         
        init();
  
    </script>
</html>