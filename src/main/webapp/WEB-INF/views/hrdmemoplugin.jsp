<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css'
	href='http://localhost:8080/HRD_MEMO/resources/materialize/css/materialize.css' />
	<link rel='stylesheet' href='http://localhost:8080/HRD_MEMO/resources/css/icondisplayer.css'/>
<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
<script
	src='http://localhost:8080/HRD_MEMO/resources/admin/js/jquery-2.1.4.min.js'></script>
<script
	src='http://localhost:8080/HRD_MEMO/resources/materialize/js/materialize.js'></script>
<script
	src='http://localhost:8080/HRD_MEMO/resources/js/alertify.min.js'></script>
<script
	src='http://localhost:8080/HRD_MEMO/resources/js/jquery.slimscroll.min.js'></script>
<script
	src='http://localhost:8080/HRD_MEMO/resources/admin/js/jquery-cookie.js'></script>
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
          <label for="loginemail">Emmail</label>
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
          <label for="email">Emmail</label>
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
	<div class="row" style="margin: 0px; padding: 5px; background:#B2DFDB; box-shadow:0px 2px 4px gray; " id="frm-memo-wrapper">
		<form class="col s12" id="hrd-memo-frm" style="margin: 0px; padding: 0px;">
				<div class="input-field row col s12"
					style="text-align: right; padding: 0px; margin: 0px 0px 2px 0px;">
					<textarea id="descmemo" style="max-height:100px; height: 70px; width: 100%; 
					max-width: 100%; border: 2px solid gray; background: white;" 
					placeholder="//MEMO HERE AND PRESS A+M TO SWAP" onkeypress="handleKeyPress(event)">
					</textarea>
			</div>
			<div class="row" style="padding: 0px; margin: 0px;">
				<div class="input-field col s3" style="padding: 0px; margin: 0px;">
					<input type="checkbox" class="filled-in" id="public"/><label
						for="public">Public</label>
				</div>
				<div class="input-field col s9"
					style="text-align: right; padding: 0px; margin: 0px;">
					<button class="btn waves-effect" type="button" id='btn-save-memo' onclick="saveMemo()"><i class="material-icons">input</i></button>
				</div>
			</div>
		</form>
	</div>
	<!--End memo form  -->
	<div id="mydespanel" style="margin: 5px 0px 0px 0px; padding: 0px; max-height: 500px; height: 500px; overflow-y:auto; overflow-x:hidden;">
	</div>
	</div>
	<style>
		*{
		padding: 0px;
		margin: 0px;
		}
	</style>
	<script type="text/javascript" src="http://localhost:8080/HRD_MEMO/resources/js/iframeResizer.contentWindow.min.js" defer></script>
	<!-- my script -->
	<script type="text/javascript">
	
	//my variable
	var retrievedObject=null;
	 var desc_panel=document.getElementById("mydespanel");
	var cur_h=0,domain="",url="",title="";
	//retriev object
	var retrievedObject="";
	try {
			retrievedObject = JSON.parse(Cookies.get('MEMO')); 
			
	}catch(err) {
	    retrievedObject="";
	}
	if(retrievedObject==""){
		$("#frm-memodesc-panel").css('display','none');
	}else{
		$("#frm-loginreg-wrapper").css('display','none');
	}
	//Recieve data from parent
	var first=true;
	var iFrameResizer = {
			messageCallback : function(message) {
				var pData = message;
				var getPdata=pData.split("#");
				cur_h=getPdata[0];
				domain=getPdata[1];
				url=getPdata[2];
				title=getPdata[3];
				if(first==true&&retrievedObject!==""){
				pluginGetMemo();
				first=false;
				}
			}
		}
	//create description box
	function createDescribeBox(text,title,image,userid,memoid,date){
		var desc=document.createElement("P");
		//create image and data wrapper
		var memo_img_wraper=document.createElement("DIV");
		memo_img_wraper.setAttribute("class","memo_img_wrapper");
		var user_memo_img=document.createElement("img");
		user_memo_img.setAttribute('class','user-memo-img');
		user_memo_img.setAttribute('src','http://localhost:8080/HRD_MEMO/resources/'+image);
		memo_img_wraper.appendChild(user_memo_img);
		//create title 
		var memo_title_label=document.createElement('small');
		memo_title_label.style.color="white";
		memo_title_label.style.float="right";
		memo_title_label.style.margin="0px";
		memo_title_label.style.paddingRight="10px";
		memo_title_label.style.fontSize="14px";
		var memo_desc_title=document.createTextNode(title);
		memo_title_label.appendChild(memo_desc_title);
		memo_img_wraper.appendChild(memo_title_label);
		//create date label
		var memo_date_label=document.createElement('small');
		memo_date_label.style.color="gray";
		memo_date_label.style.float="right";
		memo_date_label.style.margin="0px";
		var memo_desc_date=document.createTextNode(date);
		memo_date_label.appendChild(memo_desc_date);
		///
		desc.setAttribute('class','chip');
		var close=document.createElement("i");
		close.setAttribute('class','material-icons my_delete_btn');
		close.setAttribute('title','close');
		close.style.color="red";
		close.setAttribute('onclick','pluginDeleteMemo('+memoid+')');
		var close_text=document.createTextNode("delete");
		close.appendChild(close_text);
		var report=document.createElement("i");
		report.setAttribute('class','material-icons');
		report.setAttribute('onclick','reportMemo('+retrievedObject.userid+','+memoid+')');
		report.setAttribute('title','report');
		report.style.color="#FFC107";
		var report_text=document.createTextNode("assignment");
		report.appendChild(report_text);
		var desc_text=document.createTextNode(text);
		//create edit text
		var edit=document.createElement("i");
		edit.setAttribute('class','material-icons');
		edit.setAttribute('onclick','getEditMemo('+memoid+')');
		edit.setAttribute('title','edit');
		edit.style.color="#00E676";
		var edit_text=document.createTextNode("mode_edit");
		edit.appendChild(edit_text);
		//create footer
		var memo_footer=document.createElement("P");
		memo_footer.setAttribute('class','mymemo-footer');
		memo_footer.appendChild(memo_date_label);
		desc.appendChild(memo_img_wraper);
		desc.appendChild(desc_text);
		if(userid==retrievedObject.userid){
			desc.appendChild(close);
			desc.appendChild(edit);
			memo_img_wraper.style.background="#009688";
		}
		if(userid!=retrievedObject.userid){
			desc.appendChild(report);
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
	function listMemoDescriptionBox(data){
	   // var ihave=false;
		removeAllChild();
		for(var i=0;i<data.DATA.length;i++){
			if(data.DATA[i].userid==retrievedObject.userid){
				ihave=true;
			} 
			createDescribeBox(data.DATA[i].content,data.DATA[i].title,data.DATA[i].userimage,data.DATA[i].userid,data.DATA[i].id,data.DATA[i].date);
		}
		if(ihave==true){
			$("#frm-memo-wrapper").css('display','none');
			ihave=false;
		}
	}
	//List Memo
	function pluginGetMemo(){
		var json=new Object();
		json.url=url;
		json.userid=retrievedObject.userid;
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/HRD_MEMO/plugin/plugingetmemo",
			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				listMemoDescriptionBox(data);
			},
			error : function(data) {
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
			    }
	});
	//user report
	var us_rpid=0,mm_rpid=0;
	function reportMemo(rpid,mmid){
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
			url : "http://localhost:8080/HRD_MEMO/plugin/report",
			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				$("#my-rp-popup").text("YOU REPORT SUCCESSED");
				$("#my-rp-popup").css("width","100%");
				$("#my-rp-popup").fadeIn(200)
				 .delay(1500).fadeOut(500);
			},
			error : function(data) {
				$("#my-rp-popup").text("YOU REPORT FIALED");
				$("#my-rp-popup").fadeIn(200)
								 .delay(1500).fadeOut(500);
			}
		});
	}
	//save memo
	function saveMemo(){
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
				url : "http://localhost:8080/HRD_MEMO/plugin/savememo",
				contentType: 'application/json;charset=utf-8',
		        data:JSON.stringify(json),
				success : function(data) {
					createDescribeBox(json.content,json.title);
					$("#descmemo").val("");
					$("#descmemo").focus();
					$("#public").attr('checked','');
					pluginGetMemo();
					$("#frm-memo-wrapper").fadeOut(500);
				},
				error : function(data) {
					$("#my-rp-popup").text("YOU CAN ONLY ONE MEMO ONE ARTICLE");
					$("#my-rp-popup").css("width","100%");
					$("#my-rp-popup").fadeIn(200)
									 .delay(2000).fadeOut(500);
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
		if (validateEmail($("#loginemail").val()) == true
				&& $("#loginpassword").val() != "") {
			var json = {
				email : $("#loginemail").val(),
				password : $("#loginpassword").val()
			};
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/HRD_MEMO/plugin/pluginlogin",
		        data:json,
				success : function(data){
					Cookies.set('MEMO',JSON.stringify(data.DATA));
					retrievedObject=Cookies.getJSON('MEMO');
					$("#frm-loginreg-wrapper").css('display','none');
					$("#frm-memodesc-panel").fadeIn(500);
					pluginGetMemo();
				},
				error : function(data) {
					$("#my-rp-popup").text("YOU LOGIN FIALED");
					$("#my-rp-popup").css("width","100%");
					$("#my-rp-popup").css('background','red');
					$("#my-rp-popup").fadeIn(200)
									 .delay(1500).fadeOut(500);
				}
			});
			$("#loginemail").val("");
		$("#loginpassword").val("");
		} else {
			if (validateEmail($("#loginemail").val()) == false) {
				$("#my-rp-popup").text("INVALID EMAIL");
				$("#my-rp-popup").css('background','red');
				$("#my-rp-popup").fadeIn(200)
								 .delay(1500).fadeOut(500);
			}
		}
	}
	//sign up user
	function signUpUser() {
		if ($("#name").val() != "" && validateEmail($("#email").val()) == true
				&& $("#password").val() != "") {
			var json = {
				username : $("#name").val(),
				email : $("#email").val(),
				password : $("#password").val(),
				gender : $('input[name="gender"]:checked').val(),
				image : 'Male-icon.png'
			};
			$.ajax({
				type : "POST",
				url : "http://localhost:8080/HRD_MEMO/plugin/signup",
				contentType: 'application/json;charset=utf-8',
		        data:JSON.stringify(json),
				success : function(data) {
					Cookies.set('MEMO',JSON.stringify(data.DATA));
					retrievedObject=Cookies.getJSON('MEMO');
					$("#frm-loginreg-wrapper").css('display','none');
					$("#frm-memodesc-panel").fadeIn(500);
					pluginGetMemo();
					username : $("#name").val("");
					email : $("#email").val("");
					password : $("#password").val("");
				},
				error : function(data) {
					$("#my-rp-popup").text("YOU SUGNUP FIALED");
					$("#my-rp-popup").css("width","100%");
					$("#my-rp-popup").css('background','red');
					$("#my-rp-popup").fadeIn(200)
									 .delay(1500).fadeOut(500);
				}
			});
		} else {
			if ($("#name").val() == "" || $("#email").val() == ""
					|| $("#password").val() == "") {
				$("#error")
						.html(
								"<i style='margin-top: 10px; font-size: 17px; padding:0;' class='material-icons'>info</i>&nbsp;&nbsp;<span style='padding-bottom:10px;'>Invalid input eg.blank name,email,pssword field..!</span>");
				$("#error").slideDown().delay(3000).slideUp();
			} else if (validateEmail($("#email").val()) == false) {
				$("#error")
						.html(
								"<i style='margin-top: 10px; font-size: 17px; padding:0;' class='material-icons'>info</i>&nbsp;&nbsp;<span style='padding-bottom:10px;'>Invalid email..!</span>");
				$("#error").slideDown().delay(1500).slideUp();
			}
		}
	}

	//edit memo
	var isEdit=false;
	var editMemoId=0;
	function getEditMemo(id){
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/plugin/toedit/"+id,
			success : function(data) {
				$("#descmemo").val(data.DATA.content);
				if(data.DATA.ispublic==true){
					$("#public").prop('checked','checked');
				}
				$("#frm-memo-wrapper").slideDown(500);
				$(".my_delete_btn").fadeOut();
				$("#btn-save-memo").html("<i class='large material-icons'>mode_edit</i>");
				$("#btn-save-memo").attr("onclick","updateMemoContent("+id+")");
				isEdit=true;
				editMemoId=id;
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
			url : "http://localhost:8080/HRD_MEMO/plugin/editmemocontent",
			contentType: 'application/json;charset=utf-8',
	        data:JSON.stringify(json),
			success : function(data) {
				pluginGetMemo();
				$("#btn-save-memo").html("<i class='material-icons'>input</i>");
				$("#btn-save-memo").attr("onclick","saveMemo()");
				$("#descmemo").val("");
				$("#public").prop('checked','');
				$(".my_delete_btn").fadeIn();
				$("#my-rp-popup").text("YOU UPDATE SUCCESSED");
				$("#my-rp-popup").css("background","#009688");
				$("#my-rp-popup").css("width","100%");
				$("#my-rp-popup").fadeIn(200)
								 .delay(2000).fadeOut(500);
			},
			error : function(data) {
				$("#my-rp-popup").text("UPDATE FAILED");
				$("#my-rp-popup").css('background','red');
				$("#my-rp-popup").fadeIn(200)
								 .delay(1500).fadeOut(500);
			}
		});
	}
	//textarea enter event
	function handleKeyPress(e){
		 var key=e.keyCode || e.which;
		  if (key==13){
		   	    saveMemo();
		  }
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
	function pluginDeleteMemo(id){
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/plugin/"+id,
			success : function(data) {
				$("#frm-memo-wrapper").slideDown(500);
				pluginGetMemo();
			},
			error : function(data) {
			}
		});
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
	              height:'500px',
	              position: 'left',
	               color: 'red'
	});
	</script>
</body>
<link rel='stylesheet'
	href='http://localhost:8080/HRD_MEMO/resources/css/alertify.core.css' />
<link rel='stylesheet'
	href='http://localhost:8080/HRD_MEMO/resources/css/alertify.default.css' />
</html>