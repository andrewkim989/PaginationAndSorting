<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<title>Pagination and Sorting- Ninjas</title>
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
		#links a {
			margin-left: 180px;
			font-size: 20px;
		}
		#pages {
			text-align: center;
			font-size: 24px;
		}
		#pages a {
			margin-left: 10px;
		}
	</style>
</head>
<body>
	<div id = "ninjas">
	    <h1>Ninjas</h1>
	    
	    <div id = "links">
		    <a href = "/">Click here to view all the dojos and ninjas</a>
			<a href = "/dojos/1">Click here to view the dojos in alphabetical order</a>
	    </div>
	    
	    <table class = "table table-striped table-bordered table-hover">
	        <thead>
	        	<tr class = "table-primary">
		        	<th>First Name</th>
		            <th>Last Name</th>
	        	</tr>
	        </thead>
	        <tbody>
	            <c:forEach var = "ninja" items = "${ninjas.content}">                 
	            <tr>
	                <td>${ninja.firstName}</td>
	                <td>${ninja.lastName}</td>
	            </tr>
	            </c:forEach>
	        </tbody>
	    </table>
	    
	    <div id = "pages">
			<c:forEach begin = "1" end = "${totalPages}" var = "index">
		        <a href = "/ninjas/${index}">${index}</a>
		    </c:forEach>
		</div>
	</div>
</body>
</html>