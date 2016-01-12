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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/materialize/css/materialize.css">
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
					<div class="col s12 m6 l4"> <br/>
						<select class="browser-default">
							<option value="1">Title</option>
							<option value="2">Date</option>
							<option value="3">Website</option>
							<option value="4">Public</option>
						</select>
					</div>
					<div class="col s12 m6 l8">
						<div id="filterarea">
						
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
				<div class="z-depth-1" id="listmemo" >
					<!-- Number of rows to show in collection-->
					<div class="row">
						<div class="col s12 m4 l4 body_left"> <br/>
							<label>Number of Rows</label>
							<select class="browser-default">
								<option value="1">5</option>
								<option value="2">10</option>
								<option value="3">20</option>
								<option value="4">50</option>
							</select>
						</div>
					</div>
					<ul class="collection">
						<li class="collection-item avatar">
						  <!-- <img src="image/yoona.jpg" alt="" class="circle">-->
						  <a><i class="material-icons">room</i></a>
						  <span class="title">Title</span>
						  <p> Cambodia is a developing country. Economic depends on agriculture. Angorwat temple is in Siem Reap province.</p>
						  <!-- <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a> -->
						</li>
						<li class="collection-item avatar">
						  <!-- <i class="material-icons circle">folder</i>-->
						  <a><i class="material-icons">room</i></a>
						  <span class="title">Title</span>
						  <p> Cambodia is a developing country. Economic depends on agriculture. Angorwat temple is in Siem Reap province.</p>
						  <!-- <a href="#!" class="secondary-content"><i class="material-icons">grade</i></a> -->
						</li>
						<li class="collection-item avatar">
						  <a><i class="material-icons">room</i></a>
						  <span class="title">Title</span>
						  <p> Cambodia is a developing country. Economic depends on agriculture. Angorwat temple is in Siem Reap province.</p>
						</li>
						<li class="collection-item avatar">
							<a><i class="material-icons">room</i></a>
						  <span class="title">Title</span>
						  <p> Cambodia is a developing country. Economic depends on agriculture. Angorwat temple is in Siem Reap province.</p>
						</li>
						<li class="collection-item avatar">
						  <a><i class="material-icons">room</i></a>
						  <span class="title">Title</span>
						  <p> Cambodia is a developing country. Economic depends on agriculture. Angorwat temple is in Siem Reap province.</p>
					</ul>
				</div>
				<!-- pagination -->
				<div class="row">
					<div class="col s12 m4 l8 body_left">
						<div id="content">Dynamic Content goes here</div>
						<div id="page-selection">Pagination goes here</div>
						<script>
							// init bootpag
							$('#page-selection').bootpag({
								total: 10
							}).on("page", function(event, /* page number here */ num){
								 $("#content").html("Insert content"); // some ajax content loading...
							});
						</script>
					</div>
				</div>
			</div>
			<!-- Right Body Section -->
			<div class="col s12 m8 l8 body_right"> <!-- Note that "m8 l9" was added -->
				<br/>
				<div class="z-depth-1" >
					<!-- List of components memo--> 
					<div class="row">
						<div class="col s12 m4 l3">
							<label>Privacy Memo</label>
							<select class="browser-default">
								<option value="1">Private</option>
								<option value="2">Public</option>
							</select>
						</div>
						<div class="col s12 m4 l5">
							<div class="row">
								<div class="input-field col s12">
								  <i class="material-icons prefix">mode_edit</i>
								  <input id="icon_prefix" type="text" class="validate">
								  <label for="icon_prefix">Title Memo</label>
								</div>
							</div>
						</div>
						<div class="col s12 m4 l4">
							<label>Category Memo</label>
							<select class="browser-default">
								<option value="1">Technology</option>
								<option value="2">Sport</option>
								<option value="2">Entertainment</option>
								<option value="2">Environment</option>
								<option value="2">Society</option>
								<option value="2">Others</option>
							</select>
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
									This is my textarea to be replaced with CKEditor.
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
				<!-- Button Save and Cancel -->
				<div>
					<div class="row">
						<div class="col s12 m4 l2 right">
							<input type="button" value="Save"/>
							<input type="button" value="Cancel"/>							
						</div>
					</div>
				</div>
			</div>

		</div>
		<!-- ./Page Layout body here -->
	</div>
    <!-- ./Container --> 
    <!--Import jQuery before materialize.js-->
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/materialize/js/materialize.min.js"></script>
	<!-- Bootpag -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/bootpag/bootpag.js"></script>
  </body>
</html>