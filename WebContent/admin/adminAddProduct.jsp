
<%@page
	contentType="text/html"
	pageEncoding="UTF-8"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<!DOCTYPE html>
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<title>JSP Page</title>
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
>
</head>
<body>
	<center>
		<form
			action="adminAddProductDb.jsp"
			method="post"
		>
			<table
				border="0"
				cellspacing="2"
				cellpadding="5"
				class="table-sm"
			>
				<thead>
					<tr>
						<th colspan="2" class="h4">Add Product</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label>Product name</label></td>
						<td><input
							type="text"
							name="pName"
						/></td>
					</tr>
					<tr>
						<td><label>Color </label></td>
						<td><input
							type="text"
							name="pColor"
						/></td>
					</tr>
					<tr>
						<td><label>Model</label></td>
						<td><input
							type="text"
							name="pModel"
						/></td>
					</tr>
					<tr>
						<td><input
						class="btn btn-primary"
							type="submit"
							value="Save"
						/></td>
						<td><input
							class="btn btn-primary"
							type="reset"
							value="reset"
						/></td>
					</tr>
				</tbody>
			</table>
		</form>
		<div><%@include file="adminDisplayProduct.jsp"%></div>
		<h6 style="margin-top:2rem">
			<a href="admin.jsp">Go Back</a>
		</h6>
		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
</body>
</html>
