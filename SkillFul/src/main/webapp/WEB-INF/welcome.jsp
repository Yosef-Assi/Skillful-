<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<title>Welcome!</title>
	<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container">
		<h1>Welcome, ${thisTutor.username}</h1>
		<p>This is your dashboard. Nothing to see here yet.</p>
		<p><a href="/logout">Logout</a></p>
	</div>
</body>
</html>