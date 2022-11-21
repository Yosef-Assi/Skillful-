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
    <title>What would you like to teach?</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
   <div>
		<h1>Add a Subject you would like to teach: </h1>
		<form:form action="/tutor/profile/${tutorProfile.id}/subjects" method="post" modelAttribute="TutorProfileSubject">
			<div>
				<form:select path="subject" class="form-select">
				<form:option value="">SELECT SUBJECT</form:option>
				<c:forEach var="subject" items="${subjects}">
				<form:option value="${subject.id}" label="${subject.title}"/>
				</c:forEach>
				</form:select>
			</div>
			<div>
				<form:label path="hourlyRate" class="form-label">Hourly Rate for This Subject</form:label>
				<form:errors path="hourlyRate" class="text-danger small"/>
				<form:input path="hourlyRate"/>
			</div>
			<div>
				<form:select path="level" class="form-select">
				<form:errors path="level" class="text-danger small"/>
				<form:option value="">SELECT LEVEL</form:option>
				<form:options items="${levels}"/>
				</form:select>
			</div>
	   		<form:input type="hidden" path="tutorProfile" value="${tutorProfile.id}"/>
			<input type="submit" value="Submit"/>
		</form:form>
		<a href="/tutor/profile/${tutorProfile.id}">Done</a>
	</div>
</body>
</html>
