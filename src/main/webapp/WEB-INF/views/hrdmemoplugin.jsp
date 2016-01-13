<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel='stylesheet' type='text/css'
	href='${pageContext.request.contextPath}/resources/materialize/css/materialize.min.css' />
<link href='https://fonts.googleapis.com/icon?family=Material+Icons'
	rel='stylesheet'>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
<script
	src='${pageContext.request.contextPath}/resources/materialize/js/materialize.min.js'></script>
</head>
<body>
		<div class="fixed-action-btn horizontal">
	    <a class="btn-floating">
	      <i class="large material-icons">mode_edit</i>
	    </a>
	    <ul>
	      <li><a class="btn-floating red menu-btn" id="btn-active-memo"><i class="material-icons">insert_chart</i></a></li>
	      <li><a class="btn-floating yellow darken-1 menu-btn"><i class="material-icons">format_quote</i></a></li>
	      <li><a class="btn-floating green menu-btn"><i class="material-icons">publish</i></a></li>
	    </ul>
	  </div>
	<div class="row" style="margin-top: 10px;">
		<form class="col s12" id="hrd-memo-frm">
			<div class="row">
				<div class="col m1 s2">
					<img alt="" src="">
				</div>
				<div class="input-field col m10 s9">
					<input type="text" id="icon_prefix" class="validate"> <label
						for="icon_prefix">Title</label>
				</div>
				</div>
				<div class="row">
					<div class="input-field col s12">
						<textarea rows="4"></textarea>
					</div>
				</div>
				<div class="row" style="margin-top: 3px;">
					<div class="input-field col m1 s2" style="padding-left: 0px;">
						<input type="checkbox" class="filled-in" id="filled-in-box" /> <label
							for="filled-in-box">Public</label>
					</div>
					<div class="input-field col m11 s10" style="text-align: right;">
						<button class="btn waves-effect" type="button" style="padding: 0px 5px; 
						height: 30px;">Save</button>
					</div>
				</div>
		</form>
	</div>
</body>
<style>
* {
	margin: 0px;
	padding: 0px;
	overflow: none;
}

img {
	width: 40px;
	height: 50px;
}

.row, .input-field {
	margin: 0px;
	padding: 0px;
}

.fixed-action-btn{
top: 10px;
right: 10px;
height: 35px;

}
.menu-btn{
margin: 0px;
width: 30px;
height: 30px;
}
#btn-active_wrapper{
margin-top: 3px;
height: 30px;
padding-top:20px;
text-align: right;
}
#hrd-memo-frm{
display: none;
}
</style>
<script type="text/javascript">
$("#btn-active-memo").click(function(){
	$("#hrd-memo-frm").slideToggle();
});
</script>
</html>