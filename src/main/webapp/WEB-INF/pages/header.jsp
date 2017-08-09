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
.navbar-toggle, .icon-bar {
    border:1px solid orange !important; 
    line-height: 50px !important;
}
.navbar-fixed-top {
    height:60px !important;
    
}
</style>
</head>
<body>
	<!-- Fixed navbar which is flexible for Desktop and Phone  -->
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbarid">
					<span class="sr-only">Toggle navigation</span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span>
				</button>
				<a style="font: 30px bold arial !important;" class="navbar-brand" href="#">Time Tracking System</a>
			</div>
			<div class="navbar-collapse collapse" id="navbarid">
				<ul class="nav navbar-nav navbar-right">
					<li><a style="background-color: #808080 !important; font: 20px bold arial !important; color: black;"  onclick="window.location = 'home';">Home</a></li>
					<li><a style="background-color: #808080 !important; font: 20px bold arial !important; color: black;" onclick="window.location = 'about';">About</a></li>
					<li><a style="background-color: #808080 !important; font: 20px bold arial !important; color: black;" onclick="window.location = 'contact';">Contact Us</a></li>
					<li><a style="background-color: #808080 !important; font: 20px bold arial !important; color: black;" onclick="window.location = 'signin';">SignIn</a></li>
				</ul>
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