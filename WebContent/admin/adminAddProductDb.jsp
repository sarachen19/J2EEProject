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
<title>JINSERT Operation</title>

</head>
<body>
	<c:if test="${ empty param.pName or empty param.pColor or empty param.pModel}">
		<c:redirect url="adminAddProduct.jsp">
			<c:param
				name="errMsg"
				value="Please Enter product name, color and model"
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
	            INSERT INTO product(productName,color,model) VALUES (?,?,?);
		<sql:param value="${param.pName}" />
		<sql:param value="${param.pColor}" />
		<sql:param value="${param.pModel}" />
	</sql:update>
	<c:if test="${result>=1}">
		<font
			size="5"
			color='green'
		> Congratulations ! Data inserted successfully.</font>
		<c:redirect url="adminAddProduct.jsp">
			<c:param
				name="susMsg"
				value="Congratulations ! Product added successfully."
			/>
		</c:redirect>
	</c:if>
</body>
</html>
