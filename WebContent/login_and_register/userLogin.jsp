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
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
>
<title>JSP Page</title>
</head>
<body>
<c:if test="${empty param.admin}">
	<center>
		<h3>Log in</h3>
		<form method="post">
			<div class="form-group">
				<p>Username</p>
				<input
					type="text"
					name="username"
				/>
			</div>
			<div class="form-group">
				<p>Password</p>
				<input
					type="password"
					name="password"
				/>
			</div>
			<input
				class="btn btn-primary"
				type="submit"
				value="  Login  "
				onclick="form.action='userLoginDb.jsp';"
			/> <input
				class="btn btn-primary"
				type="submit"
				value="Register"
				onclick="form.action='insertUser.jsp';"
			/>
		</form>
		<h4><a href="../index.jsp">Go Back</a></h4> 
		<font
			color="red"
			size="+1"
		><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
</c:if>


<c:if test="${param.admin == 'true'}">
	<center>
		<h3>Admin log in</h3>
		<form method="post">
			<div class="form-group">
				<p>Username</p>
				<input
					type="text"
					name="username"
				/>
			</div>
			<div class="form-group">
				<p>Password</p>
				<input
					type="password"
					name="password"
				/>
			</div>
			<input
				class="btn btn-primary"
				type="submit"
				value="  Login  "
				onclick="form.action='userLoginDb.jsp?admin=true';"
			/>
		</form>
		<h4><a href="../index.jsp">Go Back</a></h4> 
		<font
			color="red"
			size="+1"
		><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
</c:if>


</body>
</html>
