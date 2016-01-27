var domain=window.location.origin+"/HRD_MEMO";

function updateUserPwd(){
	json = {userid : parseInt($("#userid").val()),
			password : $("#password").val(),
			oldpwd : $("#old_pwd").val(),
			newpwd : $("#new_pwd").val(),
			conpwd : $("#con_pwd").val()
		   };
	
	$.ajax({
		type : "POST",
		url : domain + "/user/updatepassword",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			swal("Success!", "Your password has been updated.", "success");
			clearModalPwd();
		},
		error : function(data) {
			sweetAlert("Fail", "Fail with password updated!", "error");
			console.log("ERROR..." + data);
		}
	});
}

function clearText(){
	$("#old_pwd").val("");
	$("#new_pwd").val("");
	$("#con_pwd").val("");
}