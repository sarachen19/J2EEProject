
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
	<sql:setDataSource
		var="dbsource"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false"
		user="root"
		password="12345"
	/>
	<sql:update
		dataSource="${dbsource}"
		var="count"
	>
            DELETE FROM product
            WHERE productId='${param.pId}'
	</sql:update>
	<div><%@include file="adminAddProduct.jsp"%></div>
	<c:if test="${count>=1}">
	<center>
		<font
			size="4"
			color='green'
		> Congratulations ! Data deleted successfully.</font>
		</center>
	</c:if>
</body>
</html>
