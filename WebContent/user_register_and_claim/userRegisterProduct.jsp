
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/sql"
	prefix="sql"
%>
<html>
<head>
<title>SELECT Operation</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
</head>
<body>

	<sql:setDataSource
		var="dbsource"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false"
		user="root"
		password="12345"
	/>
<c:if test="${not empty param.username}">
	<sql:query
		dataSource="${dbsource}"
		var="result"
	>
            SELECT * from product;
        </sql:query>
	<center>
		<h3>
			Welcome!
			<c:out value="${param.username }" />
		</h3><br/>
		<form>
			<table
				class="table-sm table-striped"
				border="1"
				width="60%"				
			>
				<h4>Register for a product</h4>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Color</th>
					<th>Model</th>
					<th>Action</th>
				</tr>
				<c:forEach
					var="row"
					items="${result.rows}"
				>
					<tr>
						<td><c:out value="${row.productId}" /></td>
						<td><c:out value="${row.productName}" /></td>
						<td><c:out value="${row.color}" /></td>
						<td><c:out value="${row.model}" /></td>
						<td><a
							href="userRegisterProduct2.jsp?username=<c:out value="${param.username}"/>&&pId=<c:out value="${row.productId}"/>&&pName=<c:out value="${row.productName}"/>&&color=<c:out value="${row.color}"/>&&model=<c:out value="${row.model}"/>"
						>Register</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<h6>
			<a
				href="userClaimProductList.jsp?username=<c:out value="${param.username}"/> "
			>My Registered Products</a>
		</h6>
		<h6>
			<a
				href="settings.jsp?username=<c:out value="${param.username}"/> "
			>Settings</a>
		</h6>
		<h6><a href="../index.jsp">Log out</a></h6> 
		<font color="red"><c:if
				test="${not empty param.errMsg}"
			>
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
	</c:if>
	
	
	
	<c:if test="${empty param.username}">
	<sql:query
		dataSource="${dbsource}"
		var="result2"
	>
            SELECT * from product;
        </sql:query>
	<center>
		<h3>
			Welcome!
			<c:out value="${param.username }" />
		</h3><br/>
		<form>
			<table
				class="table-sm table-striped"
				border="1"
				width="60%"				
			>
				<h4>Register for a product</h4>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Color</th>
					<th>Model</th>
					<th>Action</th>
				</tr>
				<c:forEach
					var="row"
					items="${result2.rows}"
				>
					<tr>
						<td><c:out value="${row.productId}" /></td>
						<td><c:out value="${row.productName}" /></td>
						<td><c:out value="${row.color}" /></td>
						<td><c:out value="${row.model}" /></td>
						<td><a
							href="login_and_register/userLogin.jsp"
						>Register</a></td>
					</tr>
				</c:forEach>
			</table>
		</form>
	</center>
	</c:if>
</body>
</html>
