<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css'

	href='${pageContext.request.contextPath}/resources/materialize/css/materialize.css' />
	<link rel='stylesheet' href='${pageContext.request.contextPath}/resources/css/icondisplayer.css'/>
<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/materialize/js/materialize.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/alertify.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/js/lib/jquery.slimscroll.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-cookie.js'></script>

</head>
<body style="margin: 0px; padding: 0px;">
	<div class='row' style="margin: 0px; padding:0px;" id="frm-loginreg-wrapper">
	 <ul class="collapsible" data-collapsible="accordion" style=" background:#E0F2F1; box-shadow:0px 2px 4px gray;">
    <li style=" background:#E0F2F1; box-shadow:0px 2px 4px gray;" class="active">
    <!--Login form  -->
      <div class="collapsible-header active"><i class="material-icons">lock_open</i>Login</div>
      <div class="collapsible-body">
      	 <div class="row">
	        <div class="input-field col s12">
	          <i class="material-icons prefix">account_circle</i>
	          <input id="loginemail" type="email" class="validate" onkeypress="LoginhandleKeyPress(event);">
	          <label for="loginemail">Email</label>
	        </div>
	        <div class="input-field col s12" style="margin: 0px;">
	          <i class="material-icons prefix">vpn_key</i>
	          <input id="loginpassword" type="password" class="validate" onkeypress="LoginhandleKeyPress(event);">
	          <label for="loginpassword">Password</label>
	        </div>
	        <div class="input-field col s12"
						style="text-align: right; margin: 0px;">
						<button class="btn waves-effect" type="button" id='btn-login-memo' onclick="loginMemo();">
						<i class="material-icons">
						done</i></button>
			</div>
      </div>
      </div>
    </li>
    <!--End Login Form  -->
    <!--Register form  -->
    <li >
      <div class="collapsible-header"><i class="material-icons">open_in_new</i>Signup</div>
      <div class="collapsible-body">
      	 <div class="row">
      	  <div class="input-field col s12" >
          <input id="name" type="text" class="validate">
          <label for="name">Name</label>
        </div>
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
        <div class="input-field col s12">
          <input id="password" type="password" class="validate" onkeypress="registerhandleKeyPress(event);">
          <label for="password">Password</label>
        </div>
        <div class='row'>
        <div class='col s8'>
					<input class="with-gap" name="gender" type="radio" value="male"
						id="male" checked /> <label for="male">Male</label> <input
						class="with-gap" name="gender" type="radio" value="female"
						id='female' /> <label for="female">Female</label>
				</div>
        <div class="input-field col s4"
					style="text-align: right; margin: 0px;">
					<button class="btn waves-effect" type="button" id='btn-signup-memo' onclick="signUpUser();"><i class="material-icons">
					send</i></button>
		</div>
		</div>
      </div>
      </div>
    </li>
    <!--End Register Form  -->
  </ul>
  </div>
	<!--Memo Form-->
	<div class="row" style="margin: 0px; padding: 0px;" id="frm-memodesc-panel">
		<div class="row" style="margin: 0px; padding: 5px; background:#FAFAFA;" id="frm-memo-wrapper">
			<form class="col s12" id="hrd-memo-frm" style="margin: 0px; padding: 0px;">
					<div class="input-field row col s12"
						style="text-align: right; padding: 0px; margin: 0px 0px 2px 0px;">
						<textarea id="descmemo"
						placeholder="//MEMO HERE AND PRESS A+M TO SWAP" onkeypress="handleKeyPress(event)">
						</textarea>
				</div>
				<div class="row" style="padding: 0px; margin: 0px;">
					<div class="input-field col s3" style="padding: 0px; margin: 0px;" title="save memo as public?" >
						<input type="checkbox" class="filled-in" id="public" ><label
							for="public">Public</label>
					</div>
					<div class="input-field col s9"
						style="text-align: right; padding: 0px; margin: 0px;">
						<button class="btn waves-effect" title="save memo"
						type="button" id='btn-save-memo' style="padding: 0px 10px;" 
						onclick="saveMemo()"><i class="material-icons">input</i></button>
					</div>
				</div>
			</form>
		</div>
	<!--End memo form  -->
	<div class="row" style="margin: 0px; padding: 0px;">
		<div class="switch col s6" style="margin: 5px 0px; text-align: left; color:red;">
	    	<label>Owner<input type="checkbox" id="useropt" style="margin-top: 5px;"><span class="lever"></span>Public</label>
	  	</div>
	  	<div class="col s6" style="margin: 5px 0px;">
	    	<p class='mysignout right' style="cursor:pointer; margin:0px;font-size: 8px; width:20px; height:20px; float:right;" title='signout'  onclick="signOut();"><i class="material-icons">settings_power</i></p>
	  	</div>
  	</div>
	<div id="mydespanel" style="margin: 5px 0px 0px 0px; padding: 0px 0px 10px 0px; border-bottom:2px solid #009688; overflow-y:auto; overflow-x:hidden;">
	</div>
	</div>

	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/iframeResizer.contentWindow.min.js" defer></script>

	<!-- my script -->
	<script type="text/javascript">
	//my variable
	//alert(location.hostname);
		var retrievedObject="";
	 var desc_panel=document.getElementById("mydespanel");
	var cur_h=0,domain="",url="",title="";
	//retriev object
	function initailizePage(){
		try {
				retrievedObject = JSON.parse(Cookies.get('MEMO')); 
				
		}catch(err) {
		    retrievedObject="";
		}
		if(retrievedObject==""){
			
			$("#frm-loginreg-wrapper").css('display','block');
			$("#frm-memodesc-panel").css('display','none');
		}else{
			$("#frm-loginreg-wrapper").css('display','none');
			$("#frm-memodesc-panel").css('display','block');
		}
	}
	//Recieve data from parent
	var first=true;
	var iFrameResizer = {
			messageCallback : function(message) {
				
				var pData = message;
				var getPdata=pData.split("hrdmem");
				cur_h=getPdata[0];
				domain=getPdata[1];
				url=getPdata[2];
				title=getPdata[3];
				if(first==true&&retrievedObject!==""){
				pluginGetMemoOwner();
				first=false;
				}
				initailizePage();
				 $(".slimScrollDiv").css('height',getPdata[4]-150+'px');
				 $("#mydespanel").css('height',getPdata[4]-150+'px');
				if(document.getElementById("useropt").checked){
					 pluginGetMemoPulic();
				 }else if(first==false){
					 pluginGetMemoOwner();
				 }
				//alert(getPdata[4]);
			}
	     
		}
	//create description box
	function createDescribeBox(text,title,image,userid,memoid,date,username){
		var desc=document.createElement("div");
		//create image and data wrapper
		var memo_img_wraper=document.createElement("DIV");
		memo_img_wraper.setAttribute("class","memo_img_wrapper");
		memo_img_wraper.setAttribute("title",title);
		var user_memo_img=document.createElement("img");
		user_memo_img.setAttribute('class','user-memo-img');

		user_memo_img.setAttribute('src','${pageContext.request.contextPath}'+'/resources/user/image/'+image);
        user_memo_img.setAttribute('title',username);
		memo_img_wraper.appendChild(user_memo_img);
		//create title 
		var memo_title_label=document.createElement('small');
		memo_title_label.setAttribute('id','mytitle');
		memo_title_label.style.color="white";
		memo_title_label.style.float="right";
		memo_title_label.style.margin="7px 0 0 0";
		memo_title_label.style.paddingRight="10px";
		memo_title_label.style.fontSize="14px";
		var memo_desc_title=document.createTextNode(generateTitle(title));
		memo_title_label.appendChild(memo_desc_title);
		memo_img_wraper.appendChild(memo_title_label);
		//create date label
		var memo_date_label=document.createElement('small');

		memo_date_label.style.width="100%";
		memo_date_label.style.color="gray";
		memo_date_label.style.float="left";
		memo_date_label.style.margin="0px";
		if(userid==retrievedObject.userid){
			var memo_desc_date=document.createTextNode("owner     Date: "+date);
		}else{
			var memo_desc_date=document.createTextNode("public      Date: "+date);
		}
		
		memo_date_label.appendChild(memo_desc_date);
		///
		desc.setAttribute('class','chip');
		var close=document.createElement("i");
		close.setAttribute('class','material-icons my_delete_btn');
		close.setAttribute('title','Delete');
		close.style.float="right";
		close.style.color="red";
		close.style.marginRight="7px";
		close.setAttribute('onclick','toDelete('+memoid+')');
		var close_text=document.createTextNode("delete");
		close.appendChild(close_text);
		var report=document.createElement("i");
		report.setAttribute('class','material-icons');
		report.setAttribute('onclick','reportMemo('+retrievedObject.userid+','+memoid+')');
		report.setAttribute('title','Report');
		report.style.marginRight="7px";
		report.style.float="right";
		report.style.color="#FFC107";
		var report_text=document.createTextNode("assignment");
		report.appendChild(report_text);
		var desc_text=document.createElement("div");
		desc_text.setAttribute('id','mycontent');
		desc_text.setAttribute('class','col s12 content');
		desc_text.style.margin="10px 0 10px 0";
		desc_text.appendChild(document.createTextNode(text));
		
		if(text.length>105){
			var readmore = document.createElement("a");
			readmore.setAttribute('class','read more');
			var smalldot=document.createElement("small");
			smalldot.appendChild(document.createTextNode("... "));
			smalldot.style.color = "black";
			readmore.appendChild(smalldot);
			readmore.appendChild(document.createTextNode("More"));
			desc_text.appendChild(readmore);
		}
				
		//create edit text
		var edit=document.createElement("i");
		edit.setAttribute('class','material-icons edit-btn');
		edit.setAttribute('onclick','getEditMemo('+memoid+')');
		edit.setAttribute('title','Edit');
		edit.style.float="right";
		edit.style.color="#00E676";
		var edit_text=document.createTextNode("note_add");
		edit.appendChild(edit_text);
		//create export btn
		var exportpdf=document.createElement("i");
		exportpdf.setAttribute('class','material-icons');
		exportpdf.setAttribute('title','Export to PDF');
		exportpdf.style.float="right";
		exportpdf.style.color="#3F51B5";
		exportpdf.style.marginRight="0px";
		exportpdf.setAttribute('onclick','exportPdf()');
		var pdf_text=document.createTextNode("description");
		exportpdf.appendChild(pdf_text);
		//create footer
		var memo_footer=document.createElement("div");
		memo_footer.setAttribute('class','mymemo-footer');
		memo_footer.appendChild(memo_date_label);
		desc.appendChild(memo_img_wraper);
		desc.appendChild(desc_text);
		if(userid==retrievedObject.userid){
			memo_date_label.appendChild(close);
			memo_date_label.appendChild(edit);
			memo_date_label.appendChild(exportpdf);
			memo_img_wraper.style.background="rgba(0, 0, 0, 0) linear-gradient(#50a253, #4c954d) repeat scroll 0 0";
		}
		if(userid!=retrievedObject.userid){
			memo_date_label.appendChild(report);
			memo_img_wraper.style.background="#B0BEC5";
		}
		desc.appendChild(memo_footer);
		desc_panel.appendChild(desc);
	}
	//list memo to panel
	function removeAllChild(){
		while( desc_panel.hasChildNodes() ){
			desc_panel.removeChild(desc_panel.lastChild);
		}
	}
	var ihave=false;
	function listMemoDescriptionBox(data){
		removeAllChild();
		for(var i=0;i<data.DATA.length;i++){
			if(data.DATA[i].userid==retrievedObject.userid){
				ihave=true;
			} 
			createDescribeBox(data.DATA[i].content,data.DATA[i].title,data.DATA[i].userimage,data.DATA[i].userid,data.DATA[i].id,data.DATA[i].date,data.DATA[i].username);
		}
		if(ihave==true){
			 $("#frm-memo-wrapper").css('display','none');
			ihave=false;
		}
	}
	//List Owner Memo
	function pluginGetMemoOwner(){
		var json=new Object();
		json.url=url;
		json.userid=retrievedObject.userid;
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}'+"/plugin/plugingetmemoowner",

			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				listMemoDescriptionBox(data);
			},
			error : function(data) {
				removeAllChild();
			}
		});
	}
	
	//List Public Memo
	function pluginGetMemoPulic(){
		var json=new Object();
		json.url=url;
		json.userid=retrievedObject.userid;
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}'+"/plugin/plugingetmemopublic",
			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				listMemoDescriptionBox(data);
			},
			error : function(data) {
				removeAllChild();
			}
		});
	}
	//editmemo
	//click on decription button
	$(document).on('click.chip', '.chip .material-icons', function (e) {
				if($(this).text()==='assignment'){
					    alertify.prompt("Enter your report to this memo", function (e, str) {
					    if (e&&str!=""){
					    	pluginUserReport(us_rpid,mm_rpid,str);
					    }
						}, "");
			    }else if($(this).text()==='delete'){
			    	alertify.confirm("Do you want to delete?", function (e) {
			    	    if (e) {
			    	    	 pluginDeleteMemo(deleteId);
			    	    	 alertify.success("Memo has been deleted");
			    	    } else {
			    	    	alertify.error("You canceled");
			    	    }
			    	});
			    }
	});
	//user report
	var us_rpid=0,mm_rpid=0;
	function reportMemo(rpid,mmid){
		initailizePage();
		us_rpid=rpid;
		mm_rpid=mmid;
	}
	function pluginUserReport(reporterid,memoid,description){
		var json={
				reporterid:reporterid,
				memoid:memoid,
				description:description
		};
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}'+"/plugin/report",
			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				 alertify.success("REPORT SUCCESSED..!");
				 sendReportNotify('report');
			},
			error : function(data) {
				 alertify.error("REPORT FAILED..!");
			}
		});
	}
	//save memo
	function saveMemo(){
		initailizePage();
		if ($("#descmemo").val() != "") {
			$("#descmemo").css('border', '2px solid #009688');
		var ismpublic=false;
		var pbl = document.getElementById("public");
		if (pbl.checked) {
			ismpublic = true;
		} else {
			ismpublic = false;
		}
		var json={
				content:$("#descmemo").val(),
				title:title,
				domain:domain,
				url:url,
				ispublic:ismpublic,
				isenable:true,
				userid:retrievedObject.userid
			};
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}'+"/plugin/savememo",
				contentType: 'application/json;charset=utf-8',
		        data:JSON.stringify(json),
				success : function(data) {
					$("#descmemo").val("");
					$("#descmemo").focus();
					$("#public").prop('checked','');
					if(document.getElementById("useropt").checked==false){
						 pluginGetMemoOwner();
						 $("#frm-memo-wrapper").slideUp(500);
					 }
					//$("#frm-memo-wrapper").fadeOut(500);
					if(ismpublic==true){
						//sendReportNotify("public");
					}
				},
				error : function(data) {
					 alertify.error("YOU MEMO ONLY ONE IN ONE ARTICLE..!");
				}
			});
		} else {
			$("#descmemo").css('border', '2px solid #D50000');
			$("#descmemo").focus();
		}
	}
	//login memo
	function validateEmail(email) {
		var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
		return re.test(email);
	}
	function loginMemo() {
		var email=$("#loginemail").val();
		var pwd=$("#loginpassword").val();
		if (validateEmail($("#loginemail").val()) == true
				&& $("#loginpassword").val() != "") {
			var json = {
				email : $("#loginemail").val(),
				password : $("#loginpassword").val()
			};
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}'+"/plugin2/login",
		        data:json,
				success : function(data){
					logingMainMemo(email,pwd);
					$("#useropt").prop('checked','');
					$("#public").prop('checked','');
					Cookies.set('MEMO',JSON.stringify(data.DATA));
					retrievedObject=Cookies.getJSON('MEMO');
					$("#frm-loginreg-wrapper").css('display','none');
					$("#frm-memodesc-panel").fadeIn(500);
					$("#frm-memo-wrapper").slideDown(500);
					$("#descmemo").val("");
					$("#descmemo").focus();
				},
				error : function(data) {
					 alertify.error("LOGIN FAILED..!");
				}
			});
			$("#loginemail").val("");
		$("#loginpassword").val("");
		} else {
			if (validateEmail($("#loginemail").val()) == false) {
				 alertify.error("INVALID EMAIL..!");
			}
		}
	}
	//sign up user
	function signUpUser() {
		var email= $("#email").val();
		var pwd= $("#password").val();
		if ($("#name").val() != "" && validateEmail($("#email").val()) == true
				&& $("#password").val() != "") {
			var mygender=$('input[name="gender"]:checked').val();
			var myimg="";
			if(mygender=="female"){
				myimg="girl-avatar.png";
			}else{
				myimg="boy-avatar.png";
			}
			var json = {
				username : $("#name").val(),
				email : $("#email").val(),
				password : $("#password").val(),
				gender : $('input[name="gender"]:checked').val(),
				image : myimg
			};
			$.ajax({
				type : "POST",
				url : '${pageContext.request.contextPath}'+"/signup",

				contentType: 'application/json;charset=utf-8',
		        data:JSON.stringify(json),
				success : function(data) {
					logingMainMemo(email,pwd);
					$("#useropt").prop('checked','');
					$("#public").prop('checked','');
					Cookies.set('MEMO',JSON.stringify(data.DATA));
					retrievedObject=Cookies.getJSON('MEMO');
					$("#frm-loginreg-wrapper").css('display','none');
					$("#frm-memo-wrapper").slideDown(500);
					$("#frm-memodesc-panel").fadeIn(500);
					pluginGetMemoOwner();
					username : $("#name").val("");
					email : $("#email").val("");
					password : $("#password").val("");
					$("#descmemo").val("");
					$("#descmemo").focus();
				},
				error : function(data) {
					 alertify.error("EMAIL IS EXIST");
					 $("#email").focus();
				}
			});
		} else {
			if ($("#name").val() == "" || $("#email").val() == ""
					|| $("#password").val() == "") {
				alertify.error("INVALID INFO");
			} else if (validateEmail($("#email").val()) == false) {
				 alertify.error("INVALID EMAIL");
			}
		}
	}

	//edit memo
	var isEdit=false;
	var editMemoId=0;
	function getEditMemo(id){
		initailizePage();
		$.ajax({
			type : "GET",
			url : '${pageContext.request.contextPath}'+"/plugin/toedit/"+id,
			success : function(data) {
				$("#descmemo").val(data.DATA.content);
				var p=data.DATA.ispublic;
				if(p==true){
					$("#public").prop('checked','checked');
				}
				$("#frm-memo-wrapper").slideDown(500);
				$(".my_delete_btn").fadeOut();
				$("#btn-save-memo").html("<i class='large material-icons'>mode_edit</i>");
				$("#btn-save-memo").attr("onclick","updateMemoContent("+id+")");
				isEdit=true;
				editMemoId=id;
				$(".edit-btn").css('margin-right','10px');
			},
			error : function(data) {
			}
		});
	}
	function updateMemoContent(id){
		var pbl = document.getElementById("public");
		if (pbl.checked) {
			ismpublic = true;
		} else {
			ismpublic = false;
		}
		var json={
				id:id,
				content:$("#descmemo").val(),
				ispublic:ismpublic
		};
		$.ajax({
			type : "POST",
			url : '${pageContext.request.contextPath}'+"/plugin/editmemocontent",
			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				if(!document.getElementById("useropt").checked){
					 pluginGetMemoOwner();
				 }
				//$("#frm-memo-wrapper").slideUp(1000);
				$("#btn-save-memo").html("<i class='material-icons'>input</i>");
				$("#btn-save-memo").attr("onclick","saveMemo()");
				$("#descmemo").val("");
				$("#public").prop('checked','');
				$(".my_delete_btn").fadeIn();
				alertify.success("Memo has been updated");
				$(".edit-btn").css('margin-right','2px');
				 $("#frm-memo-wrapper").slideUp(500);
					//sendReportNotify("public");
			},
			error : function(data) {
				 alertify.error("Memo has been update failed");
			}
		});
		ismpublic = false;
	}
	//passwor login textbox enter event
	function LoginhandleKeyPress(e){
		 var key=e.keyCode || e.which;
		  if (key==13){
			 loginMemo();
		  }
	}
	//passwor register textbox enter event
	function registerhandleKeyPress(e){
		 var key=e.keyCode || e.which;
		  if (key==13){
			 signUpUser();
		  }
	}
	//delete memo
	var deleteId=0;
	function pluginDeleteMemo(id){
		initailizePage();
		$.ajax({
			type : "GET",
			url : '${pageContext.request.contextPath}'+"/plugin/"+id,
			success : function(data) {
				 pluginGetMemoOwner();
				 $("#frm-memo-wrapper").slideDown(500);
			},
			error : function(data) {
			}
		});
	}
	function toDelete(id){
		deleteId=id;
	}
	//CREATE REPORT ALERT
	var my_rp_popup=document.createElement("P");
	my_rp_popup.setAttribute("id","my-rp-popup");
	$('body').append(my_rp_popup);

	$("#descmemo").val("");
	$("#descmemo").focus();
	$('#mydespanel').slimScroll({
		alwaysVisible: false,
	              size:'5px',
	               color: '#009688'
	});
	 //on keyup textarea auto increase height
    $("#descmemo").keyup(function() {
      //default height
      $(this).css('height', '70px');
      //change height
      $(this).css('height', ($(this).prop('scrollHeight')) + "px");
    });
	//Live life
	 var hrd_notify_url="ws://"+location.host+"/memo/usernotification";

	 var hrd_memo_websocket=new WebSocket(hrd_notify_url);
	 hrd_memo_websocket.onopen=function(message){
	 }
	 hrd_memo_websocket.onclose=function(message){
	 	hrd_memo_websocket.close();
	 }
	 hrd_memo_websocket.onmessage=function(message){
	 	 if(message.data==="response"){
	 		 
	 	 }else if(message.data==="public"){
	 		pluginGetMemoPulic();
	 	 }
	 }
	 function sendReportNotify(message){
			hrd_memo_websocket.send(message);
	 }
	 
	 function generateTitle(title){
		 var tl=title.length;
		 if(tl>30){
			 return title.substring(0, 30)+"...";
		 }else{
			 return title;
		 }
	}
	 $("#useropt").change(function(){
		 if(document.getElementById("useropt").checked){
			 pluginGetMemoPulic();
		 }else{
			 pluginGetMemoOwner();
		 }
	 });
	 function signOut(){
		 $("#frm-memodesc-panel").fadeOut(300,function(){
				$("#frm-loginreg-wrapper").fadeIn(300);
			});
		 Cookies.remove('MEMO');
		 $.ajax({
				url : "${pageContext.request.contextPath}/plugin2/logout",
				type : "GET",
				success : function(data){
				},
				error : function(data) {
					console.log(data);
				}
			});
	 }
	 function logingMainMemo(email,pwd){
					var json={
							username:email,
							password:pwd
					};
					$.ajax({
						url : "${pageContext.request.contextPath}/login",
						type : "POST",
						dataType:'json',
						data :json,
						success : function(data) {
						},
						error : function(data) {
							pluginGetMemoOwner();
							console.log(data);
						}
					});
	 }
	 $("body").on("click",".read",function(){
		if($(this).text()=="... More") $(this).text("Less"); 
		else							$(this).text("... More");
		$(this).toggleClass("more less");
		$(this).parent().toggleClass("content"); 
	 });
	 function exportPdf(){
		 var url="${pageContext.request.contextPath}/getpdffile";
         $.ajax({
                type: "GET", 
                url: url,
                data:{
               	 title:$("#mytitle").text(),
               	 content:$("#mycontent").text()
                }, 
                success: function(response, status, xhr){
                  var ct = xhr.getResponseHeader("content-type") || "";
                  if (ct.indexOf('xml') > -1) {
                         alert("xml");
                  }
                  if (ct.indexOf('pdf') > -1) {
                     window.open(url+"?title="+$("#mytitle").text()+"&content="+$("#mycontent").text());
                  }   
                },
                   error: function(error, status){
                     window.alert("Problem retrieving PDF.\nThe error status is: " + status);
                 }
              });
	 }
	</script>
</body>
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/alertify.core.css' />
<link rel='stylesheet'
	href='${pageContext.request.contextPath}/resources/css/alertify.default.css' />
</html>
