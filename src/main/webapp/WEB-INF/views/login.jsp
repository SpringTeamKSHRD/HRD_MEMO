<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/materialize/css/materialize.css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/materialize/js/materialize.js'></script>
	<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-cookie.js'></script>
<title>Login</title>
<style>
* {
	margin: 0px;
	padding: 0px;
}

.row {
	margin: 0px;
}

.card {
	background: #009688;
	color: white;
}

#ceckboxcon {
	padding-left: 55px;
}
</style>
<style>
#frm-wrapper {
	width: 370px;
	height: 350px;
	margin: 40px auto;
	box-shadow: 2px 2px 7px gray;
}
</style>
</head>
<body>
	<div id='frm-wrapper'>
		<div class="row">
			<div class="col s12">
				<div class="card" style="text-align: center; padding: 6px;">
					<h4>Login Form</h4>
				</div>
			</div>
		</div>
		<div class='row'>
			<form id="frmLogin" action="${pageContext.request.contextPath}/login"
				method="POST" class='col s12'>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">perm_identity</i> <input
							id="username" type="text" class="validate" name='username' required>
						<label for="username">Email</label>
					</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<i class="material-icons prefix">vpn_key</i> <input id="password"
							type="password" class="validate" name='password' required> <label
							for="password">Password</label>
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
						<button class="btn waves-effect waves-light" type="submit">Login</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script type="text/javascript">var path = '${pageContext.request.contextPath}/';
	 Cookies.remove('MEMO');
	</script>
	<script type="text/javascript"
		src='${pageContext.request.contextPath}/resources/js/login.js'>	
	</script>
</body>
</html>