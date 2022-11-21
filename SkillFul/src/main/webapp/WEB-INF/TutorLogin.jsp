<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<main>
		<div class="container">
            <h2 class="text-center">Login</h2>
            <form:form action="/tutor/login" method="post" modelAttribute="newLogin">
                <div class="mb-3">
                    <form:label for="login-email" path="email" class="form-label">Email</form:label>
                    <p class="text-danger small"><form:errors path="email"/></p>
                    <form:input type="text" path="email" id="login-email" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="login-pw" path="password" class="form-label">Password</form:label>
                    <p class="text-danger small"><form:errors path="password"/></p>
                    <form:input type="password" path="password" id="login-pw" class="form-control"/>             
                </div>
                <div class="text-center">
                    <input type="submit" value="Log In" class="btn btn-primary shadow-sm rounded">
                </div>
            </form:form>
        </div>
	</main>
</body>
</html>