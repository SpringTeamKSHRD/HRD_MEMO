//on submit form, post to server to login
$(document).ready(function(){
	$("#frmLogin").submit(function(e) {
		e.preventDefault();
		$.ajax({
			url : path+"/login",
			type : "POST",
			data : $("#frmLogin").serialize(),
			success : function(data) {
				if (data == "User account is locked" || data == "User is disabled" || data == "Bad credentials")	alert(data);
				//if login success redirect to /plugin with url parameter
				else	location.href = path + "plugin"+location.search;
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});