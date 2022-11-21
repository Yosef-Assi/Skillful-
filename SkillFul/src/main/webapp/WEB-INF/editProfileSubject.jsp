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
    <title>Edit Subject</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
	<form:form action="/tutor/profile/${tutorProfile.id}/subject/${TutorProfileSubject.id}/edit" method="post" modelAttribute="TutorProfileSubject">
			<input type="hidden" name="_method" value="put">
			<div>
				<form:select path="subject" class="form-select">
				<form:option value="">SELECT SUBJECT</form:option>
				<c:forEach var="subject" items="${subjects}">
				<form:option value="${subject.id}" label="${subject.title}"/>
				</c:forEach>
				</form:select>
			</div>
			<div>
				<form:label path="hourlyRate" class="form-label">Hourly Rate for this Subject</form:label>
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
	   		<form:input type="hidden" path="id" value="${TutorProfileSubject.id}"/>
			<input type="submit" value="Submit"/>
		</form:form>
		<a href="/tutor/profile/${tutorProfile.id}/edit">Go Back</a>
	</div>
</body>
</html>
