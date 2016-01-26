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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.css"/>
	<!--Import jQuery before materialize.js-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
</head>
<body >
	<!-- Navbar goes here -->
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="${pageContext.request.contextPath}/user/userreport">Report<span id="total_report" style="color:red;"></span></a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account Information</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/login?logout">Log out</a></li>
	</ul>        	
	<nav>
	  <div class="nav-wrapper teal">
	    <a href="#!" class="brand-logo">&nbsp;&nbsp;MEMO PESS</a>
	    <ul class="right hide-on-med-and-down">
	      <li><a href="${pageContext.request.contextPath}/user/user">Home</a></li>
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
	<div class="container">
		<!-- Page Layout body here -->
		<div class="row">
			<div class="col s12 m12 l12">
			<!-- Current user -->
				<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
				<div id="list_report_area">
				
				</div>
				<%-- <ul class="collection">
					    <li class="collection-item avatar">
					      <img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" alt="" class="circle">
					      <span class="title">Nem Sopheak</span>
					      <p> This is not a good memo.
					      </p>
					      <a href="#!" class="secondary-content"><i class="material-icons">textsms</i></a>
					    </li>
				  </ul> --%>
			</div>
		</div>
		<!-- ./close row body which contain body left and body right -->
		<!-- ./Page Layout body here -->
	</div>
    <!-- ./Container --> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<!-- User Dashboard Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_dashboard.js"></script> 
	<!-- Personal Information -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_profile.js"></script>
	<!-- Personal Information -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_report.js"></script>
	<!-- User Report -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/user_report.js"></script>
	<!-- Sweet Alert -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
  </body>
</html>