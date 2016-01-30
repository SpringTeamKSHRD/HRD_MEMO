<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/font-awesome-4.3.0/css/font-awesome.min.css"/>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.css"/>
	<!--Import jQuery before materialize.js-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/lib/jquery.slimscroll.min.js"></script>
</head>
<body onbeforeunload="leavePage()">
	<!-- Navbar goes here -->
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
	</ul> 
	<ul id="dropdown2" class="dropdown-content">
	 	<li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
	</ul> 		
	<div class="navbar-fixed">  
	<nav>
	  <div class="nav-wrapper teal">
	    <a href="#!" class="brand-logo">&nbsp;&nbsp;MEMO PESS</a>
	    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	    <ul class="right hide-on-med-and-down">
	      <li><a href="user">Home</a></li>
	      <li><a href="${pageContext.request.contextPath}/user/userreport">
	      <i class="fa fa-envelope-o" style="font-weight:bolder; font-size: 20px;"><span class="numnotify"></span></i></a></li>
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
	      <li><a href="user"">Home</a></li>
	        <li><a href="${pageContext.request.contextPath}/user/userreport">
	        <i class="fa fa-envelope-o" style="font-weight:bolder; font-size: 20px;"><span class="numnotify"></span></i></a></li>
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
		<div class="row">
			    <div class="col s12">
			      <ul class="tabs">
			        <li class="tab col s6"><a class="active" style="cursor: pointer;">New Message</a></li>
			         <li class="tab col s6"><a onclick="goToPage();" style="cursor: pointer;">All Message</a></li>
			      </ul>
			    </div>
		  </div>
		   <!--Start Search  -->
		  <div class="row" id="dsprowwrapper">
		  		<div class="col s12 m6 l6">
		  		 <div class="file-field input-field">
				      <div class="btn">
				        <span>Display Row</span>
				      </div>
				      <div class="file-path-wrapper" style="padding: 0px; margin: 0px;">
						<p class="range-field" style="margin: 25px 0px 0px 0px; padding: 0px;">
					      <input type="range" id="displayrow" min="5" max="10" />
					    </p>
					 </div>
				    </div>
		  		</div>
		  </div>
		  <!--end search  -->
		  <!--message displayer  -->
		  <div class="row col s12" style='margin:0px auto;'>
			<div class="col s12" id="message_diplayer" style='margin: auto;'>
			</div>
			</div>
			<!--end displayer  -->
			 <!--pagination  -->
			<div class='row col s12' style="text-align: right;">
			<ul class="pagination" id="pagination">
			  </ul>
			</div>
			 <!--end pagination -->
		<div id="modal1" class="modal modal-fixed-footer">
		    <div class="modal-content">
		      <div class="row" style="margin: 0px; padding: 0px;">
			      	<div class="col s7">
			      	 	<h6 id="memo_title"></h6>
			      	</div>
			      	<div class="col s5">
			      	   <h6 id="website"></h6>
			      	</div>
		      </div>
		      <p id="memo_content"></p>
		    </div>
		    <div class="modal-footer">
		       <small id="memo_date"></small>
		      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat " style="color:red;">Close</a>
		    </div>
	  </div>
	  <!--end modal  -->
		</div>
		<!-- ./close row body which contain body left and body right -->
		<!-- ./Page Layout body here -->
	<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
	<style>
   .numnotify{
  	width: 25px;
  	height: 20px;
  	border-radius:3px;
  	padding:2px;
  	background: #FBC02D;
  	color:white;
  	font-size: 12px;
  	font-weight: bolder;
  	margin-bottom: 5px;
  	display: none;
  	
  }
  .card-panel {
    position: relative;
    -webkit-animation: mymove 0.5s; /* Chrome, Safari, Opera */ 
  	}
	 @-webkit-keyframes mymove {
	    0%   {top: 0px;}
	    50%  {top: 100px}
	    100% {top: 0px;}
	}
  </style>
    <!-- ./Container --> 
	<!-- User Dashboard Script -->
	<!-- User Report -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_report.js"></script>
	<!-- Sweet Alert -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
  </body>
  
</html>
