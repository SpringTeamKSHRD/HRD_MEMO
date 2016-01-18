<!DOCTYPE>
<html>
<head>
	<title>Login</title>
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons' rel='stylesheet'>
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
	<link rel='stylesheet' type='text/css' href='${pageContext.request.contextPath}/resources/css/plugin.css' />
</head>
<body>
	<form id="frmLogin" method="POST" class="col s12" style="padding: 7px 15px 7px 15px;">
		<div class="row" style="margin-bottom: 0px;">Please Log In to
			Note</div>
		<hr style="margin: 5px 0 10px 0; border-top: 1px solid #ddd;">
		<div class="row" style="margin-bottom: 0px;">
			<div class="input-field col s12" style="margin: 0px;">
				<i class="material-icons prefix" style="margin-top: 10px;">perm_identity</i> <input
					id="username" type="email" name="username"
					style="margin-bottom: 0px;" placeholder="Enter Email" pattern="[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$" required>
			</div>
		</div>
		<div class="row" style="margin-bottom: 0px;">
			<div class="input-field col s12" style="margin-top: 5px;">
				<i class="material-icons prefix" style="margin-top: 10px;">vpn_key</i> <input
					id="password" type="password" 
					name="password" style="margin-bottom: 0px;" placeholder="Enter Password" required>
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
