
<%@page
	contentType="text/html"
	pageEncoding="UTF-8"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>JSP Page</title>
</head>
<body>
<center>
	<form
		action="userRegisterProductDb.jsp?username=<c:out value="${param.username}"/>&&pId=<c:out value="${param.pId}"/>&&pName=<c:out value="${param.pName}"/>&&color=<c:out value="${param.color}"/>&&model=<c:out value="${param.model}"/>"
		method="post"
	>
		<table
			border="0"
			cellspacing="2"
			cellpadding="5"
		>
			<thead>
				<tr>
					<th class="h4">Register Product</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><label>Username</label></td>
					<td><c:out value="${param.username}"/></td>
				</tr>
				<tr>
					<td><label>Product name</label></td>
					<td><c:out value="${param.pName}"/></td>
				</tr>
				<tr>
					<td><label>Color</label></td>
					<td><c:out value="${param.color}"/></td>
				</tr>
				<tr>
					<td><label>Model</label></td>
					<td><c:out value="${param.model}"/></td>
				</tr>
				<tr>
					<td><label>Serial number </label></td>
					<td><input
						type="text"
						name="sNum"
					/></td>
				</tr>
				<tr>
					<td><label>purchase date</label></td>
					<td><input
						type="date"
						name="pDate"
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
	</form><br/>
		<h6>
			<a
				href="userRegisterProduct.jsp?username=<c:out value="${param.username}"/>"
			>Go Back</a>
		</h6>
		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if
				test="${not empty param.susMsg}"
			>
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
</body>
</html>
