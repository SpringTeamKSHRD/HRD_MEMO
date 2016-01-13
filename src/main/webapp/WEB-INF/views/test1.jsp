<!DOCTYPE html>
<html>
<head>
	<title></title>
	<style type="text/css">
		.video-container {
			position: relative;
			padding-bottom: 56.25%;
			padding-top: 35px;
			height: 0;
			overflow: hidden;
		}
		.video-container iframe {
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
	<div class="col-sm-6 video-container">
		<iframe src="http://localhost:8080/HRD_MEMO/plugin?type=add" frameborder=0 id="frame-memo"></iframe>
	</div>
	<div class="col-sm-3"></div>
	<script>
	$("#btn-memo").click(function(){
		$("iframe#frame-memo").slideToggle(500);	
	});	
	</script>
</body>
</html>