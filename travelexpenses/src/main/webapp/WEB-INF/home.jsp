<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link rel="stylesheet" href="/css/main.css"/>
<title>Insert title here</title>
</head>
<body>
<div class="container">
<h1 class="title">Save Travels</h1>
<table class="table table-success table-striped">
<thead>
	<tr>
		<th>Expense Name</th>
		<th>Amount</th>
		<th>Vendor</th>
		<th>Description</th>
		<th>Action</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${expenseList}" var="expense">
	<tr>
	<td>${expense.name}</td>
	<td>${expense.amount}</td>
	<td>${expense.vendor}</td>
	<td>${expense.description}</td>
	<td>
	
	<a href="/edit/${expense.id}">Edit</a>
	<%-- <a href="/delete/${expenses.id}">Delete</a>
	 --%>
	 <form:form action="/delete/${expense.id}" method="delete">
		<button type="button" class="btn btn-danger">Delete</button> 
	 </form:form>
	 
	</td>
	
	</tr>
	</c:forEach>
</tbody>

</table>
</div>
<div class="container">
<h3 class="title">Add a new Expense</h3>
<form:form action="/newexpense" method="post" modelAttribute="expenses">
	<p>
        <form:label path="name">Expense Name</form:label>
        <form:errors path="name"/>
        <form:input path="name" class="form-control"/>
    </p>
    <p>
        <form:label path="vendor">Vendor</form:label>
        <form:errors path="vendor"/>
        <form:input path="vendor" class="form-control"/>
    </p>
    <p>
        <form:label path="amount">Amount</form:label>
        <form:errors path="amount"/>     
        <form:input type="amount" path="amount" class="form-control"/>
    </p>    
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>
        <form:textarea path="description" class="form-control"/>
    </p>
    <input type="submit" value="Submit" class="button"/>
</form:form>    
</div>
</body>
</html>