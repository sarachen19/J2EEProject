
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
	href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css"
>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
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
            SELECT * from product;
        </sql:query>
	<center style="margin-top:2rem;width:50%">

			<table
				border="0"
				id="myTable"
				class="table-sm table-striped"
				
			>
				<h4>Product List</h4>
				<thead>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Color</th>
					<th>Model</th>
					<th >Action</th>
					<th >Action</th>
				</tr>
				</thead>
				<tbody>
				<c:forEach
					var="row"
					items="${result.rows}"
				>
					<tr>
						<td><c:out value="${row.productId}" /></td>
						<td><c:out value="${row.productName}" /></td>
						<td><c:out value="${row.color}" /></td>
						<td><c:out value="${row.model}" /></td>
						<td><a href="adminUpdateProduct.jsp?pId=<c:out value="${row.productId}"/>&&pName=<c:out value="${row.productName}"/>&&color=<c:out value="${row.color}"/>&&model=<c:out value="${row.model}"/>">Update</a></td>
						<td><a
							href="javascript:confirmGo('Sure to delete this record?','adminDeleteProductDb.jsp?pId=<c:out value="${row.productId}"/>')"
						>Delete</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
	</center>
	
	   	<script>
	   	$(document).ready( function () {
	   	    $('#myTable').DataTable();
	   	} );
		</script>
	
</body>
</html>
