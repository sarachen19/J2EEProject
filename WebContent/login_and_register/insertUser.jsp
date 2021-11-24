<%@ page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<title>User Registration Form</title>
</head>
<body>
	<center>
	<h3>Register</h3>
	<form
		action="insertUserDb.jsp"
		method="post"
	>
		<table style="with: 50%">
			<tr>
				<td>First Name</td>
				<td><input
					type="text"
					name="first_name"
				/></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input
					type="text"
					name="last_name"
				/></td>
			</tr>
			<tr>
				<td>UserName</td>
				<td><input
					type="text"
					name="username"
				/></td>
			</tr>
			<tr>
				<td>Password</td>
				<td><input
					type="password"
					name="password"
				/></td>
			</tr>
			<tr>
				<td>Address</td>
				<td><input
					type="text"
					name="address"
				/></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input
					type="text"
					name="email"
				/></td>
			</tr>
			<tr>
				<td>Contact No</td>
				<td><input
					type="text"
					name="contact"
				/></td>
			</tr>
		</table>
		<input
			class="btn btn-primary"
			type="submit"
			value="Register"
		/>
	</form>
	<h4><a href="userLogin.jsp">Go Back</a></h4>
    <font color="red"  size="+1"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
        </c:if></font>
	<font color="green"><c:if test="${not empty param.susMsg}">
			<c:out value="${param.susMsg}" />
		</c:if></font>
	</center>
</body>
</html>