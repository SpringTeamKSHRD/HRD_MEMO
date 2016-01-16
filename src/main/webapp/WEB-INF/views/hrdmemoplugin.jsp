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
				<li><a class="btn-floating yellow darken-1 menu-btn"><i
						class="material-icons">lock_open</i></a></li>
				<li><a class="btn-floating green menu-btn"><i
						class="material-icons">open_in_browser</i></a></li>
			</ul>
		</div>
	</div>
	<div class="row" style="margin-top: 10px;">
		<form class="col s12" id="hrd-memo-frm">
			<div class="row">
				<div class="col s12" id="img_desc_wrapper">
					<table>
						<tr style="padding: 0px;">
							<td style="width: 50px; padding: 0px;"><img alt="" src="resources/Male-icon.png"
								style="width: 45px; height: 59px; border-radius:90%; border: 1px solid gray;"></td>
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
	<div class='row'
		style="margin-top: 10px; padding: 0px; width: 100%; height: auto;"
		id="memo-panel">
		<div class="col s11" style="margin: auto;" id="memo-panel"></div>
	</div>
</body>
<style>
* {
	margin: 0px;
	padding: 0px;
	overflow: none;
}

.col, .s1, .s10 {
	margin: 0px;
	padding: 0px;
}

.row, .input-field {
	margin: 0px;
	padding: 0px;
}

.fixed-action-btn {
	top: 5px;
	right: 20px;
	height: 70px;
}

#btn-active_wrapper {
	height: 30px;
	padding-top: 20px;
	text-align: right;
}

#hrd-memo-frm {
	display: none;
}
</style>
<script type="text/javascript">
	var display = true;
	iframeparent = parent.document.getElementById('hrdmemo_iframe');
	$("#btn-active-memo")
			.click(
					function() {
						$("#hrd-memo-frm")
								.slideToggle(
										300,
										function() {
											if (display == true) {
												iframeparent.style.height = parent.document
														.getElementById("hrdmemo_iframe").contentWindow.document.body.scrollHeight
														- 4 + "px";
												display = false;
											} else {
												iframeparent.style.height = 70 + "px";
												display = true;
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
</script>
</html>















