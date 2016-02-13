<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/memo-buttons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/admin/css/jquery.quicknote.css">
</head>
<body>
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/admin/js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/admin/js/jquery-cookie.js"></script> 
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/admin/js/jquery.quicknote.js"></script> 
<script type="text/javascript" src = "${pageContext.request.contextPath }/resources/admin/js/iframeResizer.contentWindow.min.js"></script>   
<script>
var path = "${pageContext.request.contextPath}";
$(function() {
	var div = document.createElement("div");
    div.setAttribute("id", "qn"),
    document.body.insertBefore(div, document.body.firstChild);
    $('#qn').quicknote();
})
</script>
</body>
</html>