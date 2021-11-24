
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
            SELECT * from user;
        </sql:query>
	<center style="margin:3rem 15rem">

			<table
				border="1"
				id="myTable"
				class="table-sm table-striped"
			>
				<h4>User List</h4>
				<thead>
				<tr>
					<th>Username</th>
					<th>Password</th>
					<th>Cell number</th>
					<th>Email</th>
					<th>First name</th>
					<th>Last name</th>
					<th>Address</th>
					<th>Action</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach
					var="row"
					items="${result.rows}"
				>
					<tr>
						<td><c:out value="${row.uname}" /></td>
						<td><c:out value="${row.password}" /></td>
						<td><c:out value="${row.cellno}" /></td>
						<td><c:out value="${row.email}" /></td>
						<td><c:out value="${row.fname}" /></td>
						<td><c:out value="${row.lname}" /></td>
						<td><c:out value="${row.address}" /></td>
						<td><a href="displayRegisteredProduct.jsp?username=<c:out value="${row.uname}"/>">Detail</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		<h6><a href="admin.jsp">Go Back</a></h6>
	</center>
	
	   	<script>
	   	$(document).ready( function () {
	   	    $('#myTable').DataTable();
	   	} );
		</script>
</body>
</html>
