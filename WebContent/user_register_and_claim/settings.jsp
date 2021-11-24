<%@ page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
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
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
>
<script
	type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"
></script>
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
            SELECT * from user where(uname="${param.username}");
    </sql:query>
	<center>
		<h3>
			Welcome!
			<c:out value="${param.username }" />
		</h3>
		<form id="settingForm">
			<table
				border="1"
				width="40%"
				class="table-sm table-borderless"
			>
				<h4>My information</h4>
				<c:forEach
					var="row"
					items="${result.rows}"
				>
					<tr>
						<td>Username: <input
							type="text"
							value="${row.uname}"
							disabled
						/></td>
					</tr>
					<tr>
						<td>First name: <input
							type="text"
							value="${row.fname}"
							id="fname"
						/></td>
					</tr>
					<tr>
						<td>Last name: <input
							type="text"
							value="${row.lname}"
							id="lname"
						/></td>
					</tr>
					<tr>
						<td>Cell number: <input
							type="text"
							value="${row.cellno}"
							id="cellno"
						/></td>
					</tr>
					<tr>
						<td>Email: <input
							type="text"
							value="${row.email}"
							id="email"
						/></td>
					</tr>
					<tr>
						<td>Address: <input
							type="text"
							value="${row.address}"
							id="address"
						/></td>
					</tr>
					<tr>
						<td><input
						class="btn btn-primary"
							type="submit"
							value="Update"
						/></td>
					</tr>
				</c:forEach>
			</table>
		</form>
		<h6>
			<a
				href="userRegisterProduct.jsp?username=<c:out value="${param.username}"/> "
			>Go Back</a>
		</h6>
		<h6>
			<a href="../index.jsp">Log out</a>
		</h6>
		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
			</c:if></font>
	</center>
	<script type="text/javascript">
		$('#settingForm').submit(
				function(e) {
					e.preventDefault();
					var username = "${param.username}";
					var fname = $("#fname").val();
					var lname = $("#lname").val();
					var cellno = $("#cellno").val();
					var email = $("#email").val();
					var address = $("#address").val();
					console.log(address);
					$.ajax({
						type : "POST",
						url : "/nov23-group/userSettingUpdate",
						data : "username=" + username + "&fname=" + fname
								+ "&lname=" + lname + "&cellno=" + cellno
								+ "&email=" + email + "&address=" + address,
						dataType : 'text',
						success : function(data) {
							alert("Update succeed");

						},
						error : function(data) {
							alert("Sorry, edit failed");
						}
					});
				});
	</script>
</body>
</html>