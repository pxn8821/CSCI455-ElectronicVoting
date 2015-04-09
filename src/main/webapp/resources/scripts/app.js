/**
 * Created by Awelemdy Orakwue on 3/9/15.
 */
function formValidate(form) {
    var e = form.elements;

    /* Your validation code. */

    if(e['password'].value != e['confirm-password'].value) {
        alert('Your passwords do not match. Please type more carefully.');
        return false;
    }
    return true;
}


function validateAddElection(form){
    var e = form.elements;

    typesToCheck = ['electionName', 'electionChoice1', 'electionChoice2'];

    passed = true;
    for(i = 0; i < typesToCheck.length; i++){
        typeToCheck = typesToCheck[i];
        if(e[typeToCheck].value.trim() == ''){
            $(e[typeToCheck]).parents("div.form-group").addClass('has-error');
            passed = false;
        } else {
            $(e[typeToCheck]).parents("div.form-group").removeClass('has-error');
        }
    }


    return passed;
}