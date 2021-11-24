
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/sql"
	prefix="sql"
%>
<html style="width: fit-content;">
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
            SELECT * from claim where (username="${param.username}" and registerId="${param.registerId }");
        </sql:query>
    
		<c:forEach
			var="row"
			items="${result.rows}"
		>
			<c:if test="${i <= count }"><c:set var="i" value="${i + 1}"></c:set></c:if>
			<div style="padding:5px">
				<span id="${row.claimId}">Status: <c:out value="${row.status}"/>
					<input class="btn btn-sm btn-outline-primary"type="submit" value="Approve"  onclick="test('${row.claimId}',1)"/>
					<input class="btn btn-sm btn-outline-primary" type="submit" value=" Reject " onclick="test('${row.claimId}',-1)"/>
				</span><br/>
				<span><c:out value="Date:${row.date}"/></span><br/>
				<span><c:out value="Detail: ${row.detail}"/></span><br/>
			</div>
		</c:forEach>
	</c:if>
	
	
	<c:if test="${empty param.username}">
	<sql:query
		dataSource="${dbsource}"
		var="result2"
	>
            SELECT c.claimId, c.status, c.detail, u.uname, u.fname, u.lname, u.email, rp.purchaseDate, rp.serialNo, p.productName, p.color, p.model
            from claim c
            inner join register_product rp
            on c.registerId=rp.registerId
            inner join product p
            on rp.productId=p.productId
            inner join user u 
            on rp.username=u.uname;
        </sql:query>
        <center style="margin: 4rem;" >

        <h4>All claims</h4>
    	<table class="table table-striped table-bordered table-sm" style="text-align: center;cellspacing:0" id="myTable">
    		<thead>
    		<tr>
    			<th>Claim id</th>
    			<th>Status</th>
    			<th>Detail</th>
    			<th>Username</th>
    			<th>First name</th>
    			<th>Last name</th>
    			<th>Email</th>
    			<th>Purchase date</th>
    			<th>Serail number</th>
    			<th>Product name</th>
    			<th>Color</th>
    			<th>Model</th>
    			<th>Action</th>
    		</tr>
    		</thead>
    		<tbody>
			<c:forEach
				var="row"
				items="${result2.rows}"
			>
				<c:if test="${i <= count }"><c:set var="i" value="${i + 1}"></c:set></c:if>
				<tr>
					<td><c:out value="${row.claimid}"/></td>
					<td id="${row.claimId}"><c:out value="${row.status}"/></td>
					<td><c:out value="${row.detail}"/></td>
					<td><c:out value="${row.uname}"/></td>
					<td><c:out value="${row.fname}"/></td>
					<td><c:out value="${row.lname}"/></td>
					<td><c:out value="${row.email}"/></td>
					<td><c:out value="${row.purchaseDate}"/></td>
					<td><c:out value="${row.serialNo}"/></td>
					<td><c:out value="${row.productName}"/></td>
					<td><c:out value="${row.color}"/></td>
					<td><c:out value="${row.model}"/></td>
					<td>
						<input class="btn btn-sm btn-outline-primary" type="submit" value="Approve"  onclick="test('${row.claimId}',1)"/>
						<input class="btn btn-sm btn-outline-primary" type="submit" value=" Reject " onclick="test('${row.claimId}',-1)"/>
					</td>
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
	</c:if>
	
	
	
		<script type="text/javascript">
			var username="${param.username}";
			function test(claimid,status) {
				event.preventDefault();
				$.ajax({
			        type: "POST",
			        url: "/nov23-group/adminClaim",
			        data : "claimid="+claimid+"&status="+status,
			        dataType: 'text',     
			        success: function(data){
			            alert("Edit succeed");
			            if (status == 1) $("#"+claimid).html("approved");
			            else if (status == -1) $("#"+claimid).html("rejected");
			        },
			        error: function (data){
			            alert("Sorry, edit failed");
			        }
			    });
			}
	        
    	</script>
    	

</body>
</html>
