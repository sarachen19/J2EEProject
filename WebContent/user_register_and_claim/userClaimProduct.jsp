
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link
			rel="stylesheet"
			href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
		>
    </head>
    <body>
    <center>
    <c:if test="${param.claim < 3}">   
    <h3 colspan="2">Make a claim</h3>    
        <form 
        action="
        userClaimProductDb.jsp?uName=<c:out value="${param.username}"/>&&registerId=<c:out value="${param.registerId}"/>&&claim=<c:out value="${param.claim}"/>&&pName=<c:out value="${param.pName}"/>
		&&serialNo=<c:out value="${param.serialNo}"/>
		&&model=<c:out value="${param.model}"/>
		&&color=<c:out value="${param.color}"/>
		&&purchaseDate=<c:out value="${param.purchaseDate}"/>
        " 
        method="post"
        >
				
					<div class="form-group">
                        <label>Username</label>&emsp;
                        <c:out value="${param.username}"/>
                    </div>
                    <div class="form-group">
                        <label>Product name</label>&emsp;
                        <c:out value="${param.pName}"/>
                    </div>
                    <div class="form-group">
                        <label>Serial number </label>&emsp;
                        <c:out value="${param.serialNo}"/>
                    </div>
					<div class="form-group">
                        <label>Model </label>&emsp;
                        <c:out value="${param.model}"/>
                    </div>
					<div class="form-group">
                        <label>Color </label>&emsp;
                        <c:out value="${param.color}"/>
                    </div>
					<div class="form-group">
                        <label>Purchase date</label>&emsp;
                        <c:out value="${param.purchaseDate}"/>
                    </div>

					<div class="form-group">
                        <label>Claim date</label>&emsp;
                        <input type="date" name="date" />
                    </div>
					<div class="form-group">
                        <label>Details</label>&emsp;
                        <input type="text" name="detail" rows="10"/>
                    </div>
                    <div class="form-group">
                        <input type="submit" value="Save" class="btn btn-primary"/>
                        <input type="reset" value="reset" class="btn btn-primary"/>
                    </div>
        </form>
        <h6>
			<a
				href="userClaimProductList.jsp?username=<c:out value="${param.username}"/> "
			>GO Back</a>
		</h6>
        </c:if>
        <c:if test="${param.claim >= 3}">
        	<c:redirect url="userClaimProductList.jsp">
			<c:param
				name="errMsg"
				value="Maximun claim times!"
			/>
			<c:param
				name="username"
				value="${param.username }"
			/>
			</c:redirect>
        </c:if>

        <c:if test="${param.purchaseDate < '2015-12-31'}">
        	<c:redirect url="userClaimProductList.jsp">
			<c:param
				name="errMsg"
				value="5 years warrenty expired!"
			/>
			<c:param
				name="username"
				value="${param.username }"
			/>
			</c:redirect>
        </c:if>
		<font color="red">
			<c:if test="${not empty param.errMsg}">
	            <c:out value="${param.errMsg}" />
	        </c:if>
        </font>
        <font color="green">
        	<c:if test="${not empty param.susMsg}">
            	<c:out value="${param.susMsg}" />
        	</c:if></font>
		</center>
    </body>
</html>
