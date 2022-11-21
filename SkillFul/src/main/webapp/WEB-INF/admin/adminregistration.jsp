<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Admin Registration Page</title>
</head>
<body>
    <h1>Admin Registration</h1>
    
    <p><form:errors path="user.*"/></p>
    
    <form:form method="POST" action="/registration" modelAttribute="user">

            <form:label path="username">Username:</form:label>
            <form:input path="username"/>  
                     
            <form:label path="password">Password:</form:label>
            <form:password path="password"/>

            <form:label path="passwordConfirmation">Confirm Password:</form:label>
            <form:password path="passwordConfirmation"/>

        	<input type="submit" value="Register"/>
    </form:form>
</body>
</html>