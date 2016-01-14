<!DOCTYPE>
<html>
<head>
	<title>my plugin</title>
	<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/css/pess_memo.css' />
	<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
	<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
	<script
	src='${pageContext.request.contextPath}/resources/js/embed/pess_memo.js'></script>
	<script src='${pageContext.request.contextPath}/resources/js/dragbox.js'></script>
	<script
	src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
	<script type="text/javascript"
	src="http://materializecss.com/js/init.js"></script>
</head>
<body>

	<!--Start Memo panel  -->
	<div class='image_textarae_btnsave_container'>
		<div class='row'>			
			<div class="col s12">					
				<ul class="tabs">
					<li class="tab col m3 s12"><a class="blue-text" href="#title1">Title1</a></li>
					<li class="tab col m3 s12"><a class="blue-text" href="#title2">Title2</a></li>
					<li class="tab col m3 s12"><a class="blue-text" href="#more">More</a></li>
					<div class="indicator blue" style="z-index:1"></div>
				</ul>
			</div>
			<div id="title1" class="col s12 right-align">
				<div class='row'>
					<div class="col s12" style="padding: 15px 15px 5px 15px;">
						<textarea id="note" style="border: 1px solid #ddd;"></textarea>
					</div>
				</div>
				<div class="row" style="margin: 0 15px 0 15px;">
					<div class="input-field switch " style="margin-top: inherit;">
						<label> Public <input type="checkbox"> <span
							class="lever"></span>
						</label>
					</div>
					<div class='input-field right' style="margin-top: inherit;">
						<a class='waves-effect waves-light btn'
						style="margin: 7 0 10 0;"><i class='material-icons'>done_all</i></a>
					</div>
				</div>
			</div>
			<div id="title2" class="col s12">
				<div class='row'>
					<div class="col s12" style="padding: 15px 15px 5px 15px;">
						<textarea id="note" style="border: 1px solid #ddd;"></textarea>
					</div>
				</div>
				<div class="row" style="margin: 0 15px 0 15px;">
					<div class="input-field switch " style="margin-top: inherit;">
						<label> Public <input type="checkbox"> <span
							class="lever"></span>
						</label>
					</div>
					<div class='input-field right' style="margin-top: inherit;">
						<a class='waves-effect waves-light btn'
						style="margin: 7 0 10 0;"><i class='material-icons'>done_all</i></a>
					</div>
				</div>		
			</div>
			<div id="more" class="col s12">
				<div class='row'>
					<div class="col s12" style="padding: 15px 15px 5px 15px;">
						<textarea id="note" style="border: 1px solid #ddd;"></textarea>
					</div>
				</div>
				<div class="row" style="margin: 0 15px 0 15px;">
					<div class="input-field switch " style="margin-top: inherit;">
						<label> Public <input type="checkbox"> <span
							class="lever"></span>
						</label>
					</div>
					<div class='input-field right' style="margin-top: inherit;">
						<a class='waves-effect waves-light btn'
						style="margin: 7 0 10 0;"><i class='material-icons'>done_all</i></a>
					</div>
				</div>			
			</div>
		</div>
	</div>

	<!--end memo boar  -->



</body>
<style>
	* {
		padding: 0;
		margin: 0px;
	}

	.row {
		margin: 0px;
	}

	.card-panel {
		padding: 1px;
		text-align: center;
		color: white;
	}

	.btn-main {
		padding-top: 3px;
		width: 45px;
		height: 45px;
	}
</style>
<script>
$.ajax({
    url: "http://localhost:8080/HRD_MEMO/plugin/status",
    type: "get",
    success: function (response) {
        if(response["isLogin"] == false)
        window.location = "http://localhost:8080/HRD_MEMO/plugin?type=login";
    }
});

</script>
</html>
