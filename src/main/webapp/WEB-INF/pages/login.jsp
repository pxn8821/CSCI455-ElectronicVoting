<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <div class="wrapper">

        <form class="form-signin" name='f' action="<c:url value='j_spring_security_check' />" method='POST'>
            <h2 class="form-signin-heading">Please login</h2>
            <c:if test="${message eq 'failedlogin'}">
                <span style="color: red">Incorrect Username or Password!</span>
            </c:if>
            <c:if test="${message eq 'registrationsuccess'}">
                <span style="color: green">Registration success, please login.</span>
            </c:if>

            <input type="text" class="form-control" name="j_username" placeholder="Username" required="" autofocus="" />
            <input type="password" class="form-control" name="j_password" placeholder="Password" required=""/>

            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        </form>
    </div>

<script src="resources/scripts/app.js"></script>
</body>
</html>