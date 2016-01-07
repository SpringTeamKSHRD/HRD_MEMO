<!DOCTYPE>
<html>
<head>
<title>my plugin</title>
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/css/pess_memo.css' />
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons'rel='stylesheet'>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/pess_memo.js'></script>
<script src='${pageContext.request.contextPath}/resources/js/dragbox.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
</head>
<body>
	<div style='width: 400px; margin: auto;'>
	<!--Start Button activate panel  -->
	<div class='fixed-action-btn virticlal'> 
	    		<a class='btn-floating btn-main #009688'> <i class='material-icons'>view_headline</i></a>
		    			<ul> 
		    				<li title='Memo'><a class='btn-floating red'><i id='btnmemoboard' class='material-icons'>comment</i></a></li> 
		    				<li title='Login'><a class='btn-floating #0288D1'><i id='btnloginmemo' class='material-icons'>lock_open</i></a></li> 
		    				<li title='Sign Up'><a class='btn-floating blue'><i id='btnregisterform' class='material-icons'>playlist_add</i></a></li> 
		    			</ul>	
	    		</div>
	    		<!--End Button Activate Panel  -->
		<div class='pess_memo'>
		<!--Start Memo panel  -->
		<div class='image_textarae_btnsave_container'>
			<div class='row'><div class='col s12'> <div class='card-panel teal'><h6>Memo Board</h6></div></div></div>
			<div class='row'>
				<form class='col s12'> 
					<div class='row'>
			    		<div class='input-field col s12'>
							<select class='browser-default'> 
				    		<option value='' disabled selected>Choose your option</option> 
				    		<option value='1'>Category 1</option> 
				    		<option value='2'>Category 2</option> 
				    		<option value='3'>Category 3</option> 
				    		</select>
						</div> 
		    		</div>	
		    		<div class='row'>
						<div class='input-field col s2'> 
				    		<img id='user_image' src='resources/Male-icon.png' width='50px' height='50px'/>
						</div>
						<div class='input-field col s10'> 
				    		<input id='title' type='tel' class='validate'><label for='title'>Title</label>
						</div>
					</div>
					<div class='row'> 
			    		<div class='input-field col s12'>
								<i class='material-icons prefix'>mode_edit</i>
								 <textarea id="note" class="materialize-textarea"></textarea>
					    		<label for='note'>// NOTE HERE</label>
						</div>
					</div> 
					<div class='row'>
				    	<div class='col s12'> 
				    		<input class='with-gap' name='status' type='radio' id='private' checked />  
				    		<label for='private'>Private</label> <input class='with-gap' name='status' type='radio' id='public' />  
				    		<label for='public'>Public</label>
						</div>
					</div>
					<div class='row'>
						<div class='col s12'> 
			    			<a class='waves-effect waves-light btn' style='float:right;'><i class='material-icons left'>done_all</i>Save</a> 
			    		</div>
					</div>
				</form>
			</div>
		</div>
		<!--end memo boar  -->
		<!--Start login form  -->
		<div class='form_login_memo_wraper'>
			<div class='row'>
				<div class='col s12'>
					<div class='card-panel teal'><h5>Login Form</h5></div>
				</div>
			</div>	
			<div class='row'> 
	    		<form class='col s12'>
					<div class='row'>
						<div class='input-field col s12'>
						<i class='material-icons prefix'>perm_identity</i> <input  id='icon_prefix' type='text' class='validate'> <label for='icon_prefix'>Username</label>
						</div>	
					</div>
					<div class='row'> 
			    		<div class='input-field col s12'>
				    		<i class='material-icons prefix'>vpn_key</i><input  id='icon_prefix' type='password' class='validate'> 
				    		<label for='icon_prefix'>Password</label>
						</div>
					</div>
					<div class='row'>
						<div class='col s12'> 
				    		<button style='float:right;' class='btn waves-effect waves-light' type='button' name='action'>
							<i class='large material-icons'>input</i>
							</button> 
			    		</div>
					</div>
				</form>
			</div>
		</div>
		<!--End login form  -->
		<!--start register form  -->
		<div class='form_register_wraper'>
			<div class='row'><div class='col s12'> <div class='card-panel teal'><h5>Register Form</h5></div></div></div>
			<div class='row'>
				<form class='col s12'>
					<div  class='row'>
						<div class='col s12'> 
						    <div class='fileinput fileinput-new' data-provides='fileinput'> 
						    	<div class='fileinput-preview thumbnail' data-trigger='fileinput'style='width:120px; 
						    		height: 130px; border:1px solid green;'> 
						    		<img id='image' src='Male-icon.png'/>
								</div>
								<div>
									<span class='btn btn-success btn-file'> 
						    		<input type='file' name='studentimg' id='studentimg'>Profile</span>
						    	</div>
						    </div>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s12'>
							<input id='username' type='text' class='validate'> <label for='username'>Username</label>
						</div>
					</div>
					<div class='row'>
						 <div class='input-field col s12'> 
    		    			<input id='email' type='email' class='validate'> <label for='email'>Email</label>
						</div>
					</div>
					<div class='row'> 
    		    		<div class='input-field col s12'>
    		    			<input id='password' type='password' class='validate'> <label  for='password'>Password</label>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s12'> 
    		    		<input id='confrim' type='password' class='validate'> <label for='confirm'>Confirm Password</label>
						</div>
					</div> 
					<div class='row'>
						<div class='input-field col s12'>
						<input class='with-gap' name='gender' type='radio' id='male'  checked /> <label for='male'>Male</label>
						<input class='with-gap' name='gender' type='radio' id='female' />   <label  for='female'>Female</label>
						</div>
					</div>
					<div class='row'>
						<div class='input-field col s6'></div> 
    		    		<div class='input-field col s6'>
    		    			<button class='btn waves-effect waves-light' type='submit'  name='action'>  
    		    			<i class='material-icons right'>send</i>Sign Up</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!--end register form  -->
		</div>
	</div>
</body>
<style>
*{
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
    padding-top:3px;
	width: 45px;
	height: 45px;
}
</style>
</html>
