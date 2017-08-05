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
<body style="background-color:Azure">
	<%@include file="header.jsp" %>

	<div class="starter-template">
        <h1 class="text-info"><strong>Application Head Line</strong></h1>
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
			<!-- added data-backdrop="static" data-keyboard="false" to avoid closing modal, when user clicks on outside modal box.-->
			<div class="col-sm-2"> <button type="submit" class="btn btn-primary" data-target="#signupModal" data-backdrop="static" data-keyboard="false" data-toggle="modal">Sign Up</button> </div>
				<div class="modal bg-info" id="signupModal" tabindex="-1">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header=" style="background-color:LightCyan">
								<button class="close" data-dismiss="modal" onclick="clearOnCancel(); validate();">&times;</button>
								<h2 class="modal-title text-center text-primary"><strong>Registration</strong></h2>
								<br>
								<h6 class="text-center"><strong>Please fill all required (*) fields</strong></h6>
							</div>
							<div class="modal-body" style="background-color:LightCyan">
								<%@include file="popup.jsp" %>
							</div>
						</div>
					</div>
				</div>
			<div class="col-sm-2"><strong><p>New to App?</p></div></strong>
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