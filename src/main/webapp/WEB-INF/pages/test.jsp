%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<script type="text/javascript">
    $(document).ready(function() {
    	$("#toggleButtonId").click(function() {
    		if ($(this).val() == "ON") {
    			$.post("URL",
    					{
    						"requestKey": "requestValue";
    					},
    					function(data, status, jqXHR){ //this will be executed always
    						//if you use this function to read response, we should check for status inside here. 
    						//otherwise use specific methods to read response and this function can be removed I think
    						alert('status: ' + status + ', data: ' + data.Key);
    					},
    					"json"
    			).done(function(data, status, jqXHR) { 
    				alert('Request done!'); //do sth here with success data
    				})
    			.fail(function(ex) { //(jqxhr, settings, ex)
    				alert('failed, ' + ex); 
    				})
    			.always(function() { //this will be executed always, does not matter it is failed or not
    				alert( "finished" );
  					})
    			;
    		}
    	});
    });
    </script>
    <script type="text/javascript">
    //jqXHR.done() (for success), jqXHR.fail() (for error), and jqXHR.always()
    //$.post( url, [data], [callback], [type] )
    //If we wonna use the custom headers, then go for .ajax method, usally .get and .post will support the headers.
    $.post('/jquery/submitData',   // url
			   { myData: 'This is my data.' }, // data to be submit
			   function(data, status, jqXHR) {// success callback
						$('p').append('status: ' + status + ', data: ' + data);
				}).done(function() { alert('Request done!'); })
				  .fail(function(jqxhr, settings, ex) { alert('failed, ' + ex); });


			
    </script>
</head>
<body>
	
	<!-- Bootstrap core JavaScript
    ================================================== 
    Placed at the end of the document so-the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
</body>
</html>