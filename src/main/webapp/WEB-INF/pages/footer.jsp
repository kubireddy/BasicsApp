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
.navbar-default {
    background-color: #FFFFFF !important;
    border-color: #00FF00 !important;
}
</style>
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-bottom"
		role="navigation">
		<div class="container">
			<div class="navbar-text pull-left"> <!-- class="navbar-text pull-left" -->
				<p>Contact: </p>
				<p>Phone Number: </p>
			</div>
			<div class="navbar-text pull-right"> <!-- class="navbar-text pull-left" -->
				<p>2017 CopyRights.Inc</p>
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