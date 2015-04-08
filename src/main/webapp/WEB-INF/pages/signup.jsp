<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="wrapper">
    <form class="form-signin" action="/signup-go" method="post" onsubmit="return formValidate(this);">
        <h2 class="form-signin-heading">Sign up</h2>
        <c:if test="${message eq 'passwordsnotequal'}">
            <span style="color: red">Passwords do not match</span>
        </c:if>
        <c:if test="${message eq 'notemail'}">
            <span style="color: red">Invalid email address</span>
        </c:if>
        <c:if test="${message eq 'emailexists'}">
            <span style="color: red">Email address exists</span>
        </c:if>
        <c:if test="${message eq 'nopassword'}">
            <span style="color: red">Please enter a password</span>
        </c:if>
        <input type="text" class="form-control" name="username" placeholder="Email Address" required="" autofocus="" />
        <input type="password" class="form-control" name="password1" placeholder="Create your password" required="" value=""/>
        <input type="password" class="form-control" name="password2" placeholder="Confirm your password" required="" value=""/>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign up</button>
    </form>
</div>
