<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Registration</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" href="/css/loginreg.css">
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	<main>
        <div class="container my-5 login-reg p-5">
            <h1 class="text-center">Registration</h1>
            <form:form action="/student/register" method="post" modelAttribute="newStudent">
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
                <div class="d-grid gap-2">
                    <input type="submit" value="Register" class="btn btn-dark btn-lg shadow-sm rounded mt-3">
                </div>
            </form:form>
        </div>
    </main>
</body>
</html>