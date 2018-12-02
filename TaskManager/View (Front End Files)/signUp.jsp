
<html lang="en">
<head>
<!--This is the header portion of the webpage it will be placed on all the pages we make-->
<div class="container">
  <h2>4 Task Management Inc.</h2>
  <div class="btn-group btn-group-justified">
    <a href="../navigateHome" class="btn btn-primary">Home</a>
    
    <a href="../Login/showLogin" class="btn btn-primary">Login</a>
  </div>
 <!--End of header--> 
 
</div>
  <title>Register</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
  <!-- This is the text field for the registration page -->
 <div class = "container">
 	The submit is: ${submit}
 	
 </div>
<div class="container">
  <h1>Company Information</h1>
  <p style="color:red">* Fill in all the fields.</p>    
</div>
<form action ="fetchAdminandValidateData" onsubmit = "return information()" method = "POST">

<div class="container">

 <div class="form-group">"WebContent/WEB-INF/lib/view/signUp.jsp"
    <label for="company">Company:</label>
    <input type="text" name = "company" class="form-control" id="company" value = "Schoolcity" required>
  </div>
  
   <div class="form-group">
    <label for="companyid">Company ID:</label>
    <input type="text" name = "companyId" class="form-control" id="companyid" value = "1234"required>
  </div>
  
  <div class="form-group">
    <label for="phone">Company Phone Number:</label>
    <input type="text" name = "companyphone" class="form-control" value ="6692418220"id="phone" required>
  </div>
 
  <div class="form-group">
    <label for="address">Company Address:</label>
    <input type="text" name = "companyaddress" class="form-control" value = "1100 Howe Ave" id="address" required>
  </div>
  
  <div class="form-group">
    <label for="job">Company Description:</label>
    <input type="text" name = "description" class="form-control" value = "Some company"id="job" required>
  </div>
<div>
  <h1>Admin Registration</h1>
  <p style="color:red">* Fill in all the fields.</p>    
</div>
  <div class="form-group">
    <p style = "color:red"> ${CRegError} </p>
  </div>
  <div class="form-group">
    <label for="firstname">First Name:</label>
    <input type="text" class="form-control" id="firstname" value = "Akshar" name = "firstname" required>
  </div>
    <div class="form-group">
    <label for="lastname">Last Name:</label>
    <input type="text" class="form-control" id="lastname"  value = "Patel" name = "lastname"required>
  </div>
    <div class="form-group">
    <label for="title">Position Title:</label>
    <input type="text" name = "title" class="form-control" value = "Software Engineer" id="title" required>
  </div>
  <div class="form-group">
    <label for="username">Username:</label>
    <input type="text" class="form-control" id="username" value = "akshar24"name = "username"required>
  </div>
  
  <div class="form-group">
    <label for="department">Department/Team:</label>
    <input type="text" class="form-control" name = "department" value = "Software" id="department" required>
  </div>
    <div class="form-group">
    <label for="workphone">Company Phone Number:</label>
    <input type="text" name = "workphone" class="form-control" value = "6692418220"id="workphone" required>
  </div>
  <div class="form-group">
    <label for="email">Work Email Address:</label>
    <input type="email" name = "email" class="form-control" id="email" value = "akshar@csus.edu" required>
  </div>
    <div class="form-group">
    <label for="location">Location: </label>
	<!-- Location within the office -->
    <input type="text" name = "location"  class="form-control" value = "E144"id="location" required>
  </div>
  <div class="form-group">
    <label for="password">Password:</label>
    <input type="password" name = "password" class="form-control" value = "livonia1" id="password" required>
  </div>
  
  <div class="form-group">
    <label for="repassword">Re-Type Password:</label>
    <input type="password" name = "repassword" class="form-control" value = "livonia12"id="repassword" required>
  </div>

  <div align="center"><button type="submit" name = "submit" class="btn btn-default" style="color: white; background-color:#337ab7; font-size:15px">Submit</button>
</form>
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
        return false;
    }
	if(password.length < 8){
		alert("Password length must be atleast 8 characters");
		submitOK= "false";
		return false;
	}
	for(var i = 0; i < password.length; i ++){
		if(password.charAt(i) == "1" || "2" || "3" || "4" || "5" || "6" || "7" || "8" || "9" || "0"){num++;}
		if(password.charAt(i) == "!" || "@" || "#" || "$" || "%" || "^" || "&" || "*" ){sym++;}
	}
	if (num < 1){alert( "Password must contain a number and symbol"); submitOK = "false"; return false;}
	if(sym < 1){alert( "Password must contain a number and symbol"); submitOK = "false"; return fasle;}
    if (at == -1) {
        alert("Not a valid e-mail!");
        submitOK = "false";
        return false;
    }

    if (submitOK == "false") {
        return false;
    }
    return true;s
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
