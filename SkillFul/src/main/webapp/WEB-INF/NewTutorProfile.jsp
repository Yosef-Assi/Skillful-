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
    <title>Tutor Profile</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/main.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/jquery/jquery.min.js"></script>
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
	<div>
		<h1><c:out value="${tutorProfile.tutor.firstName}"></c:out> <c:out value="${tutorProfile.tutor.lastName}"></c:out></h1>
		<p>Location: <c:out value="${tutorProfile.location}"></c:out></p>
		<c:if test="${tutorProfile.online == true}">
			<p>Online lessons</p>
		</c:if>
		<h3>About <c:out value="${tutorProfile.tutor.firstName}"></c:out></h3>
		<p><c:out value="${tutorProfile.tutorDescription}"></c:out></p>
		<p>Member since: <fmt:formatDate type="both"  pattern="dd MMMMM, yyyy" value="${tutorProfile.createdAt}"/></p>
		<table class="table">
			<tr>
			<td>Subject</td>
			
			<th>${subjectsearch.subject.title}</th>
		
			</tr>
			<tr>
			<td>Levels</td>
			<td>${subjectsearch.level}</td>
			</tr>
			<tr>
			<td>Hourly Rate</td>

			<td>${subjectsearch.hourlyRate} NIS</td>
			</tr>
		</table>
		<button class="btn btn-dark"><a href="/student/send/email/${tutorProfile.tutor.id }">Contact</a></button>
		<button class="btn btn-dark"><a href="/student/session/new/${tutorProfile.tutor.id }">Book</a></button>
		
	</div>
</body>
</html>
