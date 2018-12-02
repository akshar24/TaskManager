<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<!--This is the header portion of the webpage it will be placed on all the pages we make-->
  <title>TeamUser Registration</title>
  
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <spring:url value = "/resources/css/styles.css" var = "styles" />
  <link href="${styles}"rel="stylesheet" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
  <!-- This is the text field for the registration page -->
<div class="container">
<div>
  <h1>TeamUser Registration</h1>
  <p style="color:red">* Fill in all the fields.</p>    
</div>
<div><p style = "color:red";>${TURegError}</div>
<form action = "../TeamuserAdd/processTAD" method = "POST" style = "display:inline">
  <div class="form-group">
    <label for="firstname">First Name:</label>
    <input type="text" class="form-control" id="firstname" name = "firstname" required>
  </div>
    <div class="form-group">
    <label for="lastname">Last Name:</label>
    <input type="text" class="form-control" id="lastname" name = "lastname"required>
  </div>
    <div class="form-group">
    <label for="title">Position Title:</label>
    <input type="text" name = "title" class="form-control" id="title" required>
  </div>
  <div class="form-group">
    <label for="username">Username:</label>
    <input type="text" class="form-control" id="username" name = "username"required>
  </div>
  
  <div class="form-group">
    <label for="department">Department/Team:</label>
    <input type="text" class="form-control" name = "department" id="department" required>
  </div>
    <div class="form-group">
    <label for="workphone">Work Phone Number:</label>
    <input type="text" name = "workphone" class="form-control" id="workphone" required>
  </div>
  <div class="form-group">
    <label for="email">Work Email Address:</label>
    <input type="email" name = "email" class="form-control" id="email" required>
  </div>
    <div class="form-group">
    <label for="location">Location: </label>
	<!-- Location within the office -->
    <input type="text" name = "location"  class="form-control" id="location" required>
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" name = "password" class="form-control" id="password" required>
  </div>
  
  <div class="form-group">
    <label for="repassword">Re-Type Password:</label>
    <input type="password" name = "repassword" class="form-control" id="repassword" required>
  </div>

  <div align="center" ><button type="submit" class="btn btn-default" style="color: white; background-color:#337ab7; font-size:15px">Submit</button></div>
	
</form>
<div align="center" style = "margin-top: 5px"><a href = "../userdashboard/showUDash"><button  class="btn btn-default" style="color: white; background-color:#337ab7; font-size:15px">Cancel</button></a></div>
</div>

<footer>
	<div class="container">
	<hr>
		<Strong>Devs: Akshar, Jessica, Tina, Matt, Singh</Strong>
	</div>
</footer>

<!--function section where all of the javascript goes and actions.-->
<script>

function information() {
    var name = document.getElementById("name").name;
	var company = document.getElementById("company").name;
    var companyid = document.getElementById("companyid").name;
	var username = document.getElementById("username").name;
	var at = document.getElementById("email").name.indexOf("@");
	var password = document.getElementById("password").name;
	var repassword = document.getElementById("repassword").name;
	var department = document.getElementById("department").name;
	var phone = document.getElementById("phone").name;
	var address = document.getElementById("address").name;
	var num = 0;
	var sym = 0;
	var person = new account(name, company, companyid, username, password, email);
    submitOK = "true";

    if (password != repassword) {
        alert("Passwords do not match");
        submitOK = "false";
    }
	if(password.length < 8){
		alert("Password length must be atleast 8 characters");
		submitOK= "false";
	}
	for(var i = 0; i < password.length; i ++){
		if(password.charAt(i) == "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9" || "0"){num++;}
		if(password.charAt(i) == "!" || "@" || "#" || "$" || "%" || "^" || "&" || "*" ){sym++;}
	}
	if (num < 1){alert( "Password must contain a number and symbol"); submitOK = "false";}
	if(sym < 1){alert( "Password must contain a number and symbol"); submitOK = "false";}
    if (at == -1) {
        alert("Not a valid e-mail!");
        submitOK = "false";
    }

    if (submitOK == "false") {
        return false;
    }
}

function account(name, company, companyid, username, password, email) {
    this.name = name;
    this.company = company;
    this.companyid = companyid;
    this.username = username;
    this.password = password;
    this.email = email;
}
	

</script>
</body>
</html>