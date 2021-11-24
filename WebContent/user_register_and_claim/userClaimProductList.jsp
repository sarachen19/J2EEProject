
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
	<sql:query
		dataSource="${dbsource}"
		var="result"
	>
            SELECT p.productName, p.color, p.model, rp.serialNo, rp.purchaseDate, rp.claim,rp.username, rp.registerId
            from product p 
            join register_product rp
            on rp.productId=p.productId
            where (rp.username="${param.username}");
        </sql:query>
	<center>
		<form>
			<table
				class="table-sm table-striped"
				border="1"
				width="80%"
			>
				<h3>Registered Product List</h3>
				<tr>
					<th>Product Name</th>
					<th>Serial number</th>
					<th>Purchase date</th>
					<th>Color</th>
					<th>Model</th>
					<th>Claim times</th>
					<th>Username</th>
					<th>Action</th>
					<th>Claim history</th>
				</tr>
				<c:forEach
					var="row"
					items="${result.rows}"
				>
					<tr>
						<td><c:out value="${row.productName}" /></td>
						<td><c:out value="${row.serialNo}" /></td>
						<td><c:out value="${row.purchaseDate}" /></td>
						<td><c:out value="${row.color}" /></td>
						<td><c:out value="${row.model}" /></td>
						<td><c:out value="${row.claim}" /></td>
						<td><c:out value="${row.username}" /></td>
						<td><a
							href="
							userClaimProduct.jsp?username=<c:out value="${row.username}"/>
							&&registerId=<c:out value="${row.registerId}"/>
							&&claim=<c:out value="${row.claim}"/>
							&&pName=<c:out value="${row.productName}"/>
							&&serialNo=<c:out value="${row.serialNo}"/>
							&&model=<c:out value="${row.model}"/>
							&&color=<c:out value="${row.color}"/>
							&&purchaseDate=<c:out value="${row.purchaseDate}"/>
							"
						>Add a claim</a></td>
						<td><jsp:include page="userClaimList.jsp">
								<jsp:param
									name="username"
									value="${row.username}"
								/>
								<jsp:param
									name="registerId"
									value="${row.registerId}"
								/>
							</jsp:include>
						</td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<h6>
			<a
				href="userRegisterProduct.jsp?username=<c:out value="${param.username}"/>"
			>Go Back</a>
		</h6>
	
		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font>
		<font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
</body>
</html>
