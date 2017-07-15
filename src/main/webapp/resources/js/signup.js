function validate() {
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var signUpEmail = document.getElementById("signUpEmail").value;
    var isSignUpButtonEnable = false;
	
    isSignUpButtonEnable = checkFirstNameRegex(firstName);
    
    isSignUpButtonEnable = isSignUpButtonEnable && checkLastNameRegex(lastName);
    
    isSignUpButtonEnable = isSignUpButtonEnable && checksignUpEmailRegex(signUpEmail);
	
	if(isSignUpButtonEnable) {
		$("#signupBurronId").attr("disabled",false);
	} else{
		$("#signupBurronId").attr("disabled",true);
	}
}

function checkFirstNameRegex(firstName) {
	
	var regex = new RegExp("^([A-Z ]{3,20})$");
	
	if (regex.test(firstName)) {
		document.getElementById("firstNameError").innerHTML = "";
		return true;
	} else if(isEmpty(firstName)){
		document.getElementById("firstNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("firstNameError").innerHTML = "Enter Valid Name(Caps & should be atleat 3 alphabet)";
		return false;
	}
}

function checkLastNameRegex(lastName) {
	
	var regex = new RegExp("^([A-Z ]{3,20})$");
	
	if (regex.test(lastName)) {
		document.getElementById("lastNameError").innerHTML = "";
		return true;
	} else if(isEmpty(lastName)){
		document.getElementById("lastNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("lastNameError").innerHTML = "Enter Valid Name(Caps & should be atleat 3 alphabet)";
		return false;
	}
}

function checksignUpEmailRegex(signUpEmail) {
	
	var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if (regex.test(signUpEmail)) {
		document.getElementById("signUpEmailError").innerHTML = "";
		return true;
	} else if(isEmpty(signUpEmail)){
		document.getElementById("signUpEmailError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("signUpEmailError").innerHTML = "Enter EmailId";
		return false;
	}
}

function isEmpty(val){
    return (val == undefined || val == null || val.length <= 0) ? true : false;
}