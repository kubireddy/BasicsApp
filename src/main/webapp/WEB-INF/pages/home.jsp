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
	<%@include file="header.jsp" %>

	<div class="starter-template">
        <h1>Application Head Line</h1>
        <p> website. bmscbugfu uhbwegcbewg bcwegcbewu cgecbwieyg cenchc uwhccjci bcgh;qdw0odwk kncheck  kf8f hfgfbigf jfigfkbefigekfk kjfiiwfifhiuhf jhdiweg.</p>
    </div>

	<div class="login-template">
		<form>
			<div class="form-group">
				<label for="email">Email:</label> 
				<input type="email" class="form-control" id="email" placeholder="Email" required>
			</div>
			<div class="form-group">
				<label for="pwd">Password:</label> 
				<input type="password" class="form-control" id="pwd" placeholder="Password" required>
			</div>
			<div class="checkbox">
				<label><input type="checkbox"> Remember me</label>
			</div>
			<button type="submit" class="btn btn-primary">Login</button>
		</form>
		<br />
		<div class="row">
			<div class="col-sm-2"> <button type="submit" class="btn btn-primary" data-target="#signupModal" data-toggle="modal">Sign Up</button> </div>
				<div class="modal" id="signupModal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header=">
								<button class="close" data-dismiss="modal">&times;</button>
								<center><h2 class="modal-title"><font color="blue">Registration</font></h2></center>
								<br>
								<center><h6><font color="black">Please fill all required (*) fields</font></h6></center>
							</div>
							<div class="modal-body">
								<form id="signupForm" action="signup" method="get">
									<div class="form-group">
										<label for="firstName">First Name*</label> 
										<input type="text" class="form-control" id="firstName" placeholder="First Name" onKeyUp="validate();" required>
																<center><font color="red"><p id="firstNameError"></p></font></center>
									</div>
									<div class="form-group">
										<label for="lastName">Last Name*</label> <input type="text"
											class="form-control" id="lastName" placeholder="Last Name" onKeyUp="validate();"
											required><center><font color="red"><p id="lastNameError"></p></font></center>
									</div>
									<div class="form-group">
										<label for="signUpEmail">Email*</label> 
										<input type="email" class="form-control" id="signUpEmail" placeholder="Email" onKeyUp="validate();" required>
															<center><font color="red"><p id="signUpEmailError"></p></font></center>
									</div>
									<div class="form-group">
										<label for="spwd">Password*</label> 
										<input type="password" class="form-control" id="spwd" placeholder="Password" onKeyUp="validate();" required>
																<center><font color="red"><p id="spwdError"></p></font></center>
									</div>
									<div class="form-group">
										<label for="cpwd">Conform Password*</label> 
										<input type="password" class="form-control" id="cpwd" placeholder="Reenter Password" onKeyUp="validate();" required>
																<center><font color="red"><p id="cpwdError"></p></font></center>
									</div>
									<div class="g-recaptcha" data-sitekey="6Ld0LikUAAAAAFTY5TOCkpgo0tM6mRHSrs5yXK5D" ></div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="submit" class="btn btn-primary" form="signupForm" id="signupBurronId" disabled="disabled" onclick="return recpchaValidate();">Register</button>
								<button class="btn btn-primary" data-dismiss="modal" form="signupForm" onclick="return clearOnCancel();">Close</button>
								<button class="btn btn-danger" type="reset" form="signupForm">Reset</button>
							</div>
						</div>
					</div>
				</div>
			<div class="col-sm-2"> <p>New to App?</p> </div>
		</div>
	</div>

	<%@include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript
    ================================================== 
    Placed at the end of the document so-the pages load faster -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
	<script src="https://www.google.com/recaptcha/api.js" async defer></script>
	<script src="<c:url value="/resources/js/signup.js" />"></script>
</body>
</html>