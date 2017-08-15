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
<style type="text/css">
.divpad {
	padding-top: 10%;
}
</style>
</head>
<body style="background-color:Azure">
	<%@include file="header.jsp" %>
	
	<div class="container divpad">
	<div class="row">
			<div  class="container col-lg-3"></div>
			<div  class="container col-lg-6">
				<form role="form" id="contactForm" name="contactForm" action="contactForm" method="post">
					<div class="form-group">
						<label for="fullName">Full Name*</label> <input type="text"
							class="form-control" id="fullName" name="fullName"
							placeholder="Full Name" required>
					</div>
					<div class="form-group"> 
						<label for="contactEmail">Email Id*</label> <input type="email"
							class="form-control" id="contactEmail" name="contactEmail"
							placeholder="Email Id" required>
					</div>
					<div class="form-group">
						<label for="title">Title*</label> <input type="text"
							class="form-control" id="title" name="title"
							placeholder="Title" required>
					</div>
					<div class="form-group">
						<label for="message">Message*</label>
							<textarea class="form-control" id="message" placeholder="Enter Messaage Here..........." rows="4" cols="50" required></textarea>
					</div>
					<br>
					<div class="row"  style="padding-left: 3%;">
						<button type="submit" class="btn btn-primary" form="contactForm">Submit</button> 
 						<button class="btn btn-danger" type="reset" form="contactForm">Reset</button>	
					</div>
				</form>
			</div>
			<div  class="container col-lg-3"></div>
		</div>
	</div>
	<%@include file="footer.jsp" %>

	<!-- Bootstrap core JavaScript
    ================================================== 
    Placed at the end of the document so-the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>