<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %> <!-- I referred to https://www.tutorialspoint.com/jsp/jstl_format_formatnumber_tag.htm for help with formatting currency using JSTL tags-->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Save Travels</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css"/>
<!-- For any Bootstrap that uses JS or jQuery-->
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>

	<div class="container col-lg-6 mt-4">
	
		<div class="row">
			<h1 class="text-primary">Save Travels</h1>
			<table class="table table-striped table-hover table-bordered my-4">
				<thead>
					<tr class="text-center align-middle">
						<th>Expense</th>
						<th>Vendor</th>
						<th>Amount</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="expense" items="${allExpenses}">
						<tr class="text-center align-middle">
							<td><a href="/expenses/${expense.id}"><c:out value="${expense.expenseName}"></c:out></a></td>
							<td><c:out value="${expense.vendorName}"></c:out></td>
							<td>
								<fmt:setLocale value="en_US"/>
								<fmt:formatNumber value="${expense.amount}" type="currency"/>
							</td>
							<td class="d-flex flex-row align-items-center justify-content-center">
								<a href="/expenses/edit/${expense.id}"><button type="button" class="btn btn-success me-2">Edit</button></a>
								<form action="/expenses/delete/${expense.id}" method="POST">
									<input type="hidden" name="_method" value="delete"/>
									<input type="submit" class="btn btn-danger ms-2" value="Delete"/>
								</form>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>
	
	<div class="container col-lg-5 mt-4">
	
		<div class="row">
			<h2 class="text-primary">Add an Expense</h2>
		</div>
		
		<div class="row mt-4 mb-4">
			
			<form:form action="/expenses/add" method="POST" modelAttribute="expense">
				
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