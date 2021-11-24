<%@page
	contentType="text/html"
	pageEncoding="UTF-8"
%>
<%@ taglib
	uri="http://java.sun.com/jsp/jstl/core"
	prefix="c"
%>
<!DOCTYPE html>
<html>
<head>
<meta
	http-equiv="Content-Type"
	content="text/html; charset=UTF-8"
>
<link
	rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
>
<title>JSP Page</title>
</head>
<body>
	<center>
		<jsp:include page="/user_register_and_claim/userRegisterProduct.jsp" />
		<h4><a href="/nov23-group/login_and_register/userLogin.jsp?admin=true">Admin Login</a></h4> 
	</center>
</body>
</html>
