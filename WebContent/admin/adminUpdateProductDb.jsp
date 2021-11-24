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
		test="${ empty param.pName or empty param.pColor or empty param.pModel}"
	>
		<c:redirect url="adminUpdateProduct.jsp">
			<c:param
				name="errMsg"
				value="Please Enter product name, color and model"
			/>
			<c:param
				name="pId"
				value="${param.pId}"
			></c:param>
			<c:param
				name="pName"
				value="${param.pName}"
			></c:param>
			<c:param
				name="color"
				value="${param.pColor}"
			></c:param>
			<c:param
				name="model"
				value="${param.pModel}"
			></c:param>
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
				UPDATE product SET productName=?,color=?,model=? WHERE (productId = ?);	
		<sql:param value="${param.pName}" />
		<sql:param value="${param.pColor}" />
		<sql:param value="${param.pModel}" />
		<sql:param value="${param.pId}" />
		
	</sql:update>

	<c:if test="${result>=1}">
		<font
			size="5"
			color='green'
		> Congratulations ! Data updated successfully.</font>
		<c:redirect url="adminAddProduct.jsp">
			<c:param
				name="susMsg"
				value="Congratulations ! Data updated
	            successfully."
			/>
		</c:redirect>
	</c:if>
</body>
</html>
