<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
	<link rel='stylesheet' type='text/css'
	href='http://localhost:8080/HRD_MEMO/resources/materialize/css/materialize.min.css' />
	<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
	<script
	src='http://localhost:8080/HRD_MEMO/resources/admin/js/jquery-2.1.4.min.js'></script>
	<script
	src='http://localhost:8080/HRD_MEMO/resources/materialize/js/materialize.min.js'></script>
</head>
<body>
	<div class='row col s12' style="height: 60px; text-align: center;">
	<p id="error" style="margin: auto; color:white; background: #FF1744; height: 100%; display:none;"></p>
		<div class="fixed-action-btn horizontal">
			<a class="btn-floating btn-large"> <i class="large material-icons">mode_edit</i>
			</a>
			<ul>
				<li id="btn-memo-nemu1"><a class="btn-floating green menu-btn" id="btn-active-panel"><i
					class="material-icons" style="font-size: 20px;">swap_vert</i></a></li>
				<li id="btn-memo-nemu1"><a class="btn-floating red menu-btn" id="btn-active-memo"><i
					class="material-icons" style="font-size: 20px;">comment</i></a></li>
				<li id="btn-memo-nemu2"><a class="btn-floating yellow darken-1 menu-btn" id="btn-active-login"><i
						class="material-icons" style="font-size: 20px;">lock_open</i></a></li>
				<li id="btn-memo-nemu3"><a class="btn-floating green menu-btn" id="btn-active-register"><i
						class="material-icons" style="font-size: 20px;">open_in_browser</i></a></li>
			</ul>
		</div>
	</div>
	<!--Memo Form-->
	<div class="row" style="margin-top: 5px;">
		<form class="col s12" id="hrd-memo-frm" style="padding:0px; margin: 0px;">
			<div class="row" style="padding:0px; margin: 0px;">
				<div class="col s12" id="img_desc_wrapper" style="padding:0px; margin: 0px;">
					<table style="padding:0px; margin: 0px;">
						<tr style="padding: 0px;">
							<td style="width: 60px; padding: 0px; margin: 0px; text-align: right;"><img alt=""
								src="resources/Male-icon.png"
								style="width: 45px; height: 59px; border: 1px solid gray; padding: 2px;">
							</td>
							<td style="padding: 0px; margin: 0px;">
								<textarea style="max-height: 60px; height:60px; border: 2px solid #009688;" id="descmemo">
								</textarea>	
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row" style="margin-top: 2px;">
				<table style="padding:0px;">
					<tr style="padding: 0px;">
						<td style="width: 50px; padding: 0px;"></td>
						<td style="padding: 0px;">
							<div class="input-field col s1" style="padding-left: 0px;">
								<input type="checkbox" class="filled-in" id="public" />
								<label for="public">Public</label>
							</div>
							<div class="input-field col s11" style="text-align: right; padding: 0px;">
								<button class="btn waves-effect" type="button" 
										style="padding: 0px 5px; height: 30px;" 
										id='btn-save-memo'>Save</button>
							</div>
						</td>
					</tr>
				</table>
			</div>
		</form>
	</div>
	<!--End memo form  -->
	<!--Login Form  -->
	<div class="row">
		<form class="col s12" id="hrd-login-frm">
			<div class='row'>
				<div class="card-panel teal"
					style="padding: 10px; font-size: 17px; color: white; font-weight: bold;">
					<i class="material-icons">lock</i>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">perm_identity</i> <input
						id="loginemail" type="email" class="validate"> <label
						for="loginemail">Email</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">vpn_key</i> <input
						id="loginpassword" type="password" class="validate" maxlength="10"> <label
						for="loginpassword">Password</label>
				</div>
			</div>
			<div class='row'>
				<div class='col s12'>
					<button class="btn waves-effect waves-light" type="button" onclick="loginMemo()"
						name="action" style="padding-top: 0px; float: right;">
						<i class="material-icons">done_all</i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<!--end login form  -->
				<!--Register Form  -->
				<div class="row">
					<form class="col s12" id="hrd-register-frm">
						<div class='row'>
							<div class="card-panel teal"
							style="padding: 10px; color: white; font-weight: bold;">
							<i class="material-icons">person_pin</i>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="name" type="text" class="validate"> <label
							for="name">Name</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="email" type="email" class="validate"> <label
							for="email">Email</label>
						</div>
					</div>
					<div class="row">
						<div class="input-field col s12">
							<input id="password" type="password" class="validate" maxlength="10"> <label
							for="password">Password</label>
						</div>
					</div>
					<div class='row'>
						<div class='col s7'>
							<input class="with-gap" name="gender" type="radio" value="male" id="male" checked/>
							<label for="male">Male</label>
							<input class="with-gap" name="gender" type="radio" value="female" id='female'/>
							<label for="female">Female</label>
						</div>
						<div class='col s5'>
							<button class="btn waves-effect waves-light" onclick="signUpUser()" type="button"
							name="action" style="padding-top: 0px; float: right;">
							<i class="material-icons">send</i>
						</button>
					</div>
				</div>
			</form>
		</div>
		<!--Register Form  -->
</body>
<link rel="stylesheet" href="http://localhost:8080/HRD_MEMO/resources/css/hrdmemoplugin.css"/>
<script type="text/javascript">
var url="";
var obj=null;
function handlingMsg(e){
	var parentData=e.data.split("#");
	url=parentData[0];
	obj=JSON.parse(parentData[1]);
	if(obj==null){
		$("#btn-memo-nemu1").css('display','none');
	}else{
		$("#btn-memo-nemu3").css('display','none');
		$("#btn-memo-nemu2").css('display','none');
	}
}
addEventListener("message",handlingMsg,true);
	var display=true;
	$("#btn-active-memo").click(function() {
		display1=true;
		display2=true;
						if(display==true){
							iframeSizePanel('160px');
							display=false;
						}else{
							display=true;
							iframeSizePanel('60px');	
						}
						$("#hrd-login-frm").css('display','none');
						$("#hrd-register-frm").css('display','none');
						$("#hrd-memo-frm").slideToggle(10);
					});
	var display1=true;
	$("#btn-active-login").click(function() {
		display=true;
		display2=true;
				if(display1==true){
					iframeSizePanel('290px');
					display1=false;
				}else{
					display1=true;
					iframeSizePanel('60px');
				}
				$("#hrd-memo-frm").css('display','none');
				$("#hrd-register-frm").css('display','none');
				$("#hrd-login-frm").slideToggle(10);
	});
	var display2=true;
	$("#btn-active-register").click(function() {
		display1=true;
		display=true;
				if(display2==true){
					iframeSizePanel('350px');
					display2=false;
				}else{
					display2=true;
					iframeSizePanel('60px');
				}
				$("#hrd-login-frm").css('display','none');
				$("#hrd-memo-frm").css('display','none');
				$("#hrd-register-frm").slideToggle(10);
			});
	//Toggle descpanel
	$("#btn-active-panel").click(function(){
		parent.postMessage('animate#ok',url);
	});
	function iframeSizePanel(height){
		parent.postMessage('size#'+height,url);
	}
	//sign up user
	function signUpUser(){
		if($("#name").val()!=""&&validateEmail($("#email").val())==true&&$("#password").val()!=""){
		var json={
				username:$("#name").val(),
				email:$("#email").val(),
				password:$("#password").val(),
				gender:$('input[name="gender"]:checked').val(),
				image:'Male-icon.png'
		};
				parent.postMessage("signup#"+JSON.stringify(json, null, '\t'),url);
				$("#btn-memo-nemu1").css('display','block');
				$("#btn-memo-nemu3").css('display','none');
				$("#btn-memo-nemu2").css('display','none');
				$("#hrd-register-frm").slideToggle(500);
				$("#hrd-memo-frm").slideToggle(500);
		}else{
			if($("#name").val()==""||$("#email").val()==""||$("#password").val()==""){
				$("#error").html("<i style='margin-top: 10px; font-size: 17px; padding:0;' class='material-icons'>info</i>&nbsp;&nbsp;<span style='padding-bottom:10px;'>Invalid input eg.blank name,email,pssword field..!</span>");
				$("#error").slideDown().delay(3000).slideUp();
			}else if(validateEmail($("#email").val())==false){
				$("#error").html("<i style='margin-top: 10px; font-size: 17px; padding:0;' class='material-icons'>info</i>&nbsp;&nbsp;<span style='padding-bottom:10px;'>Invalid email..!</span>");
				$("#error").slideDown().delay(1500).slideUp();
			}
		}
	}
	
	//login memo
	function loginMemo(){
	if(validateEmail($("#loginemail").val())==true&&$("#loginpassword").val()!=""){
	 var json={
				email:$("#loginemail").val(),
				password:$("#loginpassword").val()
		};
				parent.postMessage("login#"+JSON.stringify(json, null, '\t'),url); 
		}else{
			if(validateEmail($("#loginemail").val())==false){
				$("#error").html("<i style='margin-top: 10px; font-size: 17px; padding:0;' class='material-icons'>info</i>&nbsp;&nbsp;<span style='padding-bottom:10px;'>Invalid email..!</span>");
				$("#error").slideDown().delay(1500).slideUp();
			}
		}
	}

	//save memo
	$("#btn-save-memo").click(function() {
		if($("#descmemo").val()!=""){
		$("#descmemo").css('border','2px solid #009688');
		var ismpublic="";
		var pbl=document.getElementById("public");
			if(pbl.checked){
				ismpublic=true;
			}else{
				ismpublic=false;
			}
		 var json={
				userid:obj.userid,
				content:$("#descmemo").val(),
				ispublic:ismpublic
				};
		 $("#descmemo").val("");
		 $("#descmemo").focus();
				parent.postMessage("savememo#"+JSON.stringify(json, null, '\t'),url);
		}else{
			$("#descmemo").css('border','2px solid #D50000');
			 $("#descmemo").focus();
		}
	});
	$("#descmemo").val("");
	
	function validateEmail(email) {
	    var re = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	    return re.test(email);
	}
</script>
</html>