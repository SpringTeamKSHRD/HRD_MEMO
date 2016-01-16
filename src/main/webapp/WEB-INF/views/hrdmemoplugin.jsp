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
	<div class='row' style="height: 45px;">
		<div class="fixed-action-btn horizontal">
			<a class="btn-floating"> <i class="large material-icons">mode_edit</i>
			</a>
			<ul>
				<li><a class="btn-floating red menu-btn" id="btn-active-memo"><i
						class="material-icons">comment</i></a></li>
				<li><a class="btn-floating yellow darken-1 menu-btn" id="btn-active-login"><i
						class="material-icons">lock_open</i></a></li>
				<li><a class="btn-floating green menu-btn" id="btn-active-register"><i
						class="material-icons">open_in_browser</i></a></li>
			</ul>
		</div>
	</div>
	<!--Memo Form-->
	<div class="row" style="margin-top: 10px;">
		<form class="col s12" id="hrd-memo-frm">
			<div class="row">
				<div class="col s12" id="img_desc_wrapper">
					<table>
						<tr style="padding: 0px;">
							<td style="width: 50px; padding: 0px;"><img alt=""
								src="resources/Male-icon.png"
								style="width: 45px; height: 59px; border-radius: 90%; border: 1px solid gray;"></td>
							<td style="padding: 0px;"><textarea
									style="height: 60px; border: 2px solid #009688;" id="desc_memo"></textarea></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="row" style="margin-top: 2px;">
				<table>
					<tr style="padding: 0px;">
						<td style="width: 50px; padding: 0px;"></td>
						<td style="padding: 0px;">
							<div class="input-field col s1" style="padding-left: 0px;">
								<input type="checkbox" class="filled-in" id="filled-in-box" />
								<label for="filled-in-box">Public</label>
							</div>
							<div class="input-field col s11" style="text-align: right;">
								<button class="btn waves-effect" type="button"
									style="padding: 0px 5px; height: 30px;" id='btn-save-memo'>Save</button>
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
						id="icon_prefix" type="email" class="validate"> <label
						for="icon_prefix">Email</label>
				</div>
			</div>
			<div class="row">
				<div class="input-field col s12">
					<i class="material-icons prefix">vpn_key</i> <input
						id="icon_prefix" type="password" class="validate"> <label
						for="icon_prefix">Password</label>
				</div>
			</div>
			<div class='row'>
				<div class='col s12'>
					<button class="btn waves-effect waves-light" type="submit"
						name="action" style="padding-top: 0px; float: right;">
						<i class="material-icons">done_all</i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<!--Login Form  -->
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
					<input id="password" type="password" class="validate"> <label
						for="password">Password</label>
				</div>
			</div>
			<div class='row'>
				<div class='col s6'>
						<input class="with-gap" name="gender" type="radio" value="male" id="male" checked/>
						<label for="male">Male</label>
						<input class="with-gap" name="gender" type="radio" value="female" id='female'/>
						<label for="female">Female</label>
				</div>
				<div class='col s6'>
					<button class="btn waves-effect waves-light" onclick="signUpUser()" type="button"
						name="action" style="padding-top: 0px; float: right;">
						<i class="material-icons">send</i>
					</button>
				</div>
			</div>
		</form>
	</div>
	<!--Register Form  -->
	<div class='row'
		style="margin-top: 10px; padding: 0px; width: 100%; height: auto;"
		id="memo-panel">
		<div class="col s11" style="margin: auto;" id="memo-panel"></div>
	</div>
</body>
<link rel="stylesheet" href="http://localhost:8080/HRD_MEMO/resources/css/hrdmemoplugin.css"/>
<script type="text/javascript">
	var display = true;
	iframeparent = parent.document.getElementById('hrdmemo_iframe');
	$("#btn-active-memo")
			.click(
					function() {
						$("#hrd-login-frm").css('display','none');
						$("#hrd-register-frm").css('display','none');
						$("#hrd-memo-frm")
								.slideToggle(
										10,
										function() {
											if (display == true) {
												iframeparent.style.height =150+ "px";
												display = false;
											} else {
												iframeparent.style.height = 70 + "px";
												display = true;
											}
										});
					});
	var display1 = true;
	$("#btn-active-login")
	.click(
			function() {
				$("#hrd-memo-frm").css('display','none');
				$("#hrd-register-frm").css('display','none');
				$("#hrd-login-frm")
						.slideToggle(
								10,
								function() {
									if (display1 == true) {
										iframeparent.style.height = 200+ "px";
										display1 = false;
									} else {
										iframeparent.style.height = 70 + "px";
										display1 = true;
									}
								});
			});
	var display2 = true;
	$("#btn-active-register")
	.click(
			function() {
				$("#hrd-login-frm").css('display','none');
				$("#hrd-memo-frm").css('display','none');
				$("#hrd-register-frm")
						.slideToggle(
								10,
								function() {
									if (display2 == true) {
										iframeparent.style.height =250+ "px";
										display2 = false;
									} else {
										iframeparent.style.height = 70 + "px";
										display2= true;
									}
								});
			});
	
	
	
	$("#btn-save-memo")
			.click(
					function() {
						$("#memo-panel")
								.append(
										"<span class='chip' style='display:block; margin:5px; height:auto;'>"
												+ $("#desc_memo").val()
												+ "<i class='material-icons' onclick='deleteMsg()'>close</i></span>");
						$("#desc_memo").val("");
						var moreh = iframeparent.offsetHeight + 10;
						iframeparent.style.height = moreh + "px";

					});
	function deleteMsg() {
		var moreh = iframeparent.offsetHeight - 90;
		iframeparent.style.height = moreh + "px";
	}
	function signUpUser(){
		json={
				username:$("#name").val(),
				email:$("#email").val(),
				password:$("#password").val(),
				gender:$('input[name="gender"]:checked').val(),
				image:'Male-icon.png'
		};
		$.ajax({
			type : "POST",
			url : "http://localhost:8080/HRD_MEMO/plugin/signup",
			contentType: 'application/json;charset=utf-8',
            data: JSON.stringify(json),
			success : function(data) {
				alert(data.MESSAGE);
			},
			error : function(data) {
			}
		});
	}
</script>
</html>















