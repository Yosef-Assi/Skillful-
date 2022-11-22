<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Bokking a session</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="container-md">
		<div class="d-flex justify-content-between align-items-center my-3">
			<div>
				<h1>Book a Session!</h1>
			</div>
			<div>
				<a href="/" class="btn btn-success btn-sm">Home</a>
				<a href="/" class="btn btn-success btn-sm">My Profile</a>
				<a href="/" class="btn btn-success btn-sm">LogOut</a>
			</div>
		</div>
		<form:form class="container-md w-75" action="/session/new" method="post" modelAttribute="newSession">
		
			<form:errors path="startDate" class="fw-bold text-danger d-block"/>
        	<form:label path="startDate" for="startDate" class="fs-5 fw-bold text-success d-inlineblock">Start Date:</form:label>
        	<form:input path="startDate" type="date" class="form-control mb-3" id="startDate"/>
        	
        	<form:errors path="endDate" class="fw-bold text-danger d-block"/>
        	<form:label path="endDate" for="endDate" class="fs-5 fw-bold text-success">End date:</form:label>
        	<form:input path="endDate" type="date" class="form-control mb-3" id="endDate" />
        	
        	<form:input type="hidden" path="user" value="${userId}"/>
        	<input type="submit" value="Confirm" class="btn btn-success btn-sm">
        </form:form>
      </div>
      
      
   	  <script src="/webjars/jquery/jquery.min.js"></script>
   	  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 	
</body>
</html>