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
	<!-- Sweet Alert --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.css"/>
</head>
<body >
	<!-- Navbar goes here -->
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Personal Information</a></li>
	  <li class="divider"></li>
	  <li><a href="">Log out</a></li>
	</ul>
	<nav>
	  <div class="nav-wrapper teal">
	    <a href="#!" class="brand-logo">&nbsp;&nbsp;MEMO PESS</a>
	    <ul class="right hide-on-med-and-down">
	      <li><a href="#!">Home</a></li>
	      <li><a href="#!">Notification</a></li>
	      <li>
	      	<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="margin-top:10px;" width="40px;" height="40px;" alt="" class="circle"/>
	      </li>
	      <!-- Dropdown Trigger -->
	      <li>
	      	<a class="dropdown-button" href="#!" data-activates="dropdown1">
	      	<span>Ky Sona</span><i class="material-icons right">arrow_drop_down</i></a>
	      </li>
	      <li><a href="#!">About</a></li>	      
	    </ul>
	  </div>
	</nav>
	<!-- ./close navigation -->
	<div class="container-fluid">
		<!-- Page Layout body here -->
		<div class="row">
			<!-- Left Body Section -->
			<div class="col s12 m4 l3 body_left"> <!-- Note that "m4 l3" was added -->
				<div class="z-depth-1">
					<!-- Number of rows to show in collection-->
					<div class="row">
						<div class="col s12 m6 l12 body_left"> <br/>
							<div class="input-field col s12">
							    <select id="limit_row" onchange="limitRow()">
								      <!-- <option value="" disabled selected>Amount of row.</option> -->
								      <option value="5">5</option>
								      <option value="10">10</option>
								      <option value="30">30</option>
								      <option value="50">50</option>
							    </select>
							    <label>Number of rows</label>
							</div>
						</div>
					</div>
					<!-- List Tile Memo -->
					<div class="row">
				        <div class="col s12 m12">
				          <div class="card teal lighten-1">
				            <div class="card-content white-text center">
				            	<span>List Memo</span>
				            </div>
				          </div>
				        </div>
				      </div>
					<div id="listmemo" style="max-height:670px; overflow-y:scroll">
						
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
			
			<div class="col s12 m8 l9 body_right"> <!-- Note that "m8 l9" was added -->
			<!-- Search Area -->
			<div class="row">
				<br/>
				<div class="col s12 m12 l6">
					<div class="input-field col s12">
					    <select id="searching">
					      <option value="" disabled selected>choose option for searching.</option>
					  	  <option value="1">Title</option>
					      <option value="2">Website</option>
					      <option value="3">Privacy</option>
					      <option value="4">Date</option>
					    </select>
					    <label>Search</label>
					</div>
				</div>
				<div class="col s12 m12 l6">
					<div id="searcharea">
					
					</div>
				</div>
			</div>
			<form action="#" method="POST" enctype="multipart/form-data">
				<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
				<div class="z-depth-1" >
					<!-- List of components memo--> 
					<div class="row">
						<!-- <div class="col s12 m4 l4">
							
						</div> -->
						<div class="col s12 m4 l2 right">
							<div class="input-field col s12">
								<select id="privacy" >
								      <!-- <option value="" disabled selected>Choose your option</option> -->
								      <option value="0">Private</option>
								      <option value="1">Public</option>
							    </select>
							    <label>Privacy</label>
						    </div> 
						</div>
						<div class="col s12 m4 l10 right">
							<div class="row">
								<div class="input-field col s12">
								  <i class="material-icons prefix">mode_edit</i>
								  <input id="icon_prefix" type="text" class=" titlememo validate">
								  <label for="icon_prefix">Title Memo</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- CK Editor -->
				<br/>
				<div>
					<div class="row">
						<div class="col s12 m12 l12">
							<textarea class="z-depth-1" id="cont_memo" style="width:100%; height:300px;">
							
							</textarea>
						</div>
					</div>
				</div>
				<!-- ./Textarea -->
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
	<!-- Personal Information -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_profile.js"></script>
	<!-- Sweet Alert -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
  </body>
</html>