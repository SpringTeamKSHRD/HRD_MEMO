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
	src='${pageContext.request.contextPath}/resources/js/pess_memo.js'></script>
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

			<form class='col s12'>
				<div class='row'>
					<div class="col s10">
						<ul class="tabs">
							<li class="tab col s4"><a href="#test1">Title 1</a></li>
							<li class="tab col s4"><a class="active" href="#test2">Title
									2</a></li>
							<li class="tab col s4"><a href="#test4">Title 4</a></li>
							<li class="tab col s4"><a href="#test4">Add</a></li>
						</ul>
					</div>
				</div>
				<div class='row'>
					<div class='input-field col s12'>
						<textarea id="note"></textarea>
					</div>
				</div>
				<div class='row'>
					<div class="input-field switch ">
						<label> Public <input type="checkbox"> <span
							class="lever"></span>
						</label>
					</div>
					<div class='input-field right '>
						<a class='waves-effect waves-light btn'><i
							class='material-icons right'>done_all</i>Save</a>
					</div>
				</div>
			</form>
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
</html>
