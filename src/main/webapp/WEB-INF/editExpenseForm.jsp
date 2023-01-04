<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Expense</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container col-lg-5 mt-4">
		
		<div class="d-flex flex-row justify-content-between align-items-center mb-4">
			<h1 class="text-success">Edit Expense</h1>
			<a href="/expenses">Go Back</a>
		</div>
		
		<div class="row my-4">
			<form:form action="/expenses/edit/${expense.id}" method="POST" modelAttribute="expense">
				
				<input type="hidden" name="_method" value="put"/>
				
				<div class="row mb-2">
					
					<form:label path="expenseName" class="col-sm-3 col-form-label">Expense Name:</form:label>
					
					<div class="col-sm-9">
						<form:input type="text" class="form-control" path="expenseName"/>
					</div>
					
					<div class="row">
						<form:errors class="mt-2 mb-4 text-danger" path="expenseName"/>
					</div>
					
				</div>
				
				<div class="row my-2">
				
					<form:label path="vendorName" class="col-sm-3 col-form-label">Vendor:</form:label>
					
					<div class="col-sm-9">
						<form:input type="text" class="form-control" path="vendorName"/>
					</div>
					
					<div class="row">
						<form:errors class="mt-2 mb-4 text-danger" path="vendorName"/>
					</div>
					
				</div>
				
				<div class="row mb-4">
				
					<form:label path="amount" class="col-sm-3 col-form-label">Amount:</form:label>
					
					<div class="col-sm-9">
						<form:input type="text" class="form-control" path="amount"/>
					</div>
					
					<div class="row">
						<form:errors class="mt-2 mb-4 text-danger" path="amount"/>
					</div>
					
				</div>
				
				<div class="row mb-4">
				
					<form:label path="description" class="col-sm-3 col-form-label">Description:</form:label>
					
					<div class="col-sm-9">
						<form:textarea class="form-control" path="description" rows="4"/>
					</div>
					
					<div class="row">
						<form:errors class="mt-2 text-danger" path="description"/>
					</div>
					
				</div>
				
				<div class="row mb-4 justify-content-end">
					<input type="submit" class="btn btn-primary col-sm-2" value="Submit"/>
				</div>
				
			</form:form>
		</div>
		
	</div>

</body>
</html>