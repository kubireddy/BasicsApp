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
<link href="<c:url value="/resources/css/bootstrap.min.css" />"
	rel="stylesheet">
<link href="<c:url value="/resources/css/starter-template.css" />"
	rel="stylesheet">
<script type="text/javascript">

	$(document).ready(function() {
		$('#emailClose').click(function() {
			//It closes the Modal When User Clik on Close Button for this Modal becase I removed the modal-dismiss property, If we have here, It will close all 
			// opened modals.
			$('#emailModal').modal('hide');
		});
		$('#recapchaClose').click(function() {
			//It closes the Modal When User Clik on Close Button for this Modal becase I removed the modal-dismiss property, If we have here, It will close all 
			// opened modals.
			$('#recapchaId').modal('hide');
		});
	});
	
	//Its an gobal variable and It will be available for all Functions
	var emailIdFlag = false; //false means User has already account.
	function validateUserEmailId() {
		if (emailIdFlag) {
			return emailIdFlag;
		} else {
			//It opens the modal Dialog, when User is exist already.
			$('#emailModal').modal('show');
			return emailIdFlag;
		}
	}

	//on Register button click, we are validating recapcha and user emailId.
	function validateOnRegister() {
		return recpchaValidate() && validateUserEmailId();
	}
</script>
</head>
<body>
	<!-- No worries we not need to set the padding or does not need div container bcoz its being called in another JSP -->
	<form role="form" id="signUpForm" action="signup" method="post">
		<div class="form-group">
			<label for="firstName">First Name*</label> <input type="text"
				class="form-control" id="firstName" name="firstName"
				placeholder="First Name" onKeyUp="validate();" required>
			<div>
				<p id="firstNameError" class="small font-weight-bold text-center text-danger"></p>
			</div>
		</div>
		<div class="form-group">
			<label for="lastName">Last Name*</label> <input type="text"
				class="form-control" id="lastName" name="lastName"
				placeholder="Last Name" onKeyUp="validate();" required>
			<div>
				<p id="lastNameError" class="small text-center text-danger"></p>
			</div>
		</div>
		<div class="form-group">
			<label for="signUpEmail">Email*</label> <input type="email"
				class="form-control" id="signUpEmail" name="signUpEmail"
				placeholder="Email" onKeyUp="validate();" onkeydown="validateUserExistance();" required>
			<div>
				<p id="signUpEmailError" class="small text-center text-danger"></p>
			</div>
		</div>
		<div class="form-group">
			<label for="spwd">Password*</label> <input type="password"
				class="form-control" id="spwd" name="signUpPassword"
				placeholder="Password" onKeyUp="validate();" required>
			<div>
				<p id="spwdError" class="small text-center text-danger"></p>
			</div>
		</div>
		<div class="form-group">
			<label for="cpwd">Conform Password*</label> <input type="password"
				class="form-control" id="cpwd" placeholder="Reenter Password"
				onKeyUp="validate();" required>
			<div>
				<p id="cpwdError" class="small text-center text-danger"></p>
			</div>
		</div>
		<div class="g-recaptcha"
			data-sitekey="6Ld0LikUAAAAAFTY5TOCkpgo0tM6mRHSrs5yXK5D"></div>
		<br>
		<div class="row">
			<div class="col-sm-2">
				<button type="submit" class="btn btn-primary" form="signUpForm"
					id="signupBurronId" disabled="disabled"
					onclick="return validateOnRegister();">Register</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-primary" data-dismiss="modal"
					form="signUpForm" onclick="clearOnCancel(); validate();">Close</button>
			</div>
			<div class="col-sm-2">
				<button class="btn btn-danger" type="reset" form="signUpForm"
					onclick="clearOnCancel(); validate();">Reset</button>
			</div>
		</div>
	</form>
	
	
	<!--Modal is to display When User trying to SignUp using already SignedUp EmailId-->
	<div class="modal fade" id="emailModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">EmailId</h4>
	      </div>
	      <div class="modal-body">
	        <p>User has already Account, Please Close the SignUp Form to Login. Please Contact Site, If you do not have already.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="emailClose" class="btn btn-primary" >Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	<!--Modal is to display When User did not check Recapcha.-->
	<div class="modal fade" id="recapchaId">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">Recapcha</h4>
	      </div>
	      <div class="modal-body">
	        <p>Please Check the Box.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="recapchaClose" class="btn btn-primary" >Close</button>
	      </div>
	    </div>
	  </div>
	</div>
	<!-- Bootstrap core JavaScript
    ================================================== 
    Placed at the end of the document so-the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>