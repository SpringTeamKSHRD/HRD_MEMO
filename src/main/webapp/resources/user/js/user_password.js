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
			$("#con_pwd").focus();
		}
	}
}

function updateUserPwd(){
	if($("#con_pwd").val()===$("#new_pwd").val()&&$("#con_pwd").val()!==""&&$("#new_pwd").val()!==""&&
			$("#old_pwd").val()!==""){
	json = {userid : parseInt($("#userid").val()),
			password : $("#password").val(),
			oldpwd : $("#old_pwd").val(),
			newpwd : $("#new_pwd").val(),
			conpwd : $("#con_pwd").val()
		    };	
	
	$.ajax({
		type : "POST",
		url : path+ "/user/updatepassword",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("Update your account success");
			clearText();
		},
		error : function(data) {
			alert("Old password mismatch..!");
			console.log("ERROR..." + data);
		}
		});
	}else{
		alert("Comfirm password mismatch with new password");
	}
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