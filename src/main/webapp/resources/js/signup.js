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


function validateEmployer() {
    var companyName = document.getElementById("companyName").value;
    var companyId = document.getElementById("companyId").value;
    var passcode = document.getElementById("passcode").value;
    var cPasscode = document.getElementById("cPasscode").value;
    var isSignUpEmployerButtonEnable = false;
	
    isSignUpEmployerButtonEnable = checkCompanyNameRegex(companyName);
	
    isSignUpEmployerButtonEnable = isSignUpEmployerButtonEnable && checkCompanyIdRegex(companyId);
    
    isSignUpEmployerButtonEnable = isSignUpEmployerButtonEnable && checkPasscodeRegex(passcode);
    
    isSignUpEmployerButtonEnable = isSignUpEmployerButtonEnable && passcodeMatch(passcode, cPasscode);
    
	if(isSignUpEmployerButtonEnable) {
		$("#signUpEmployerButtonId").attr("disabled",false);
	} else{
		$("#signUpEmployerButtonId").attr("disabled",true);
	}
}

function passcodeMatch(passcode, cPasscode){
	if(passcode === cPasscode) {
		document.getElementById("cPasscodeError").innerHTML = "";
		return true;
	} else if(isEmpty(passcode) && isNotEmpty(cPasscode)){
		document.getElementById("cPasscodeError").innerHTML = "Please Enter Password First";
		return false;
	} else if (!(passcode == cPasscode) && !isEmpty(cPasscode)){
		document.getElementById("cPasscodeError").innerHTML = "Passwords are not Matched";
		return false;
	} else if(isEmpty(cPasscode)){
		document.getElementById("cPasscodeError").innerHTML = "";
		return false;
	}	
}

function checkPasscodeRegex(passcode) {
	
	var regex = /^(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{6,16}$/;
	
	if (regex.test(passcode)) {
		document.getElementById("passcodeError").innerHTML = "";
		return true;
	} else if(isEmpty(passcode)){
		document.getElementById("passcodeError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("passcodeError").innerHTML = "Must have one Lower/Upper/Numeric/SplChar";
		return false;
	}
}

function checkCompanyIdRegex(companyId) {
	
	var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	
	if (regex.test(companyId)) {
		document.getElementById("companyIdError").innerHTML = "";
		return true;
	} else if(isEmpty(companyId)){
		document.getElementById("companyIdError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("companyIdError").innerHTML = "Enter Valid EmailId";
		return false;
	}
}

function checkCompanyNameRegex(companyName) {
	
	var regex = new RegExp("^([a-zA-Z ]{6,20})$");
	
	if (regex.test(companyName)) {
		document.getElementById("companyNameError").innerHTML = "";
		return true;
	} else if(isEmpty(companyName)){
		document.getElementById("companyNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("companyNameError").innerHTML = "Enter Valid Name";
		return false;
	}
}

function checkFirstNameRegex(firstName) {
	
	var regex = new RegExp("^([a-zA-Z ]{2,20})$");
	
	if (regex.test(firstName)) {
		document.getElementById("firstNameError").innerHTML = "";
		return true;
	} else if(isEmpty(firstName)){
		document.getElementById("firstNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("firstNameError").innerHTML = "Enter Valid Name";
		return false;
	}
}

function checkLastNameRegex(lastName) {
	
	var regex = new RegExp("^([a-zA-Z ]{2,20})$");
	
	if (regex.test(lastName)) {
		document.getElementById("lastNameError").innerHTML = "";
		return true;
	} else if(isEmpty(lastName)){
		document.getElementById("lastNameError").innerHTML = "";
		return false;
	}
	else{
		document.getElementById("lastNameError").innerHTML = "Enter Valid Name";
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
		$('#recapchaId').modal('show');
		return false;
	} else{
		return true;
	}
	
}

function clearOnCancel(){
	document.getElementById("signUpForm").reset();
}

function clearOnCancelEmployer(){
	document.getElementById("employerSignUpForm").reset();
}

function isEmpty(val){
    return (val == undefined || val == null || val.length <= 0 || val == "" || val ==" " ) ? true : false;
}

function isNotEmpty(val){
    return (val == undefined || val == null || val.length <= 0 || val == "" || val ==" ") ? false : true;
}

function validateUserExistance() {

	var mail = $("#signUpEmail").val().toString();
	$.post("existance", {
		"EmailId" : mail
	},
	function(data, status, jqXHR){ //this will be executed always
		var statusCode = jqXHR.status.toString();  //gives statusCode
		responseCallback(data.flag.toString(), status, jqXHR);
	}
	);
}

function responseCallback(flag, status, jqXHR) {
	//if User is Exist or Service returns Exception, then we should show Alert with oops User has already account, Please Login, 
	//If you do not have, Please contact the Site.
	//based on conditions we are assigning new value to emailIdFlag variable.
	if(flag == "FALSE"){
		emailIdFlag = true;
	} else {
		emailIdFlag = false;
	}
}