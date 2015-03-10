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