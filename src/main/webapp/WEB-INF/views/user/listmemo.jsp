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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/font-awesome-4.3.0/css/font-awesome.min.css"/>
	<!-- Materialize Icon -->
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
	<!--Let browser know website is optimized for mobile-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<!-- Own Style -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/dashboard.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/user/css/user_report.css">
	<!-- Sweet Alert --> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.css"/>
	<!--Import jQuery before materialize.js-->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
    <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-2.1.1.min.js"></script> -->
</head>
<body style="background: #ECEFF1;">
	<!-- Dropdown Structure -->
	<ul id="dropdown1" class="dropdown-content">
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
	</ul> 
	<ul id="dropdown2" class="dropdown-content">
	  <li><a href="${pageContext.request.contextPath}/user/userprofile" >Account</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/user/userpassword" >Password</a></li>
	  <li class="divider"></li>
	  <li><a href="${pageContext.request.contextPath}/logout">Log out</a></li>
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
	      <li>
	      	<img src="${pageContext.request.contextPath}/resources/user/image/${sessionScope['USER'].image}" style="margin-top:10px;" width="35px;" height="35px;" alt="" class="circle"/>
	      </li>
	      <!-- Dropdown Trigger -->
	      <li>
	      	<a class="dropdown-button" href="#!" data-activates="dropdown1">Hi,&nbsp;
	      	<span>${sessionScope['USER'].username}</span><i class="material-icons right">arrow_drop_down</i></a>
	      </li>	      
	    </ul>
	    <!-- For mobile menu -->
	     <ul class="side-nav" id="mobile-demo">
	      <li><a href="user">Home</a></li>
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
	    </ul>
	  </div>
	</nav>
	</div>
	<!-- ./close navigation -->
	<div class="container-fluid" style="margin:20px 20px; padding:5px; background: white;">
		<div class="row">
	    <div class="col s12">
		      <ul class="tabs" style="overflow: hidden;">
		        <li class="tab col s6"><a id="writememo" style="cursor: pointer;">Write New Memo</a></li>
		        <li class="tab col s6"><a class="active" style="cursor: pointer;">All Memo</a></li>
		      </ul>
		    </div>
	  </div>
	  <!--Search Panel  -->
	  <div class="row" id="optionwrapper">
		  	<div class="input-field col s12 m4 l4">
			    <select id="searchopt">
			      <option value="" selected>Search Option</option>
			      <option value="title">Title</option>
			      <option value="ispublic">Privacy</option>
			      <option value="domain">Domain</option>
			       <option value="date">Date</option>
			    </select>
		  </div>
		  <div class="input-field col s12 m4 l4" id="opt1" style="display: none;">
			    <nav>
			    <div class="nav-wrapper">
			      <form>
			        <div class="input-field">
			          <input id="search" type="search" onkeyup="handleKeyPress()">
			          <label for="search"><i class="material-icons">search</i></label>
			          <i class="material-icons">close</i>
			        </div>
			      </form>
			    </div>
			  </nav>
		  </div>
		  <div class="input-field col s12 m4 l4" id="opt2" style="display: none;">
			    <select id="ispublic">
			      <option value="false">Private</option>
			      <option value="true">Public</option>
			    </select>
		  </div>
		  <div class="input-field col s12 m4 l4" id="opt3" style="display: none;">
			    <nav>
				    <div class="nav-wrapper">
				      <form>
				        <div class="input-field">
				          <input id="search1" type="search" onkeyup="handleKeyPress()">
				          <label for="search1"><i class="material-icons">search</i></label>
				          <i class="material-icons">close</i>
				        </div>
				      </form>
				    </div>
				  </nav>
			  </div>
		  <div class="input-field col s12 m4 l4" id="opt4" style="display: none;">
			  <input type="date" class="datepicker" id="sdate" placeholder="DATE">
		  </div>
		  <div class="col s12 m4 l4 right" id="rowwrapper">
		  		 <div class="file-field input-field">
				      <div class="btn" id="btntest">
				        <span>Row</span>
				      </div>
				      <div class="file-path-wrapper">
						<p class="range-field" style="margin: 25px 0px 0px 0px;">
					      <input type="range" id="displayrow" min="5" max="10" />
					    </p>
					 </div>
				    </div>
		  		</div>
	  </div>
	  <!--end search panel  -->
		<!-- Page Layout body here -->
		<div class="row">	
			<div class="col s12" id="listmemo">
			</div>
		</div>
		<!--pagination  -->
			<div class='row col s12' style="text-align: right;">
			<ul class="pagination" id="pagination">
			 </ul>
			</div>
			 <!--end pagination -->
	</div>
	<!--end contain fluit  -->
		 <!--mem view modal -->
		<div id="modal1" class="modal modal-fixed-footer">
		    <div class="modal-content">
		      <div class="row" style="margin: 0px; padding: 0px;">
			      	<div class="col s7">
			      	 	<h6 id="memo_title" style="color:blue;"></h6>
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
	  <div id="modal2" class="modal modal-fixed-footer">
		    <div class="modal-content">
		 		<div class="row col s12">
					 			<div class="row z-depth-1" style="margin: 0px;">
						<form action="#" method="POST" enctype="multipart/form-data" style="margin: 0px;">
							<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
								<!-- List of components memo--> 
								<div class="row" style="margin:0px; padding: 0px;">
									<div class="col s12 m9 l10" style="margin:0px; padding: 0px;">
											<div class="input-field col s12">
											  <input id="icon_prefix" type="text" class="titlememo validate">
											</div>
									</div>
									<div class="col s12 m3 l2" style="margin:0px; padding: 0px;">
										<div class="input-field col s12">
											<select id="privacy" >
											      <!-- <option value="" disabled selected>Choose your option</option> -->
											      <option value="0">Private</option>
											      <option value="1">Public</option>
										    </select>
									    </div> 
									</div>
								</div>
			
							<!-- Text Area here -->
								<div class="row " style="margin:0px">
									<div class="col s12 m12 l12" style="padding:15px;">
										<textarea id="cont_memo" style="resize:none; width:100%; height:200px;padding:15px;">							
										</textarea>
									</div>
								</div>
							<!-- ./Textarea -->
							<!-- url and buttons here -->
								<div class="row " >
									<div class="col s12 m12 l6">
									  <label class="active" style="color:#FF5722;"><b>Memo URL</b></label>
									  <input type="text" class="browser-default default-link" readonly="readonly" id="editurl">
									</div>	
									<div class="col s12 m12 l6" id="btneditwrapper"> 	
									</div>													
								</div>
							<!-- ./ url here -->
						</form>
						</div>
		 		</div>
		    </div>
		    <div class="modal-footer">
		      <a href="#!" class="modal-action modal-close waves-effect waves-green btn-flat " style="color:red;">Cancel</a>
		    </div>
	  </div>
	  <!--end modal  -->
	<input type="text" id="userid" value="${sessionScope['USER'].userid}" hidden="true"/>
    <!-- ./Container --> 
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/materialize/js/materialize.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/init.js"></script>
	<!-- User Memo Dashboard Script -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/memo_action.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/user/js/pagination_memo.js"></script>
	<!-- Sweet alert js -->
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/sweetalert-master/dist/sweetalert.min.js"></script>
	<!-- User report nitification -->
	  <script type="text/javascript">
		  function getNumberMesage(){
				var uid=parseInt($("#userid").val());
				$.ajax({
					type : "GET",
					url : "http://localhost:8080/HRD_MEMO/user/numbermessage/"+uid,
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
		  var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
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