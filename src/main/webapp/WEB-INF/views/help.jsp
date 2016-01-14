<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/hrdmemoplugin.js'></script>
</head>
<body>
	<div id="hrd_memo_pess">
	</div>
	
hello, ${auth.name} 
 <a href="${pageContext.request.contextPath}/login">login</a>		
 <a href="${pageContext.request.contextPath}/logout">logout</a>		
 <a href="${pageContext.request.contextPath}/admin/product">admin</a>		
 <a href="${pageContext.request.contextPath}/author/product">author</a>
 <br/>plugin
 <a href="${pageContext.request.contextPath}/plugin?type=add1">add1</a>
 <a href="${pageContext.request.contextPath}/plugin?type=add2">add2</a>
 <a href="${pageContext.request.contextPath}/plugin?type=login">login</a>
 <a href="${pageContext.request.contextPath}/plugin?type=signup">signup</a>
 <br/>test
 <a href="${pageContext.request.contextPath}/plugin?type=test1">test1</a>
 <a href="${pageContext.request.contextPath}/plugin?type=test2">test2</a>
</body>
</html>