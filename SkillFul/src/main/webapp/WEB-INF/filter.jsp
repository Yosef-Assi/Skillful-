<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome Page</title>
 <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
    <h1>Welcome Page <c:out value="${currentUser.username}"></c:out></h1>
    
    <form id="logoutForm" method="POST" action="/logout">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <input type="submit" value="Logout!" />
    </form>
    <div class="container mt-3">
  <h2>Filterable Table</h2>
  
  	<form action="/search" method="POST">
  	   <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
			 <select class="form-select form-select-sm" name="filter">
					  <option selected>Open this select menu</option>
					  <option value="level">level</option>
					  <option value="skill">skill</option>
					  <option value="location">location</option>
			</select>
			<input class="form-control" id="myInput" type="text" placeholder="Search.." name="search">
			<input type="submit" value="Search" class="btn btn-primary">
		</form>
  
  <br>
 
  <table class="table table-bordered">
    <thead>
      <tr>
        <th>First name</th>
        <th>Last name</th>
      </tr>
    </thead>
    <tbody>	
        <c:forEach var="skill" items="${skills}">
    	<tr>
        <td><c:out value="${skill[0]}"></c:out> </td>        
        <td><c:out value="${skill[1]}"></c:out> </td>        
       
        </tr>
    </c:forEach>
    </tbody>
  </table>
  
</div>


    
    
</body>
</html>