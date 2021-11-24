
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/sql"
	prefix="sql"
%>
<html >
<head>
<title>SELECT Operation</title>
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
>
<link
	rel="stylesheet"
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
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
	<center style="margin:3rem 15rem 3rem 15rem">
			<table
				border="1"
				id="myTable"
				class="table-sm table-striped"
			>
				<h4>Registered Product List</h4>
				<thead>
				<tr>
					<th>Product Name</th>
					<th>Serial number</th>
					<th>Purchase date</th>
					<th>Color</th>
					<th>Model</th>
					<th>Claim times</th>
					<th>Claim history</th>
				</tr>
				</thead>
				<tbody>
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
						<td><jsp:include page="displayAllClaims.jsp">
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
				</tbody>
			</table>
		<h6>
			<a
				href="displayUser.jsp"
			>Go Back</a>
		</h6>
	
		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font>
		<font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
	
	   	<script>
	   	$(document).ready( function () {
	   	    $('#myTable').DataTable();
	   	} );
		</script>

</body>
</html>
