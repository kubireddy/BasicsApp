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
    						"requestKey": "requestValue"
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
    <script type="text/javascript">
	$(document).ready(function() {
		$("#signupBurronId").click(function() {
			var mail = $("#signUpEmail").val().toString();
			console.debug("this is mail"+mail)
			$.post("existance",
					{
						"emailId": mail
					}
			).done(function(data, status, jqXHR) { 
				var statusCode = jqXHR.status.toString();
				if(data == "TRUE") {
					$("#signUpFormClose").trigger('click');
					alert('User has already Account, Please Login'); 
					return false;
				} else{
					return true;
				}
				})
			.fail(function(ex, jqXHR) { 
				if(!(status == "200")) {
					$("#signUpFormClose").trigger('click');
					alert('Please contact the Site, Experiencing SignUp problems'); 
					return false;
				}
				})
			;
		});
	});
	
	function validate1() {
	    
	    var isSignUpButtonEnable = false;
	    
	    var alreadyHasAccount = false;
	    
	    alreadyHasAccount = hiValidate();
	    
	    isSignUpButtonEnable = existUser(alreadyHasAccount);
	    
		return isSignUpButtonEnable;
	}
	
	function existUser(alreadyHasAccount) {
		if(alreadyHasAccount){
			document.getElementById("signUpEmailError").innerHTML = "User has already Account, Please Close the SignUp form to Login the Account";
			return false;
		} else{
			document.getElementById("signUpEmailError").innerHTML = "";
			return true;
		}
	}
	
	function hiValidate(){
		
		var mail = $("#signUpEmail").val().toString();
		console.debug("this is mail"+mail)
		$.post("existance",
				{
					"EmailId": mail
				}
		).done(function(data, status, jqXHR) { 
			var statusCode = jqXHR.status.toString();
			
			if(data.flag.toString() == "TRUE") {
				//alert("Hi");
				
					 //x is local variable and value is 7.

				alert("jwhqdbquygdw");
				alreadyHasAccount = true;
				
				//enable = false;
				//var statusCode = jqXHR.status.toString(); //it returns StatusCode
				
			}
			});
		alreadyHasAccount = false;
		}
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