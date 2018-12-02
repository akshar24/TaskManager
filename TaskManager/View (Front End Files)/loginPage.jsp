
<!DOCTYPE html>
<html lang="en">
    <head>
	<div class="container">
  <h2>4 Task Management Inc.</h2>

  <div class="btn-group btn-group-justified">
    <a href="../navigateHome" class="btn btn-primary">Home</a>
    
    <a href="../Login/showLogin" class="btn btn-primary">Login</a>
  </div>
  
</div>
        <meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
		
        <title>Login Task Manager</title>
    </head>
    <body>

	<br><br><div class="container" align = "center">
        <form action="../Login/processLogin" method="POST" align="center" name = "login_fourm">
	    <div><label for="username">Username:</label>
             <input type="text" name="username" placeholder="Enter Username" id="username"><br>
        </div>

	    <div><label for="password">Password: </label>
            <input type="password" name="password" placeholder="Enter password" id="password"><br>
        <div><label for="company">Company:</label>
            <input type="text" name="company" placeholder="Enter Company Name" id="companyName"><br>
        </div>
        <br>
        <div><input type="submit" value="Login" style="height:25px; width:250px"/><br> 
        </div>

        </form>
	</div>
    <br><br>
    <div align="center"><p>Don't have an account?</p>
        <a href="../companyregistration/showSignUp">Sign Up</a></div>
    </body>
	
<footer>
	<div class="container">
	<hr>
	</div>
</footer>
</html>
