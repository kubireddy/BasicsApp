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
<link href="<c:url value="/resources/css/bootstrap.min.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/starter-template.css" />" rel="stylesheet">
<style type="text/css">
.divCenter {
	position: absolute;
	margin: auto;
	top: 0;
	right: 0;
	left: 0;
	bottom: 0;
	width: 400px;
	height: 300px;
	background-color: #ccc;
	border-radius: 3px;
}
</style>
</head>
<body style="background-color:Azure">
	
	<div class="divCenter">
		<br><br>
		<div class="row">
			<h4 class="text-center text-danger">RESOURCE NOT FOUND</h4>
		</div> <br>
		<div class="row" style="padding-left: 25%;">
			<h6>Requested Resource is not available or found <br>Please <a onclick="window.location = 'home';">Click Me</a> to go to Home Page.</h6>
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