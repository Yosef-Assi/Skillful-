<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Login & Registration</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<main>
        <div class="container">
            <h2 class="text-center">Registration</h2>
            <form:form action="/tutor/register" method="post" modelAttribute="newTutor">
                <div class="mb-3">
                    <form:label for="fname" path="firstName" class="form-label">First Name</form:label>
                    <p class="text-danger small"><form:errors path="firstName"/></p>
                    <form:input type="text" path="firstName" id="fname" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="fname" path="lastName" class="form-label">Last Name</form:label>
                    <p class="text-danger small"><form:errors path="lastName"/></p>
                    <form:input type="text" path="lastName" id="fname" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="fname" path="username" class="form-label">Username</form:label>
                    <p class="text-danger small"><form:errors path="username"/></p>
                    <form:input type="text" path="username" id="fname" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="email" path="email" class="form-label">Email</form:label>
                    <p class="text-danger small"><form:errors path="email"/></p>
                    <form:input type="text" path="email" id="email" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="pw" path="password" class="form-label">Password</form:label>
                    <p class="text-danger small"><form:errors path="password"/></p>
                    <form:input type="password" path="password" id="pw" class="form-control"/>             
                </div>
                <div class="mb-3">
                    <form:label for="confirm" path="confirm" class="form-label">Confirm Password</form:label>
                    <p class="text-danger small"><form:errors path="confirm"/></p>
                    <form:input type="password" path="confirm" id="confirm" class="form-control"/>             
                </div>
                <div class="text-center">
                    <input type="submit" value="Register" class="btn btn-primary shadow-sm rounded">
                </div>
            </form:form>
        </div>
    </main>
</body>
</html>