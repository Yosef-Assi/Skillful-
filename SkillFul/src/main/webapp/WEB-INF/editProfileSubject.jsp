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
	<link rel="stylesheet" href="/css/navbarCSS.css">
	<link rel="stylesheet" href="/css/filter.css">
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Raleway:wght@100;200;300;400;500;600;700&display=swap" rel="stylesheet">
</head>
<body>
	<nav class="navbar sticky-top navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <div class="logo">
                <img src="<c:url value="/images/project_logo.png"/>" alt="test"/>
            </div>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" aria-current="page" href="#">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">My Sessions</a>
                    </li>
                </ul>
                    <a href="/logout" class="logout">Logout</a>
            </div>
        </div>
    </nav>
    <main class="container mt-5" style="width:50%">
		<form:form action="/tutor/profile/${tutorProfile.id}/subject/${TutorProfileSubject.id}/edit" method="post" modelAttribute="TutorProfileSubject">
			<input type="hidden" name="_method" value="put">
			<h2>Edit ${TutorProfileSubject.subject.title}</h2>
			<div class="my-3">
				<form:label path="hourlyRate" class="form-label">Hourly Rate for this Subject</form:label>
				<form:errors path="hourlyRate" class="text-danger small"/>
				<form:input path="hourlyRate" class="form-control"/>
			</div>
			<div class="mb-3">
				<form:label path="level" class="form-label">Level</form:label>
				<form:select path="level" class="form-select">
				<form:errors path="level" class="text-danger small"/>
				<form:option value="">SELECT LEVEL</form:option>
				<form:options items="${levels}"/>
				</form:select>
			</div>
	   		<form:input type="hidden" path="tutorProfile" value="${tutorProfile.id}"/>
	   		<form:input type="hidden" path="subject" value="${TutorProfileSubject.subject.id}"/>
	   		<form:input type="hidden" path="id" value="${TutorProfileSubject.id}"/>
			<div class="text-center">
				<input type="submit" value="Submit" class="btn btn-outline-dark mb-3"/>
			</div>
		</form:form>
		<a href="/tutor/profile/${tutorProfile.id}/edit" style="color: black">Go Back</a>
    </main>

</body>
</html>
