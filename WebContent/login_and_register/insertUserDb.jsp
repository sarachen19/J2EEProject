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
		test="${ empty param.username or empty param.password or empty param.contact or empty param.email or empty param.first_name or empty param.last_name
        or empty param.address}"
	>
		<c:redirect url="insertUser.jsp">
			<c:param
				name="errMsg"
				value="Please fill in all fields."
			/>
		</c:redirect>
	</c:if>
	<sql:setDataSource
		var="dbsource"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false"
		user="root"
		password="12345"
	/>
	<c:catch var="ex">
	<sql:update
		dataSource="${dbsource}"
		var="result"
	>
            INSERT INTO user(uname, password, cellno, email, fname, lname, address) VALUES (?,?,?,?,?,?,?);
            
            <sql:param value="${param.username}" />
		<sql:param value="${param.password}" />
		<sql:param value="${param.contact}" />
		<sql:param value="${param.email}" />
		<sql:param value="${param.first_name}" />
		<sql:param value="${param.last_name}" />
		<sql:param value="${param.address}" />
	</sql:update>
	</c:catch>
	<c:if test="${ex == null && result>=1}">
		<font
			size="5"
			color='green'
		> Congratulations ! Register successfully.</font>
		<c:redirect url="userLogin.jsp">
			<c:param
				name="susMsg"
				value="Congratulations ! Registered successfully."
			/>
		</c:redirect>
	</c:if>
	<c:if test="${ex != null }">
				<c:redirect url="insertUser.jsp">
			<c:param
				name="errMsg"
				value="Username already in use"
			/>
		</c:redirect>
	</c:if>
</body>
</html>