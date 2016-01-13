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

	<!--Start login form  -->
	<div class='form_login_memo_wraper'>
		<div class='row'>
			<form class='col s12'>
				<div class='row'>
					<div class='input-field col s12'>
						<i class='material-icons prefix'>perm_identity</i> <input
							id='icon_prefix' type='text' class='validate'> <label
							for='icon_prefix'>Username</label>
					</div>
				</div>
				<div class='row'>
					<div class='input-field col s12'>
						<i class='material-icons prefix'>vpn_key</i><input
							id='icon_prefix' type='password' class='validate'> <label
							for='icon_prefix'>Password</label>
					</div>
				</div>
				<div class='row'>
					<div class='col s12'>
						<button style='float: right;' class='btn waves-effect waves-light'
							type='button' name='action'>
							Log In<i class='large material-icons right'>input</i>
						</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!--End login form  -->


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
