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

					<ul class="collapsible" data-collapsible="accordion">
						<li>
							<div class="collapsible-header">
								<i class="material-icons">filter_drama</i>Title 1
							</div>
							<div class="collapsible-body">
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
											style="margin: 7 0 10 0;"><i class='material-icons right'>done_all</i>Save</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<i class="material-icons">place</i>Title 2
							</div>
							<div class="collapsible-body">
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
											style="margin: 7 0 10 0;"><i class='material-icons right'>done_all</i>Save</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header">
								<i class="material-icons">whatshot</i>Title 3
							</div>
							<div class="collapsible-body">
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
											style="margin: 7 0 10 0;"><i class='material-icons right'>done_all</i>Save</a>
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="collapsible-header more center">
								More
								<div class="progress" style="display: none">
									<div class="indeterminate"></div>
								</div>
							</div>

						</li>
					</ul>
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
