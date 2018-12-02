<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ page import="java.util.*" %>
<%@ page import="TaskManager.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Admin Dashboard 4 Task Management Inc.</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		
		<!-- styles -->
		<spring:url value = "/resources/bootstrap/css/bootstrap.min.css" var = "main" />
		<spring:url value = "/resources/css/styles.css" var = "styles" />
 	   <spring:url value = "/resources/css/bootstrap-datetimepicker.min.css" var = "date" />
	 	<spring:url value = "/resources/jquery/jquery-1.8.3.min.js" var = "jquery" />
	 	<spring:url value = "/resources/bootstrap1.1/js/bootstrap.min.js" var = "bootstrap" />
	 	
		<script type="text/javascript" src="${jquery}" charset="UTF-8"></script>
		<script type="text/javascript" src="${bootstrap}"></script>
 	   <link href="${main}"rel="stylesheet" />
 	   <link href="${styles}"rel="stylesheet" />
 	   <link href="${date}" rel="stylesheet" media="screen" />
	</head>
	
	<body>
		<div class="header">
			 <div class="container">
				<div class="row">
				   <div class="col-md-5">
					  <!-- Logo -->
					  <div class="logo">
						 <h1><a href="../Admin/showAdminDash">Admin Dashboard</a></h1>
					  </div>
				   </div>
				   <div class="col-md-2">
					  <div class="navbar navbar-inverse" role="banner">
						  <nav class="collapse navbar-collapse bs-navbar-collapse navbar-right" role="navigation">
							<ul class="nav navbar-nav">
							  <li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown">My Account <b class="caret"></b></a>
								<ul class="dropdown-menu animated fadeInUp">
								  <li><a href="../Admin/profile">Profile</a></li>
								  <li><a href="../Admin/logout">Logout</a></li>
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
						<li class="current"><a href ="../Admin/showAdminDash"><i class="glyphicon glyphicon-home"></i> Dashboard</a></li>
						<li><a href="../ManagerAdd/showManagerAdd"><i class="glyphicon glyphicon-eject"></i> Add Manager</a></li>
						
					</ul>
				 </div>
				</div>
				<div class="container">
					<div class="col-md-13">
						<div class="content-box-large">
							<div class="panel-heading">
								<dif class="panel-title">List of Managers</dif>
							</div>
							<div class="panel-body">
								<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
							<thead>
							<!--  * String name, String role, String workPhone, String workEmail, String location, String username,
			 String title, String department, String company -->
								<tr>
									<th>User Id</th>
									<th>Name</th>
									<th>Role</th>
									<th>WorkPhone</th>
									<th>WorkEmail</th>
									<th>Location</th>
									<th>UserName</th>
									<th>Title</th>
									<th>Department/Team</th>
									<th>Company</th>
									<th> Delete</th>
									
								</tr>
							</thead>
							<tbody>
								<!--insert data here-->
								<% 
									LinkedList<AdminManageUser.UserData> managers= (LinkedList<AdminManageUser.UserData>)session.getAttribute("AllManagers");
				
									for(AdminManageUser.UserData user: managers){
										out.println("<tr class = \"odd gradeA\">");
										
										String id = user.getId();
										String name = user.getUser().getName();
										String role =user.getUser().getRole(); 
										
										String phone = user.getUser().getWorkPhone();
										String email = user.getUser().getWorkEmail();
										String loc = user.getUser().getLocation();
										String uname = user.getUser().getUserName();
										String title = user.getUser().getTitle();
										String team = user.getUser().getDepartment();
										String company = user.getUser().getCompany();
										out.println("<td>" + id + "</td>");
										out.println("<td>" + name + "</td>");
										out.println("<td>" + role + "</td>");
										out.println("<td>" + phone+ "</td>");
										out.println("<td>" + email + "</td>");
										out.println("<td>" + loc + "</td>");
										out.println("<td>" + uname + "</td>");
										out.println("<td>" + title + "</td>");
										out.println("<td>" + team + "</td>");
										out.println("<td>" + company + "</td>");
										
				
										out.println("<td><form action = \"../Admin/deleteUser\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">Delete</button></form></td>");
										out.println("</tr>");
										
										
									}
									
									
								%>
								
				
							</tbody>
							</table>
							
							
							
							
							
							</div>
						</div>
					</div>
					<div class="col-md-13">
						<div class="content-box-large">
							<div class="panel-heading">
								<dif class="panel-title">List of Users</dif>
							</div>
							<div class="panel-body">
															<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered" id="example">
							<thead>
							<!--  * String name, String role, String workPhone, String workEmail, String location, String username,
			 String title, String department, String company -->
								<tr>
									<th>User Id</th>
									<th>Name</th>
									<th>Role</th>
									<th>WorkPhone</th>
									<th>WorkEmail</th>
									<th>Location</th>
									<th>UserName</th>
									<th>Title</th>
									<th>Department/Team</th>
									<th>Company</th>
									<th> Delete</th>
									
								</tr>
							</thead>
							<tbody>
								<!--insert data here-->
								<% 
									LinkedList<AdminManageUser.UserData> tusers= (LinkedList<AdminManageUser.UserData>)session.getAttribute("AllTeamUsers");
				
									for(AdminManageUser.UserData user: tusers){
										out.println("<tr class = \"odd gradeA\">");
										
										String id = user.getId();
										String name = user.getUser().getName();
										String role =user.getUser().getRole(); 
										
										String phone = user.getUser().getWorkPhone();
										String email = user.getUser().getWorkEmail();
										String loc = user.getUser().getLocation();
										String uname = user.getUser().getUserName();
										String title = user.getUser().getTitle();
										String team = user.getUser().getDepartment();
										String company = user.getUser().getCompany();
										out.println("<td>" + id + "</td>");
										out.println("<td>" + name + "</td>");
										out.println("<td>" + role + "</td>");
										out.println("<td>" + phone+ "</td>");
										out.println("<td>" + email + "</td>");
										out.println("<td>" + loc + "</td>");
										out.println("<td>" + uname + "</td>");
										out.println("<td>" + title + "</td>");
										out.println("<td>" + team + "</td>");
										out.println("<td>" + company + "</td>");
										
				
										out.println("<td><form action = \"../Admin/deleteUser\"> <input name = \"id\"value = \""+id +"\" style = \"display:none;\"><button type=\"submit\">Delete</button></form></td>");
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
	<br><br>
	<footer>
	<div class="container">
	<hr>
	</div>
</footer>
</html>
