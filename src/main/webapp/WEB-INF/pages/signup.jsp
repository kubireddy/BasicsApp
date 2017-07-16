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
<style type="text/css">
div.sign {
	padding-top: 10%;
	padding-left: 5%;
	padding-right: 50%;
	text-align: left;
}
div.resend {
	padding-top: 5%;
	padding-left: 5%;
	padding-right: 50%;
	text-align: left;
}
</style>
</head>
<body>

	<div class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-text pull-left">
				<!-- class="navbar-text pull-right" -->
				<h1>Verification</h1>
			</div>
		</div>
	</div>
	<br>
	<div class="sign">
		<div>
			<font color="blue"><h6>Please verify the Verification
					Token Which was sent to your Mail</h6></font>
		</div>
		<br>
		<form role="form" id="verificationForm" action="verify" method="post">
			<div class="form-group">
				<label for="verificationToken">Verification Token*</label> <input
					type="text" class="form-control" id="verificationToken"
					name="verificationToken" placeholder="Token" required>
				<!-- <center>
				<font color="red"><p id="firstNameError"></p></font>
			</center> -->
			</div>
			<div class="row">
				<div class="col-sm-2">
					<button type="submit" class="btn btn-primary"
						form="verificationForm">Verify</button>
				</div>
			</div>
		</form>
	</div>

	<div class="resend">
	<div class="row">
			<div class="col-sm-3"> <button type="submit" class="btn btn-primary" data-target="#resendModal" data-toggle="modal">Click Me</button> </div>
				<div class="modal" id="resendModal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header=">
								<button class="close" data-dismiss="modal">&times;</button>
								<center><h2 class="modal-title"><font color="blue">Please Reenter Email Id</font></h2></center>
							</div>
							<div class="modal-body">
									<form role="form" id="resendForm" action="resend" method="post">
										<div class="form-group">
											<label for="emailResend">Email*</label> <input type="email"
												class="form-control" id="emailResend" name="emailResend" placeholder="Email" required>
<%-- 											<center> --%>
<!-- 												<font color="red"><p id="firstNameError"></p></font> -->
<%-- 											</center> --%>
										</div>
										<br>
										<div class="row">
											<div class="col-sm-2">
												<button type="submit" class="btn btn-primary" form="resendForm"
													id="signupBurronId" >Resend</button>
											</div>
											<div class="col-sm-2">
												<button class="btn btn-primary" data-dismiss="modal"
													form="resendForm" >Close</button>
											</div>
										</div>
									</form>
							</div>
						</div>
					</div>
				</div>
			<div class="col-sm-3"> <p>Have not Received the Verification Code?</p> </div>
		</div>
	</div>
	
	<%@include file="footer.jsp"%>

	<!-- Bootstrap core JavaScript
    ================================================== 
    Placed at the end of the document so-the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>