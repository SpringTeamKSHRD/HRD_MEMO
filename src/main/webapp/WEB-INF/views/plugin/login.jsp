<!DOCTYPE>
<html>
<head>
	<title>Login</title>
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/pess_memo.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
</head>
<body>
	<form id="frmLogin" method="POST" class='col s12'>
		<div class="row" style="margin-bottom: 0px;">
			<div class="input-field col s12">
				<i class="material-icons prefix">perm_identity</i> <input
					id="username" type="text" class="validate" name='username'
					style="margin-bottom: 0px;"> <label for="username">Email</label>
			</div>
		</div>
		<div class="row" style="margin-bottom: 0px;">
			<div class="input-field col s12">
				<i class="material-icons prefix">vpn_key</i> <input id="password"
					type="password" class="validate" name='password'
					style="margin-bottom: 0px;"> <label for="password">Password</label>
			</div>
		</div>
		<div class="row" style="margin: 0px 15px 0px 15px;">
			<button class="btn waves-effect waves-light right" type="submit"
				style="margin: 7px 0 7px 0;">
				<i class="large material-icons">input</i>
			</button>
		</div>
	</form>
	<script src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
	<script src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
	<script type="text/javascript">var path = '${pageContext.request.contextPath}/'</script>
	<script type="text/javascript" src='${pageContext.request.contextPath}/resources/js/plugin/ilogin.js'></script>
</body>
</html>
