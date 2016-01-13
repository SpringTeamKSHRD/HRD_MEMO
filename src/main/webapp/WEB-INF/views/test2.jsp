<!DOCTYPE html>
<html>
	<head>
		<title></title>
		<style type="text/css">

		</style>
		<link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/icon?family=Material+Icons">
		<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	</head>
	<body>
		<p id="outside">this is 1.html</p>	
		<div class="fixed-action-btn horizontal active"> 
	    		<a class="btn-floating btn-main"> <i class="material-icons">view_headline</i></a>		    				
		</div>	
		<div class="col-sm-6 video-container">
			<iframe src="http://localhost:8080/HRD_MEMO/plugin" height="500px" width="500px" frameborder="0"></iframe>			
		</div>
		<script src="jquery-1.11.3.min.js"></script>
		<script>
			var head = document.getElementsByTagName("head")[0];
			script = document.createElement("script"), script.onload = function() {
			    $(document).ready(function() {
			        $("head").append('<link rel="stylesheet" href="http://localhost:8080/HRD_MEMO/resources/admin/css/jquery.quicknote.css" type="text/css" />'), $("body").append('<div id="qn"></div>'), $("body").append('<script src="http://localhost:8080/HRD_MEMO/resources/admin/js/jquery.quicknote.js"/>'), $(function() {
			            $("#qn").quicknote()
			        })
			    })
			}, script.type = "text/javascript", script.src = "https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js", head.appendChild(script);
		</script>
	</body>
</html>