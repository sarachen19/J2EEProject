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
<title>Insert User</title>
</head>
<body>
	<c:if
		test="${ empty param.username or empty param.password}"
	>
		<c:redirect url="userLogin.jsp">
			<c:param
				name="errMsg"
				value="Please enter username and password"
			/>
			<c:if test="${param.admin}">
				<c:param
				name="admin"
				value="true"
				/>
			</c:if>
		</c:redirect>
	</c:if>
	<sql:setDataSource
		var="dbsource"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false"
		user="root"
		password="12345"
	/>
	
	<c:if test="${empty param.admin}">
		<sql:query
			dataSource="${dbsource}"
			var="result"
		>
	            select * from user where(uname=? and password=?);
	            
	        <sql:param value="${param.username}" />
			<sql:param value="${param.password}" />
		</sql:query>
		<c:if test="${result.rowCount>=1}">
		<font
			size="5"
			color='green'
		> Congratulations ! Login successful.</font>
		
			<c:redirect url="../user_register_and_claim/userRegisterProduct.jsp">
				<c:param
					name="username"
					value="${param.username}"
				/>
				<c:param
					name="susMsg"
					value="Congratulations ! Login successful."
				/>
			</c:redirect>
		</c:if>

		<c:if test="${result.rowCount < 1}">
			<c:redirect url="userLogin.jsp">
				<c:param
					name="errMsg"
					value="Wrong username or password"
				/>
			</c:redirect>
		</c:if>
	</c:if>
	
	
	<c:if test="${param.admin}">
			<sql:query
			dataSource="${dbsource}"
			var="result2"
		>
	            select * from user where(uname=? and password=?);
	            
	        <sql:param value="admin" />
			<sql:param value="${param.password}" />
		</sql:query>
		<c:if test="${result2.rowCount>=1}">
		<font
			size="5"
			color='green'
		> Congratulations ! Login successful.</font>
			<c:redirect url="../admin/admin.jsp">
			</c:redirect>
		</c:if>

		<c:if test="${result2.rowCount < 1}">
			<c:redirect url="userLogin.jsp">
				<c:param
					name="errMsg"
					value="Wrong username or password"
				/>
				<c:param
					name="admin"
					value="true"
				/>
			</c:redirect>
		</c:if>
	</c:if>
</body>
</html>