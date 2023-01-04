<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Expense Details</title>
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
			<h1 class="text-primary">Expense Details</h1>
			<a href="/expenses">Go Back</a>
		</div>
		
		<div class="row">
			<table class="table table-borderless">
				<tbody>
					<tr class="text-start">
						<td><strong>Expense Name:</strong></td>
						<td><c:out value="${expense.expenseName}"></c:out></td>
					</tr>
					<tr class="text-start">
						<td><strong>Vendor:</strong></td>
						<td><c:out value="${expense.vendorName}"></c:out></td>
					</tr>
					<tr class="text-start">
						<td><strong>Amount:</strong></td>
						<td>
							<fmt:setLocale value="en_US"/>
							<fmt:formatNumber value="${expense.amount}" type="currency"/>
						</td>
					</tr>
					<tr class="text-start">
						<td><strong>Description:</strong></td>
						<td><c:out value="${expense.description}"></c:out></td>
					</tr>
				</tbody>
			</table>
		</div>
		
	</div>

</body>
</html>