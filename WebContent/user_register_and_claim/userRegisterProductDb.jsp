<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
    <head>
        <title>JINSERT Operation</title>
    </head>
    <body>
        <c:if test="${ empty param.username or empty param.sNum or empty param.pDate}">
            <c:redirect url="userRegisterProduct2.jsp" >
                <c:param name="username" value="${param.username }"/>
                <c:param name="pId" value="${param.pId }"/>
                <c:param name="pName" value="${param.pName }"/>
                <c:param name="color" value="${param.color }" />
                <c:param name="model" value="${param.model }" />
				<c:param name="errMsg" value="Please enter username, serial number and purchase date!" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost:3306/nov23-project?autoReconnect=true&useSSL=false"
                           user="root"  password="12345"/>
  		<sql:query dataSource="${dbsource}" var="checkUser">
            SELECT * from user where uname = ?;
            <sql:param value="${param.username}" />
        </sql:query>        
        <c:if test="${checkUser.rowCount >= 1}">
	        <sql:update dataSource="${dbsource}" var="result">
	            INSERT INTO register_product(serialNo,purchaseDate,username,productId) VALUES (?,?,?,?);
	            <sql:param value="${param.sNum}" />
				<sql:param value="${param.pDate}" />
				<sql:param value="${param.username}" />
				<sql:param value="${param.pId}" />
	        </sql:update>
	        <c:if test="${result>=1}">
	            <font size="5" color='green'> Congratulations ! Data inserted
	            successfully.</font>
	 
	            <c:redirect url="userRegisterProduct.jsp" >
	            <c:param name="username" value="${param.username }"/>
	                <c:param name="susMsg" value="Congratulations ! Product registered successfully." />
	            </c:redirect>
	        </c:if> 
 		</c:if>
 		<c:if test="${checkUser.rowCount < 1}">
	            <font size="5" color='green'>User does not exist</font>
	            <c:redirect url="userRegisterProduct2.jsp" >
	                <c:redirect url="userRegisterProduct2.jsp" >
	                <c:param name="errMsg" value="User does not exist" />
	                <c:param name="pName" value="${param.pName }"/>
	                <c:param name="color" value="${param.color }" />
	                <c:param name="model" value="${param.model }" />
            </c:redirect>
	            </c:redirect>
 		</c:if>
    </body>
</html>
