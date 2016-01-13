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

	<!--start register form  -->
	<div class='form_register_wraper'>
		<div class='row'>
			<form class='col s12'>
				<div class='col s3'>
					<div class='fileinput fileinput-new' data-provides='fileinput'
						style='width: 100%; height: 175px;'>
						<div class='fileinput-preview thumbnail' data-trigger='fileinput'
							style='width: 100%; border: 1px solid #eee;'>
							<img id='image' class="responsive-img" src='Male-icon.png' />
						</div>
						<div>
							<span class='btn btn-success btn-file'> <input type='file'
								name='studentimg' id='studentimg'>Profile
							</span>
						</div>
					</div>
				</div>
				<div class='col s9'>
					<div class='row'>
						<div class='input-field col s12'>
							<input id='username' type='text' class='validate'> <label
								for='username'>Username</label>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s12'>
							<input id='email' type='email' class='validate'> <label
								for='email'>Email</label>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s12'>
							<input id='password' type='password' class='validate'> <label
								for='password'>Password</label>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s12'>
							<input id='confrim' type='password' class='validate'> <label
								for='confirm'>Confirm Password</label>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s6'>
							<input class='with-gap' name='gender' type='radio' id='male'
								checked /> <label for='male'>Male</label> <input
								class='with-gap' name='gender' type='radio' id='female' /> <label
								for='female'>Female</label>
						</div>
						<div class='input-field right'>
							<button class='btn waves-effect waves-light' type='submit'
								name='action'>
								<i class='material-icons right'>send</i>Sign Up
							</button>
						</div>
					</div>
			</form>
		</div>
	</div>
	<!--end register form  -->



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
