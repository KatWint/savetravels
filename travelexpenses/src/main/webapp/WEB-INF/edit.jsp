<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<h1 class="title"> Edit </h1>
	<p><c:out value="${expenses.name}"></c:out></p>
<form:form action="/edit/${expenses.id}" method="put" modelAttribute="editExpense">
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
</body>
</html>