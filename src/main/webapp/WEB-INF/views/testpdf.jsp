<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
 <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js'></script>
</head>
<body>
      <input type="text" id="title"/>
      <textarea rows="4" cols="50" id="content"></textarea>
      <input type="button" value="Generate Pdf" onclick="doAjaxPost()">
      <script>
      function doAjaxPost() { 
    	  var url="${pageContext.request.contextPath}/getpdffile";
          $.ajax({
                 type: "GET", 
                 url: url,
                 data:{
                	 title:$("#title").val(),
                	 content:$("#content").val()
                 }, 
                 success: function(response, status, xhr){
                   var ct = xhr.getResponseHeader("content-type") || "";
                   if (ct.indexOf('xml') > -1) {
                          alert("xml");
                   }
                   if (ct.indexOf('pdf') > -1) {
                      window.open(url+"?title="+$("#title").val()+"&content="+$("#content").val());
                   }   
                 },
                    error: function(error, status){
                      window.alert("Problem retrieving PDF.\nThe error status is: " + status);
                  }
               });
        } 
      </script>
</body>
</html>