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
		<h3>About the lesson</h3>
		<p><c:out value="${tutorProfile.lessonDescription}"></c:out></p>
		<p>Member since: <fmt:formatDate type="both"  pattern="dd MMMMM, yyyy" value="${tutorProfile.createdAt}"/></p>
		<table>
			<tr>
			<td>Subjects</td>
			<c:forEach var="subject" items="${profileSubjects}">
			<th>${subject.subject.title}</th>
			</c:forEach>
			</tr>
			<tr>
			<td>Levels</td>
			<c:forEach var="subject" items="${profileSubjects}">
			<td>${subject.level}</td>
			</c:forEach>
			</tr>
			<tr>
			<td>Hourly Rate</td>
			<c:forEach var="subject" items="${profileSubjects}">
			<td>${subject.hourlyRate} NIS</td>
			</c:forEach>
			</tr>
		</table>
	</div>
</body>
</html>
