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
	src='${pageContext.request.contextPath}/resources/embed/pess_memo.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/dragbox.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
<script type="text/javascript"
	src="http://materializecss.com/js/init.js"></script>
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
</head>
<body>

	<!--Start login form  -->
	<div class='form_login_memo_wraper'>
		<div class='row'>

				
					<form id="frmLogin"
						action="${pageContext.request.contextPath}/login" method="POST"
						class='col s12'>
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">perm_identity</i> <input
									id="username" type="text" class="validate" name='username'>
								<label for="username">Email</label>
							</div>
						</div>
						<div class="row">
							<div class="input-field col s12">
								<i class="material-icons prefix">vpn_key</i> <input
									id="password" type="password" class="validate" name='password'>
								<label for="password">Password</label>
							</div>
						</div>
						<!-- 				<div class='row'>
					<div class='col s12' id='ceckboxcon'>
						<p>
							<input type="checkbox" id="test5" /> <label for="test5">Remember me</label>
						</p>
					</div>
				</div> -->
						<div class="row">
							<div class="col s12" style='text-align: right;'>
								<button class="btn waves-effect waves-light" type="submit">
									<i class="large material-icons">input</i>
								</button>
							</div>
						</div>
					</form>

		</div>
	</div>
	<!--End login form  -->
	<script type="text/javascript">var path = '${pageContext.request.contextPath}/'</script>
	<script type="text/javascript"
		src='${pageContext.request.contextPath}/resources/embed/login.js'>	
	</script>
</body>
</html>
