<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="XXXXX">
<meta name="author" content="Linga Reddy Kubireddy">
<title>Home</title>
<!-- Minified CSS -->
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/starter-template.css" />" rel="stylesheet">
</head>
<body>
	<form role="form" id="signupForm" action="signup" method="get">
		<div class="form-group">
			<label for="firstName">First Name*</label> <input type="text"
				class="form-control" id="firstName" placeholder="First Name"
				onKeyUp="validate();" required>
			<center>
				<font color="red"><p id="firstNameError"></p></font>
			</center>
		</div>
		<div class="form-group">
			<label for="lastName">Last Name*</label> <input type="text"
				class="form-control" id="lastName" placeholder="Last Name"
				onKeyUp="validate();" required>
			<center>
				<font color="red"><p id="lastNameError"></p></font>
			</center>
		</div>
		<div class="form-group">
			<label for="signUpEmail">Email*</label> <input type="email"
				class="form-control" id="signUpEmail" placeholder="Email"
				onKeyUp="validate();" required>
			<center>
				<font color="red"><p id="signUpEmailError"></p></font>
			</center>
		</div>
		<div class="form-group">
			<label for="spwd">Password*</label> <input type="password"
				class="form-control" id="spwd" placeholder="Password"
				onKeyUp="validate();" required>
			<center>
				<font color="red"><p id="spwdError"></p></font>
			</center>
		</div>
		<div class="form-group">
			<label for="cpwd">Conform Password*</label> <input type="password"
				class="form-control" id="cpwd" placeholder="Reenter Password"
				onKeyUp="validate();" required>
			<center>
				<font color="red"><p id="cpwdError"></p></font>
			</center>
		</div>
		<div class="g-recaptcha"
			data-sitekey="6Ld0LikUAAAAAFTY5TOCkpgo0tM6mRHSrs5yXK5D"></div>
		<br>
		<div class="row">
			<div class="col-sm-2">
				<button type="submit" class="btn btn-primary" form="signupForm"
					id="signupBurronId" disabled="disabled"
					onclick="return recpchaValidate();">Register</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-primary" data-dismiss="modal"
					form="signupForm" onclick="clearOnCancel(); validate();">Close</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-danger" type="reset" form="signupForm"
					onclick="clearOnCancel(); validate();">Reset</button>
			</div>
		</div>
	</form>
	<!-- Bootstrap core JavaScript
    ================================================== 
    Placed at the end of the document so-the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>