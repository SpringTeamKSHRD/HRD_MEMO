<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Memo</title>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">   
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport"><!-- Tell the browser to be responsive to screen width -->	
	<!-- Materialize --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/materialize/css/materialize.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> <!-- Materialize Icon -->
	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- Own Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/dashboard.css">
	<!-- CK editor -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/ckeditor/ckeditor.js"></script>
</head>
<body >
	<!-- Navbar goes here -->
	<nav>
		<div class="nav-wrapper teal lighten-2">
			<a href="#!" class="brand-logo">Logo</a>
			<ul class="right hide-on-med-and-down">
			  <li><a href="sass.html">Notification</a></li>
			  <li><a href="badges.html">Ky Sona</a></li>
			  <li><a href="badges.html">About us</a></li>
			</ul>
		</div>
	</nav>
	<div class="container-fluid">
		<!-- Page Layout body here -->
		<div class="row top_menu">
			<div class="col s12 m4 l4">
				<div class="row">
					<div class="col s12 m6 l4">
						<div class="input-field col s12">
						    <select id="searching">
							      <!-- <option value="" disabled selected>Choose your option</option> -->
							      <option value="1">Website</option>
							      <option value="2">Privacy</option>
							      <option value="3">Date</option>
						    </select>
						    <label>Searching</label>
						</div>
					</div>
					<div class="col s12 m6 l8">
						<div id="searcharea">
							
						</div>
					</div>
				</div>
			</div>
			<div class="col s12 m4 l5">
				<!-- Empty Area -->
				<div class="row">
					<div class="col s12 m6 l3">
					 
					</div>
				</div>
			</div>
			<div class="col s12 m4 l3">
				<div class="row">
					<div class="input-field col s12">
					  <i class="material-icons prefix">search</i>
					  <input type="text" class="validate">
					  <label for="icon_telephone">Search</label>					  
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- Left Body Section -->
			<div class="col s12 m4 l4 body_left"> <!-- Note that "m4 l3" was added -->
				<div class="z-depth-1">
					<!-- Number of rows to show in collection-->
					<div class="row">
						<div class="col s12 m4 l4 body_left"> <br/>
							<div class="input-field col s12">
						    <select id="limit_row">
							      <!-- <option value="" disabled selected>Choose your option</option> -->
							      <option value="5">5</option>
							      <option value="10">10</option>
							      <option value="30">30</option>
							      <option value="50">50</option>
						    </select>
						    <label>Number of rows</label>
						</div>
						</div>
					</div>
					<div id="listmemo" style="max-height:500px; overflow-y:scroll">
					
					</div>					
				</div>
				<!-- pagination -->
				<div class="row">
					<div class="col s12 m4 l8 body_left">
						<!-- Pagination in the future. -->
					</div>
				</div>
			</div>
			<!-- Right Body Section -->
			
			<div class="col s12 m8 l8 body_right"> <!-- Note that "m8 l9" was added -->
			<form action="#" method="POST" enctype="multipart/form-data">
				<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
				<div class="z-depth-1" >
					<!-- List of components memo--> 
					<div class="row">
						<div class="col s12 m4 l3">
							<div class="input-field col s12">
								<select id="privacy" >
								      <!-- <option value="" disabled selected>Choose your option</option> -->
								      <option value="0">Private</option>
								      <option value="1">Public</option>
							    </select>
							    <label>Privacy</label>
						    </div> 
						</div>
						<div class="col s12 m4 l5">
							<div class="row">
								<div class="input-field col s12">
								  <i class="material-icons prefix">mode_edit</i>
								  <input id="icon_prefix" type="text" class=" titlememo validate">
								  <label for="icon_prefix">Title Memo</label>
								</div>
							</div>
						</div>
						<div class="col s12 m4 l4">
							<!-- Category here -->
						</div>
					</div>
				</div>
				<!-- CK Editor -->
				<br/>
				<div>
					<div class="row">
						<div class="col s12 m4 l12">
							<form>
								<textarea name="editor1" id="editor1" rows="10" cols="20">
									
								</textarea>
								<script>
									// Replace the <textarea id="editor1"> with a CKEditor
									// instance, using default configuration.
									CKEDITOR.replace( 'editor1' );
								</script> 
							</form>
						</div>
					</div>
				</div>
				<!-- ./CK Editor -->
				<!-- url here -->
				<div>
					<div class="row">
						  <label>Current URL</label>
						  <select class="browser-default" disabled>
						    <option value="www.khmeracademy.org.kh" disabled selected>www.khmeracademy.org.kh</option>
						  </select>
					</div> 
				</div>
				<!-- ./ url here -->
				<!-- Button Save and Cancel -->
				<div>
					<div class="row">
						&nbsp;&nbsp;
						<a class="waves-effect waves-light btn " id="btnsave" onclick="saveMemo()">Save</a> 
						<a class="waves-effect waves-light btn " id="btncancel" onclick="cancelMemo()">Cancel</a>
					</div>
				</div>
			</form>
			</div>

		</div>
		<!-- ./close row body which contain body left and body right -->
		<!-- ./Page Layout body here -->
	</div>
    <!-- ./Container --> 
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<!-- User Dashboard Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/delete_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/update_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/add_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/edit_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/search_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_dashboard.js"></script> 
	<!-- Bootpag -->
	<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/bootpag/bootpag.js"></script> --%>
  </body>
</html>