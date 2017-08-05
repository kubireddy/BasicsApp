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
	padding-top: 2%;
	padding-left: 5%;
	padding-right: 50%;
	text-align: left;
}
</style>

<script type="text/javascript">

function closeButton() {
	//It closes the Modal When User Clik on Close Button for this Modal becase I removed the modal-dismiss property, If we have here, It will close all 
	// opened modals.
	$('#resendEmailModal').modal('hide');
}

//Its an gobal variable and It will be available for all Functions
var resendEmailIdFlag = false; //false means User is not giving the correct .
function validateUserResendEmailId() {
	//validateEmailOnDb();
	if (resendEmailIdFlag) {
		return resendEmailIdFlag;
	} else {
		//It opens the modal Dialog, when User is not exist in DB.
		$('#resendEmailModal').modal('show');
		return resendEmailIdFlag;
	}
}

function validateEmailOnDb() {
	var mailResend = $("#emailResend").val().toString();
	$.post("existance", {
		"EmailId" : mailResend
	},
	function(data, status, jqXHR){ //this will be executed always
		var statusCode = jqXHR.status.toString();  //gives statusCode
		responseResendCallBack(data.flag.toString(), status, jqXHR);
	}
	);
}

function responseResendCallBack(flag, status, jqXHR) {
	//if User is Exist or Service returns Exception, we should ask them to enter valid address to resend token.
	//based on conditions we are assigning new value to resendEmailIdFlag variable.
	if(flag == "TRUE"){
		resendEmailIdFlag = true;
	} else {
		resendEmailIdFlag = false;
	}
}

function clearOnCancelForResend(){
	document.getElementById("resendForm").reset();
}
</script>
</head>
<body style="background-color:Azure">

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
			<p class="small text-info">Please verify the Verification Token Which was sent to your Mail</p>
		</div>
		<br>
		<form role="form" id="verificationForm" action="verify" method="post">
			<div class="form-group">
				<label for="verificationToken">Verification Token*</label> <input
					type="text" class="form-control" id="verificationToken"
					name="verificationToken" placeholder="Token" required>
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
			<div class="col-sm-3">
				<button type="submit" class="btn btn-primary"
					data-target="#resendModal" data-backdrop="static" data-keyboard="false" data-toggle="modal">Click Me</button>
			</div>
			<div class="modal bg-info" id="resendModal" tabindex="-1">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header=" style="background-color:LightCyan">
							<button class="close" data-dismiss="modal" onclick="clearOnCancelForResend();">&times;</button>
								<h2 class="modal-title text-center text-primary"><strong>Please Reenter Email Id</strong></h2>
						</div>
						<div class="modal-body" style="background-color:LightCyan">
							<form role="form" id="resendForm" action="resend" method="post">
								<div class="form-group">
									<label for="emailResend">Email*</label> <input type="email"
										class="form-control" id="emailResend" name="emailResend" onchange="validateEmailOnDb();"
										onkeydown="validateEmailOnDb();" placeholder="Email" required>
								</div>
								<br>
								<div class="row">
									<div class="col-sm-2">
										<button type="submit" class="btn btn-primary"
											form="resendForm" onclick="return validateUserResendEmailId();">Resend</button>
									</div>
									<div class="col-sm-2">
										<button class="btn btn-primary" data-dismiss="modal" onclick="clearOnCancelForResend();"
											form="resendForm">Close</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<p><strong>Have not Received the Verification Code?</strong></p>
			</div>
		</div>
	</div>
	
	<!--Modal is to display When User trying to SignUp using already SignedUp EmailId-->
	<div class="modal fade" id="resendEmailModal">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h4 class="modal-title">EmailId</h4>
	      </div>
	      <div class="modal-body">
	        <p>Please Enter Valid EmailId.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="resendEmailClose" onclick="closeButton();" class="btn btn-primary" >Close</button>
	      </div>
	    </div>
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