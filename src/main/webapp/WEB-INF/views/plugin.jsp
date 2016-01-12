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
	<script type="text/javascript" src="http://materializecss.com/js/init.js"></script>
</head>
<body>
	
	<!--Start Button activate panel  -->
	<div class='fixed-action-btn horizontal'> 
	    		<a class='btn-floating btn-main'> <i class='material-icons'>view_headline</i></a>
		    			<ul> 
		    				<li title='Memo'><a class='btn-floating red'><i id='btnmemoboard' class='material-icons'>comment</i></a></li> 
		    				<li title='Login'><a class='btn-floating orange'><i id='btnloginmemo' class='material-icons'>lock_open</i></a></li> 
		    				<li title='Sign Up'><a class='btn-floating indigo'><i id='btnregisterform' class='material-icons'>playlist_add</i></a></li> 
		    			</ul>	
	    		</div>
	    		<!--End Button Activate Panel  -->
		
		<!--Start Memo panel  -->
		<div class='image_textarae_btnsave_container'>
			<div class='row'><div class='col s12'> <div class='card-panel teal'><h5>Memo Board</h5></div></div></div>
			<div class='row'>
			
				<form class='col s12'> 
				
		    		<div class='row'>
						<div class='input-field col s2'> 
				    		<img id='user_image' src='resources/Male-icon.png' width='50px' height='50px' class="circle responsive-img valign"/>
						</div>
						<div class='input-field col s10 '> 
				    		<input id='title' type='tel' class='validate'><label for='title'>Title</label>
						</div> 	
					</div>
					
					<div class='row'> 
			    		<div class='input-field col s12'>
								 <textarea id="note" ></textarea>
						</div>
					</div> 
					<div class='row'>
					 <div class="input-field switch ">
					    <label>
					    	Public
					      <input type="checkbox">
					      <span class="lever"></span>					      
					    </label>
					  </div> 
						<div class='input-field right '> 
			    			<a class='waves-effect waves-light btn'><i class='material-icons right'>done_all</i>Save</a> 
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
							Log In<i class='large material-icons right'>input</i>
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
					<div  class='col s3'>						 
					    <div class='fileinput fileinput-new' data-provides='fileinput' style='width:100%; height: 175px;'> 
					    	<div class='fileinput-preview thumbnail' data-trigger='fileinput'style='width:100%; border:1px solid #eee;'> 
					    		<img id='image' class="responsive-img" src='Male-icon.png'/>
							</div>
							<div>
								<span class='btn btn-success btn-file'> 
					    		<input type='file' name='studentimg' id='studentimg'>Profile</span>
					    	</div>
					    </div>						
					</div>
					<div  class='col s9'>
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
							<div class='input-field col s6'>
								<input class='with-gap' name='gender' type='radio' id='male'  checked /> <label for='male'>Male</label>
								<input class='with-gap' name='gender' type='radio' id='female' />   <label  for='female'>Female</label>
							</div>
	    		    		<div class='input-field right'>
	    		    			<button class='btn waves-effect waves-light' type='submit'  name='action'>  
	    		    			<i class='material-icons right'>send</i>Sign Up</button>
							</div>							
						</div>
				</form>
			</div>
		</div>
		<!--end register form  -->
		
	
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
