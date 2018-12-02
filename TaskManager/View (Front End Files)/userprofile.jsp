<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ page import="java.util.*" %>
<%@ page import="TaskManager.*" %>
<!DOCTYPE html>
<html>
	<head>
		<title>Team Dashboard 4 Task Management Inc.</title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<!-- Bootstrap -->
		
		<
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
						 <h1><a href="../userdashboard/showUDash">Team Dashboard</a></h1>
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
					
					</ul>
				 </div>
				</div>
		
		<div class = "container">
			<%
				User user1 = (User)session.getAttribute("User");
				out.println("<p> Name: " + user1.getName() + "</p>");
				out.println("<p> Role: " + user1.getRole() + "</p>");
				out.println("<p> Phone: " + user1.getWorkPhone() + "</p>");
				out.println("<p> Email: " + user1.getWorkEmail() + "</p>");
				out.println("<p> Location: " + user1.getLocation() + "</p>");
				out.println("<p> Title: " + user1.getTitle() + "</p>");
				out.println("<p> Team/Department: " + user1.getDepartment() + "</p>");
				out.println("<p> Company: " + user1.getCompany() + "</p>");
				
			
			%>
		</div>
		</div>
		</div>
		</body>
</html>

















