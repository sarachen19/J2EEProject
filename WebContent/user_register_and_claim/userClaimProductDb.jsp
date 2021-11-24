<%@ page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
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
<title>Update Operation</title>
</head>
<body>
	<c:if
		test="${ empty param.date or empty param.detail}"
	>
		<c:redirect url="userClaimProduct.jsp">
			<c:param name="username" value="${param.uName}"></c:param>
			<c:param
				name="registerId"
				value="${param.registerId}"
			></c:param>
			<c:param
				name="claim"
				value="${param.claim}"
			></c:param>
			<c:param
				name="serialNo"
				value="${param.serialNo}"
			></c:param>
			<c:param
				name="purchaseDate"
				value="${param.purchaseDate}"
			></c:param>
			<c:param
				name="pName"
				value="${param.pName}"
			></c:param>
			<c:param
				name="color"
				value="${param.color}"
			></c:param>
			<c:param
				name="model"
				value="${param.model}"
			></c:param>
			<c:param
				name="errMsg"
				value="Please enter purchase and detail"
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
	<sql:update
		dataSource="${dbsource}"
		var="result"
	>
				UPDATE register_product SET claim=? WHERE (username = ? and registerId=?);	
		<sql:param value="${param.claim+1}" />
		<sql:param value="${param.uName}" />
		<sql:param value="${param.registerId}" />
	</sql:update>

	<sql:update
		dataSource="${dbsource}"
		var="result2"
	>
				INSERT INTO claim(date, detail, status, username, registerId) VALUES (?,?,?,?,?);
		<sql:param value="${param.date}" />
		<sql:param value="${param.detail}" />
		<sql:param value="pending" />
		<sql:param value="${param.uName}" />
		<sql:param value="${param.registerId}" />
	</sql:update>
	<c:if test="${result2>=1}">
		<font
			size="5"
			color='green'
		> Congratulations ! Claim made successfully. Please wait for response.</font>
		<c:redirect url="userClaimProductList.jsp">
			<c:param name="username" value="${param.uName}" />
			<c:param name="susMsg" value="Congratulations ! Claim made successfully. Please wait for response" />
		</c:redirect>
	</c:if>
</body>
</html>
