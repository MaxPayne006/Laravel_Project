function validation(event){
    var v = true;
    var username = document.getElementById("contactName");
    var email = document.getElementById("contactEmail");

    function displayError(elementId, message) {
        document.getElementById(elementId).innerHTML = message;
        var formGroup = document.getElementById(elementId).parentElement;
        var input = formGroup.querySelector("input");
        input.className = "form-control border-error-line";

        v = false;
        
    }

    function displaySuccess(elementId, message){
        var formGroup = document.getElementById(elementId).parentElement;
        var input = formGroup.querySelector("input");
        input.className = "form-control";
        document.getElementById(elementId).innerHTML = message;
    }


    //Validate Name
    if (username.value == "" || username.value == null) {
        displayError("nameErr", "Please enter your name");
    } else{
        var regex = /^[a-zA-Z\s]+$/;
        if (regex.test(username.value) === false) {
            displayError("nameErr", "Please enter a valid name");
        } else {
            displaySuccess("nameErr", "");
        }
    }


    //Validate Email
    if (email.value == "" || email.value == null){
        displayError("emailErr", "Please enter your email address");
    } else{
        var regex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
        if (regex.test(email.value) === false){
            displayError("emailErr", "Please enter a valid email address");
        } else {
            displaySuccess("emailErr", "");
        }
    }
    if(!v){
        event.preventDefault();
    }
}