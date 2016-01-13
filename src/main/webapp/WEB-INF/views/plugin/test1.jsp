<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		.memo-container {
			position: relative;
			padding-bottom: 251px;
			padding-top: 35px;
			height: 0;
			overflow: hidden;
		}
		.memo-container iframe {
			position: absolute;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			overflow-x: hidden;
		}
	</style>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
	<link rel="stylesheet" type="text/css"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
</head>
<body>
	
	<button id="btn-memo">Note</button>
	<div class="col-sm-3"></div>
	<div class="col-sm-6 memo-container">
		<iframe src="http://localhost:8080/HRD_MEMO/plugin?type=add1" frameborder=0 id="frame-memo"></iframe>
	</div>
	<div class="col-sm-3"></div>
	<script>
	$("#btn-memo").click(function(){
		$("iframe#frame-memo").slideToggle(1000);	
	});	
	</script>
</body>
</html>