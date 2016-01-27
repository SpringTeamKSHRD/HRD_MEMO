<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>User Memo Dashboard</title>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge"> 
    <!-- Tell the browser to be responsive to screen width -->  
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">	
	<!-- Materialize --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/materialize/css/materialize.css">
	<!-- Materialize Icon -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- Own Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/dashboard.css">
	<!-- Sweet Alert --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.css"/>
	<!--Import jQuery before materialize.js-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->
</head>
<body >
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/login?logout">Log out</a></li>
	</ul> 
	<ul id="dropdown2" class="dropdown-content">
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/login?logout">Log out</a></li>
	</ul> 		
	<div class="navbar-fixed">       	
	<nav>
	  <div class="nav-wrapper teal">
	    <a href="#!" class="brand-logo">&nbsp;&nbsp;MEMO PESS</a>
	    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	    <ul class="right hide-on-med-and-down">
	      <li><a href="">Home</a></li>
	      <li><a href="${pageContext.request.contextPath}/user/userreport"><i class="large material-icons">email</i></a></li>
	      <li>
	      	<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="margin-top:10px;" width="40px;" height="40px;" alt="" class="circle"/>
	      </li>
	      <!-- Dropdown Trigger -->
	      <li>
	      	<a class="dropdown-button" href="#!" data-activates="dropdown1">
	      	<span>${sessionScope['USER'].username}</span><i class="material-icons right">arrow_drop_down</i></a>
	      </li>	      
	      <li><a href="#!">About</a></li>	      
	    </ul>
	    <!-- For mobile menu -->
	     <ul class="side-nav" id="mobile-demo">
	      <li><a href="">Home</a></li>
	      <li><a href="${pageContext.request.contextPath}/user/userreport"><i class="large material-icons">email</i></a></li>
	      <li>
	      	<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="margin-top:10px;" width="40px;" height="40px;" alt="" class="circle"/>
	      </li>
	      <!-- Dropdown Trigger -->
	      <li>
	      	<a class="dropdown-button" href="#!" data-activates="dropdown2">
	      	<span>${sessionScope['USER'].username}</span><i class="material-icons right">arrow_drop_down</i></a>
	      </li>	      
	      <li><a href="#!">About</a></li>	      
	    </ul>
	  </div>
	</nav>
	</div>
	<!-- ./close navigation -->
	<div class="container-fluid">
		<!-- Page Layout body here -->
		<div class="row">
			<!-- Left Body Section -->
			<div class="col s12 m4 l3 body_left"> <!-- Note that "m4 l3" was added -->
				<div class="z-depth-1">
					 <div class="collection">
				        <a href="#!" class="collection-item active" style="text-align:center;">List MEMOs</a>
				      </div>
					<div id="listmemo" style="overflow-y: scroll; height:600px;">
						
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
			<div class="row z-depth-1">
			<form action="#" method="POST" enctype="multipart/form-data">
				<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>

					<!-- List of components memo--> 
					<div class="row" style="margin:0px">
						<div class="col s12 m12 l2 right">
							<div class="input-field col s12">
								<select id="privacy" >
								      <!-- <option value="" disabled selected>Choose your option</option> -->
								      <option value="0">Private</option>
								      <option value="1">Public</option>
							    </select>
						    </div> 
						</div>
						<div class="col s12 m12 l10 right">
								<div class="input-field col s12">
								  <i class="material-icons prefix">mode_edit</i>
								  <input id="icon_prefix" type="text" class=" titlememo validate">
								  <label for="icon_prefix">Title Memo</label>
								</div>
						</div>
					</div>

				<!-- Text Area here -->
					<div class="row " style="margin:0px">
						<div class="col s12 m12 l12" style="padding:15px;">
							<textarea id="cont_memo" style="resize:none; width:100%; height:300px;padding:15px;">							
							</textarea>
						</div>
					</div>
				<!-- ./Textarea -->
				<!-- url and buttons here -->
					<div class="row " >
						<div class="col s12 m12 l6">
						  <label class="active" style="color:#FF5722;"><b>Current URL</b></label>
						  <input type="text" class="browser-default default-link" readonly="" value="www.khmeracademy.org.kh">
						</div>	
						<div class="col s12 m12 l6"> 
							<a class="waves-effect waves-light btn right" id="btncancel" onclick="cancelMemo()" style="margin:20px; background-color:#FF9800">Cancel</a>	
							<a class="waves-effect waves-light btn right" id="btnsave" onclick="saveMemo()" style="margin:20px;">Save</a>
						</div>													
					</div>
				<!-- ./ url here -->
			</form>
			</div>
			</div>

		</div>
		<!-- ./close row body which contain body left and body right -->
		<!-- ./Page Layout body here -->
	</div>
    <!-- ./Container --> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<!-- User Memo Dashboard Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/delete_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/update_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/add_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/edit_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/search_memo.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_dashboard.js"></script> 
	<!-- Sweet alert js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
  </body>
</html>