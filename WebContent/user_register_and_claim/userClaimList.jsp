
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
            SELECT * from claim where (username="${param.username}" and registerId="${param.registerId }");
        </sql:query>
	<c:forEach
		var="row"
		items="${result.rows}"
	>
		<div>
			<span><c:out value="Date:${row.date} Detail: ${row.detail} Status: "/></span>
			<span class="badge badge-primary"><c:out value="${row.status}" /></span>
		</div>
	</c:forEach>
</body>
</html>
