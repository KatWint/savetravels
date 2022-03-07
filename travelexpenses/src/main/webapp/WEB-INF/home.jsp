<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body>
<h1>Save Travels</h1>
<table class="table table-dark">
<thead>
	<tr>
		<th>Expense Name</th>
		<th>Amount</th>
		<th>Vendor</th>
		<th>Description</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${expenses}" var="expense">
	<tr>
	<td>${expense.name}</td>
	<td>${expense.amount}</td>
	<td>${expense.vendor}</td>
	<td>${expense.description}</td>
	<td>
	
	<a href="/edit/${expense.id}">Edit</a>
	<%-- <a href="/delete/${expenses.id}">Delete</a>
	 --%>
	 <form:form action="/delete/${expenses.id}" method="delete">
		<button>Delete</button>	 
	 </form:form>
	 
	</td>
	
	</tr>
	</c:forEach>
</tbody>

</table>
<form:form action="/newexpense" method="post" modelAttribute="expenses">
	<p>
        <form:label path="name">Expense Name</form:label>
        <form:errors path="name"/>
        <form:input path="name"/>
    </p>
    <p>
        <form:label path="vendor">Vendor</form:label>
        <form:errors path="vendor"/>
        <form:input path="vendor"/>
    </p>
    <p>
        <form:label path="amount">Amount</form:label>
        <form:errors path="amount"/>     
        <form:input type="number" path="amount"/>
    </p>    
    <p>
        <form:label path="description">Description</form:label>
        <form:errors path="description"/>
        <form:textarea path="description"/>
    </p>
    <input type="submit" value="Submit"/>
</form:form>    
</body>
</html>