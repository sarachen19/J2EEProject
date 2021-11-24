
<%@page
	contentType="text/html"
	pageEncoding="UTF-8"
%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/sql"
	prefix="sql"
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
			action="adminUpdateProductDb.jsp?pId=<c:out value="${param.pId}"/>"
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
						<th
							colspan="2"
							class="h4"
						>Update Product</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><label>Product name</label></td>
						<td><input
							type="text"
							name="pName"
							value="${param.pName}"
						/></td>
					</tr>
					<tr>
						<td><label>Color </label></td>
						<td><input
							type="text"
							name="pColor"
							value="${param.color}"
						/></td>
					</tr>
					<tr>
						<td><label>Model</label></td>
						<td><input
							type="text"
							name="pModel"
							value="${param.model}"
						/></td>
					</tr>
					<tr>
						<td><input
							type="submit"
							value="Save"
							class="btn btn-primary"
						/></td>
						<td><input
							type="reset"
							value="reset"
							class="btn btn-primary"
						/></td>
					</tr>
				</tbody>
			</table>
		</form>
		<h6 style="margin-top: 2rem">
			<a href="adminAddProduct.jsp">Go Back</a>
		</h6>
		<font color="red"> <c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if>
		</font> <font color="green"> <c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
				<a href="adminDisplayProduct.jsp">Go Back</a>
			</c:if></font>
	</center>
</body>
</html>
