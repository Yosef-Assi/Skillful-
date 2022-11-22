<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>My sessions</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
</head>
<body>
	<div class="container-md">
		<div class="d-flex justify-content-between align-items-center my-3">
			<div>
				<h1>My Session!</h1>
			</div>
			<div>
				<a href="/" class="btn btn-success btn-sm">Home</a>
				<a href="/" class="btn btn-success btn-sm">My Profile</a>
				<a href="/" class="btn btn-success btn-sm">LogOut</a>
			</div>
		</div>
		<table class="table table-striped">
			<thead>
			    <tr>
			      <th scope="col">Tutor Name</th>
			      <th scope="col">Start Date</th>
			      <th scope="col">End Date</th>
			      <th scope="col">Location</th>
			      <th scope="col">Action</th>
			      
			    </tr>
		    </thead>
		    <tbody>
		  		<c:forEach var="session" items="${mySession}">
		  		<tr>
		  		<td scope="row"> ${session.getTutor().firstName} </td>
			      <td scope="row">${session.startDate} </td>
			      <td>${session.endDate}</td>
			      <td>${session.getTutor().getTutorProfile().location}</td>
			      <td><a href="/student/delete/${session.id}">Delete </a> | <a href="/student/sessoion/edit/${session.id}">Edit </a></td>
			    </tr>
		   		</c:forEach>
		  	</tbody>
		  </table>
	 </div>
	      
      
   	  <script src="/webjars/jquery/jquery.min.js"></script>
   	  <script src="/webjars/bootstrap/js/bootstrap.min.js"></script> 	
</body>
</html>