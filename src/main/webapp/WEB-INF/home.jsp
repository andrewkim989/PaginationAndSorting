<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
	<title>Dojos and Ninjas</title>
	<style>
		#wrapper {
			padding: 25px;
			padding-left: 30px;
			padding-bottom: 40px;
		}
		h1 {
			text-align: center;
		}
		a {
			margin-left: 140px;
			font-size: 20px;
		}
		.table {
			width: 1000px;
			margin: auto;
			margin-top: 20px;
		}
	</style>
</head>
<body>
	<div id = "wrapper">
		<h1>Dojos and Ninjas</h1><br/>
		<a href = "/ninjas/1">Click here to view the ninjas in alphabetical order</a>
		<a href = "/dojos/1">Click here to view the dojos in alphabetical order</a>
		
		<table class = "table table-bordered table-hover">
		    <thead class = "table-active">
		    	<tr>
			    	<th>Dojo name</th>
			        <th>Ninja first name</th>
			        <th>Ninja last name</th>
		    	</tr>
		    </thead>
		    <tbody>
		        <c:forEach var = "row" items = "${table}">                
		        <tr>
		            <td>${row[0].name}</td>
		            <td>${row[1].firstName}</td>
		            <td>${row[1].lastName}</td>
		        </tr>
		        </c:forEach>
		    </tbody>
		</table>
	</div>
</body>
</html>