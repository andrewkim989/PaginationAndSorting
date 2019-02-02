<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<title>Pagination and Sorting- Dojos</title>
	<style>
		.table {
			width: 600px;
			margin: auto;
			margin-top: 20px;
		}
		h1 {
			text-align: center;
			margin-top: 20px;
		}
		a {
			margin-left: 180px;
			font-size: 20px;
		}
		#pages {
			text-align: center;
		}
		#pages a {
			margin-left: 10px;
			font-size: 24px;
		}
	</style>
</head>
<body>
	<div id = "ninjas">
	    <h1>Dojos</h1>
	    
	    <a href = "/">Click here to view all the dojos and ninjas</a>
		<a href = "/ninjas/1">Click here to view the ninjas in alphabetical order</a>

	    <table class = "table table-striped table-bordered table-hover">
	        <thead>
	        	<tr class = "table-success">
		        	<th>Dojo name</th>
		            <th>Ninja first name</th>
		            <th>Ninja last name</th>
	        	</tr>
	        </thead>
	        <tbody>
	            <c:forEach var = "dojo" items = "${dojos.content}">                 
	            <tr>
	            	<td>${dojo[0].name}</td>
		            <td>${dojo[1].firstName}</td>
		            <td>${dojo[1].lastName}</td>
	            </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    
	    <div id = "pages">
			<c:forEach begin = "1" end = "${totalPages}" var = "index">
		        <a href = "/dojos/${index}">${index}</a>
		    </c:forEach>
		</div>
	</div>
</body>
</html>