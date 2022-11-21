<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- Formatting (dates) --> 
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Create Tutor Profile</title>
</head>
<body>
	<form:form action="/tutor/profile/create" method="post" modelAttribute="TutorProfile">
		<div>
			<form:label path="location" class="form-label">Your Location</form:label>
			<form:select path="location" class="form-select">
				<form:option value="">SELECT LOCATION</form:option>
				<form:options items="${locations}"></form:options>
			</form:select>
		</div>
		<div>
			<form:checkbox path="online" value="true" class="form-control"/>
			  <label class="form-check-label" for="flexCheckDefault">
   			  I want to teach online
  			  </label>
		</div>
		<div>
			<form:label path="tutorDescription" class="form-label">Tell us About Yourself</form:label>
	        <form:errors path="tutorDescription" class="text-danger small"/>
	        <form:textarea path="tutorDescription" class="form-control"/>
		</div>
		<div>
			<form:label path="lessonDescription" class="form-label">Tell us About Your Teaching Style and your typical lesson</form:label>
	        <form:errors path="lessonDescription" class="text-danger small"/>
	        <form:textarea path="lessonDescription" class="form-control"/>
		</div>
		<form:input type="hidden" path="tutor" value="${tutorId}"/>
		<input type="submit" value="Create Profile"/>
	</form:form>
</body>
</html>