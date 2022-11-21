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
  
  		<form action="/search" method="post">
        	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	
		<table>
			<tr>
				<td>
					<label id="name">search</label>
					<input name="search" class="form-control"/>
				</td>
			</tr>
		     <tr>
                    <td><p>Location</p></td>
						<td>	<select name="location" style="width:100%; margin-left:-100%;">
										<option value="None">None</option>
						  
							          	<option value="1">Ramallah</option>
									    <option value="2">Nablus</option>
										<option value="3">Jenin</option>
										<option value="4">Hebron</option>
										<option value="5">Tulkarm</option>
										<option value="6">Bethlehem</option>
										<option value="7">Qalqeliah</option>
										<option value="8">Tubas</option>
										<option value="9">Jericho</option>
										<option value="10">Jerusalem</option>
										<option value="11">Gaza</option>
										
							        </select> 
						</td>                    
                </tr>
                
                  <tr>
                    <td><p>Level</p></td>
						<td>	<select name="level" style="width:100%; margin-left:-100%;">
										<option value="All">All</option>
						  
							          	<option value="0">Beginner</option>
									    <option value="1">Intermediate</option>
									 	<option value="2">Advance</option>
									    <option value="3">All Level</option>

							        </select> 
						</td>                    
                </tr>
				
			<tr>
				<td>
					<input type="submit" class="form-control" value="Send">
				</td>
			</tr>
		
		</table>

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
        <td><a href="/tutor/profile/${skill[2] }/${skill[3]}"><c:out value="${skill[0]}"></c:out></a></td> 
        <td><c:out value="${skill[1]}"></c:out> </td>        
       
        </tr>
    </c:forEach>
    </tbody>
  </table>
  
</div>


    
    
</body>
</html>