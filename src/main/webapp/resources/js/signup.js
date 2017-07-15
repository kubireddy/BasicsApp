function validate() {
    var firstName = document.getElementById("firstName").value;
    var lastName = document.getElementById("lastName").value;
    var signUpEmail = document.getElementById("signUpEmail").value;
    var password = document.getElementById("spwd").value;
    var cpwd = document.getElementById("cpwd").value;
    var isSignUpButtonEnable = false;
	
    isSignUpButtonEnable = checkFirstNameRegex(firstName);
    
    isSignUpButtonEnable = isSignUpButtonEnable && checkLastNameRegex(lastName);
    
    isSignUpButtonEnable = isSignUpButtonEnable && checksignUpEmailRegex(signUpEmail);
    
    isSignUpButtonEnable = isSignUpButtonEnable && checkPasswordRegex(password);
    
    isSignUpButtonEnable = isSignUpButtonEnable && pwdMatch(password, cpwd);
    
    
	
	if(isSignUpButtonEnable) {
		$("#signupBurronId").attr("disabled",false);
	} else{
		$("#signupBurronId").attr("disabled",true);
	}
}

function checkFirstNameRegex(firstName) {
	
	var regex = new RegExp("^([A-Z ]{2,20})$");
	
	if (regex.test(firstName)) {
		document.getElementById("firstNameError").innerHTML = "";
		return true;
	} else if(isEmpty(firstName)){
		document.getElementById("firstNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("firstNameError").innerHTML = "Enter Valid Name(Caps alphabet only)";
		return false;
	}
}

function checkLastNameRegex(lastName) {
	
	var regex = new RegExp("^([A-Z ]{2,20})$");
	
	if (regex.test(lastName)) {
		document.getElementById("lastNameError").innerHTML = "";
		return true;
	} else if(isEmpty(lastName)){
		document.getElementById("lastNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("lastNameError").innerHTML = "Enter Valid Name(Caps alphabet only)";
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
		document.getElementById("signUpEmailError").innerHTML = "Enter Valid EmailId";
		return false;
	}
}

function checkPasswordRegex(spwd) {
	
	var regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	
	if (regex.test(spwd)) {
		document.getElementById("spwdError").innerHTML = "";
		return true;
	} else if(isEmpty(spwd)){
		document.getElementById("spwdError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("spwdError").innerHTML = "Must have one Lower/Upper/Numeric/SplChar";
		return false;
	}
}

function pwdMatch(spwd, cpwd){
	if(spwd === cpwd) {
		document.getElementById("cpwdError").innerHTML = "";
		return true;
	} else if(isEmpty(spwd) && isNotEmpty(cpwd)){
		document.getElementById("cpwdError").innerHTML = "Please Enter Password First";
		return false;
	} else if (!(spwd == cpwd) && !isEmpty(cpwd)){
		document.getElementById("cpwdError").innerHTML = "Passwords are not Matched";
		return false;
	} else if(isEmpty(cpwd)){
		document.getElementById("cpwdError").innerHTML = "";
		return false;
	}
	
	
	
}

function recpchaValidate(){
	var recapcha = document.getElementById("g-recaptcha-response").value;
	if(isEmpty(recapcha)){
		window.alert("Please check the recaptcha");
		return false;
	}
}

function isEmpty(val){
    return (val == undefined || val == null || val.length <= 0) ? true : false;
}

function isNotEmpty(val){
    return (val == undefined || val == null || val.length <= 0) ? false : true;
}