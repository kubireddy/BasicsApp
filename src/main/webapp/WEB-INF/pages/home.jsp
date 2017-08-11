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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"> 
<style type="text/css">
 html, body { 
 	height: 100%; 
 	width: 100%; 
 } 

 .block1 { 
 	height:100%; 
 	background-image: url("<c:url value="/resources/images/pic2.jpg" />"); 
 	background-position: center center; 
 	background-size: cover; 
 } 
</style>
</head>
<body style="background-color:Azure">
	<%@include file="header.jsp" %>
	<div class="container-fluid block1">
		<div class="jumbotron">
			<h2>Jumbotron heading</h2>
			<p class="lead">Cras justo odio, dapibus ac facilisis in, egestas
				eget quam. Fusce dapibus, tellus ac cursus commodo, tortor</p>
			<p>
				<a class="btn btn-lg btn-success"
					onclick="window.location = 'signin';" role="button">Sign up
					today</a>
			</p>
		</div>
		<div class="row">
			<div class="col-lg-6">
				<h3 style="color: purple;"><strong>Subheading1</strong></h3>
				<p style="color: Olive;">Donec id elit non mi porta gravida at eget metus. Maecenas
					faucibus mollis interdum bsaudg jhbsuii jbisyhb bydhgqidg jhbdihd bjdhvdb jbyduqydj jhbdjhbduy jbuyud juydvugqwhd jhydqwy hygdygqwhdg jhuyvd 
					hduqbdbqi hbdbbdqy bbhdqygdj jhydguyqdjvquy jhdyqhquvucv hbdhudvqjudvqwv</p>
			</div>

			<div class="col-lg-6">
				<h3 style="color: purple;"><strong>Subheading2</strong></h3>
				<p style="color: Olive;">Donec id elit non mi porta gravida at eget metus. Maecenas
					faucibus mollis interdum.</p>
			</div>
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