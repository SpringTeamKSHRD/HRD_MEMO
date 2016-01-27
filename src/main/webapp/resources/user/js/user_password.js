var domain=window.location.origin+"/HRD_MEMO";

function checkOldPwd(){
	var op=$("#old_pwd").val();
	if(op==""){
		$("#v_op").text("*required, old password cannot be empty!");
	}else{
		$("#v_op").text("");
	}
}
function checkNewPwd(){
	var np=$("#new_pwd").val();
	if(np==""){
		$("#v_np").text("*required, new password cannot be empty!");
	}else{
		$("#v_np").text("");
	}
}
function checkConPwd(){
	var cp=$("#con_pwd").val();
	if(cp==""){
		$("#v_cp").text("*required, confirm password cannot be empty!");
	}else{
		if($("#new_pwd").val()!=$("#con_pwd").val()){
			$("#v_cp").text("new password are not match with confirm passowrd!");
		}
	}
}

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
			clearText();
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
	
	//clear error span
	$("#v_op").text("");
	$("#v_np").text("");
	$("#v_cp").text("");
}