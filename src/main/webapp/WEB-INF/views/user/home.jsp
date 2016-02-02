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
	<!--Import jQuery before materialize.js-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/lib/jquery.slimscroll.min.js"></script>
</head>
<body>
	<!-- Navbar goes here -->
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/login?logout">Log out</a></li>
	</ul> 
	<ul id="dropdown2" class="dropdown-content">
	 	<li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/login?logout">Log out</a></li>
	</ul>
	<div class="navbar-fixed">  
	<nav>
	  <div class="nav-wrapper teal">
	     <a href="#!" class="brand-logo">&nbsp;&nbsp;<i class="fa fa-file-text"></i></a>
	    <a href="#" data-activates="mobile-demo" class="button-collapse"><i class="material-icons">menu</i></a>
	    <ul class="right hide-on-med-and-down">
	      <li><a href="user">Home</a></li>
	      <li><a href="${pageContext.request.contextPath}/user/userreport">
	      <i class="fa fa-envelope-o" style="font-weight:bolder; font-size: 20px;"><span class="numnotify"></span></i></a></li>
	      <li style="padding:5px;">
	      	<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="margin-top:6px;" width="35px;" height="35px;" alt="" class="circle"/>
	      </li>
	      <!-- Dropdown Trigger -->
	      <li>
	      	<a class="dropdown-button" href="#!" data-activates="dropdown1">Hi,&nbsp;
	      	<span>${sessionScope['USER'].username}</span><i class="material-icons right">arrow_drop_down</i></a>
	      </li>	           
	    </ul>
	    <!-- For mobile menu -->
	     <ul class="side-nav" id="mobile-demo">
	      <li><a href="user"">Home</a></li>
	        <li><a href="${pageContext.request.contextPath}/user/userreport">
	        <i class="fa fa-envelope-o" style="font-weight:bolder; font-size: 20px;"><span class="numnotify"></span></i></a></li>
	      <li>
	      	<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="margin-top:10px;" width="35px;" height="35px;" alt="" class="circle"/>
	      </li>
	      <!-- Dropdown Trigger -->
	      <li>
	      	<a class="dropdown-button" href="#!" data-activates="dropdown2">
	      	<span>${sessionScope['USER'].username}</span><i class="material-icons right">arrow_drop_down</i></a>
	      </li>	           
	    </ul>
	  </div>
	</nav>
	</div>
	<!-- ./close navigation -->
		 <div class="row">
		</div>
		
		
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
  .waves-effect,.pbtn{
   cursor: pointer;
  }
  </style>
    <!-- ./Container --> 
	<!-- User Dashboard Script -->
	<!-- User Report -->
	<script type="text/javascript">
	     var path="${pageContext.request.contextPath}";
	     function getNumberMesage(){
				var uid=parseInt($("#userid").val());
				$.ajax({
					type : "GET",
					url : path+"/user/numbermessage/"+uid,
					success : function(data) {
						if(data.DATA>0){
							$(".numnotify").css('display',"inline");
							$(".numnotify").text(data.DATA);
						}else{
							$(".numnotify").css('display',"none");
						}
					},
					error : function(data) {
					}
				});
			}
		  getNumberMesage();
		  var url="ws://"+location.hostname+":"+location.port+"/HRD_MEMO/memo/usernotification";
		  var websocket=new WebSocket(url);
		  websocket.onopen=function(message){
		  }
		  websocket.onclose=function(message){
		 	 websocket.close();
		  }
		  websocket.onmessage=function(message){
		 	 if(message.data==="response"){
		 		 getNumberMesage();
		 	 }
		  }
	</script>
  </body>
</html>
