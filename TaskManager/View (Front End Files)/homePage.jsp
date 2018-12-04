<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<div class="container">
  <h2>4 Task Management Inc.</h2>
  <div class="btn-group btn-group-justified">
    <a href= "navigateHome" class="btn btn-primary">Home</a>
    <a href="Login/showLogin" class="btn btn-primary">Login</a>
  </div>
  <title>HomePage</title>
  <meta charset="utf-8">

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class ="large text-center">



</div>
  <spring:url value = "/resources/Meistertask.png" var = "pic" />
<div class="jumbotron text-center" style="background-image:url('${pic}'); height: 203px; width: 644px; border: 1px solid black;" align="middle">

  <!--h1>Welcome!</h1>
  <!--img src="task_management.png" alt="Task Manager"> //-->  
</div>
  
<div class="container">
  <div class="row">
    <div class="col-sm-4">
      <h3>Introduction</h3>
      <p>Due to increase in the complexity of projects, it has 
	  become increasingly important for today’s corporations to 
	  optimize their workload and available resources to 
	  effectively achieve their project goals. The goal of our 
	  project is to create a task management web application 
	  for corporations to manage their projects, meet deadlines, 
	  track their progress on approved projects, prioritize their 
	  projects to effectively use available resources and budget 
	  or time to complete their projects, share feedback on 
	  projects and associated tasks. The main user of this web
	  application will be  
	  <a href="#hidesection" onclick="myFunction('hidesection')">Read More &raquo</a>
	 <div id="hidesection" >
	  ultimately corporations with distributed and dynamic usage of this web app across different 
	 teams within those corporations . This web app will allow
	 the employees to propose certain task with its priority, start and estimated stop dates, description, and much more attributes, which then will be approved and assigned appropriately by managers. This web app will allow all users to track their progress on their respective projects as well as team and the whole corporation projects. All team members on this project have been divided to solve certain problems about this application and then finally coming together to combine all optimized solutions to build this application. The teamwork and the passion to solve real world problem are two most important factors that motivate us to solve this problem using software engineering principles and best practices and ultimately improve our problem-solving skills.</p>
    </div>
	</div>
	
    <div class="col-sm-4">
      <h3>Project Overview</h3>
      <p>Taking into consideration the functionality of the google calendar app and a task managing app, it would be great for employees in a company to have a task managing system like the google calendar. They would have similar functions like the google calendar as well as a task timing functions to help manage their work.

Task organizer for the average employee.
Three accounts will be implemented in this prodcut; manager, employee, and dev account
The company manager can use this product to manage each employee's productivity.
The Employees can use this product for time management.</p>
    </div>
    <div class="col-sm-4">
      <h3>Project Architecture</h3>        
      <p>Considering the experience levels of all team members and reviewing other task management products, we as a team have decided to use REST Representational state transfer architectural style. We have decided to implement web application with front-end and back-end components. We believe that implementing this architectural style, we will be able to separate the user interface/user interaction(Front-End) and the model/logic (Back-End). We will also integrate and practice MVC style in this application. Technologies that we are planning to use Java Spring MVC, JSP, and 
	  <a href="#another_section" onclick="myFunction('another_section')">Read More &raquo</a>
	  <div id = "another_section">
	   Hibernate for the backend development, allowing us to effectively integrate MVC style with REST. We are also planning to use RESTFul Apis to accomplish some of our tasks (not decided which ones yet). We are planning to use SQL Database controlled by Hibernate for our backend. We are also planning to use HTML, CSS, and JavaScript and JS frameworks for the front end development.
Front-end side will have user interactions components such as dashboard, login and logout system, admin system to manage tasks, etc based upon the user type i.e. employee, manager, or dev. For the database, we are going to model how are we going to store out data, separating users table, task table with rows as task and columns as different attributes of a certain task. Finally, we base these architectural decisions based on thorough evaluation of our skill level and experiences.</p>
		</div>
	</div>
  </div>
</div>

<footer>
	<div class="container">
	<hr>

	</div>
</footer>

</body>
<script type= "text/javascript">
$("#hidesection").hide();
$("#another_section").hide();

function myFunction(id) {
var x = document.getElementById(id);
	if(x.style.display == 'none')
		x.style.display = 'block';
	else 
		x.style.display = 'none';
}

</script>
</html>
