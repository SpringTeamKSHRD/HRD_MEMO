var domain=window.location.origin+"/HRD_MEMO";
var img="";

function updateUser(){
	if(img==""){
		img=$("#origin_img").val();
		//alert(img);
		updateUserInfo();
		swal("Success!", "Your profile has been updated.", "success");
	}else{
		uploadImage();
		swal("Success!", "Your profile has been updated", "success");
	}
	img="";
}

function uploadImage() {
	var data1;
    data1 = new FormData($(this)[0]);
    data1.append('file', $('#image')[0].files[0]);
	$.ajax({
		url : domain+"/user/uploadimage",
		type : "POST",
		cache: false,
		contentType: false,
		processData: false,
		data : data1,
		success:function(data){	
			img=data.IMG_NAME;
			updateUserInfo();
		}
	});
} 

//to update user information not include with upload photo
function updateUserInfo(){
	alert($("#dob").val());
	json = {userid : parseInt($("#userid").val()),
			username : $("#username").val(),
			gender : $("input[type='radio'][name='gender']:checked").val(),
			dob : $("#dob").val(),
			phone : $("#phone").val(),
			email : $("#email").val(),
			image : img
		   };

	$.ajax({
		type : "POST",
		url : domain + "/user/updateuser",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}

$("#image").change(function() {
	img=$("#image").val().split("\\").pop();
});

/*function updateUserPwd(){
	//alert($("#password").val()+"\n"+$("#old_pwd").val()+$("#new_pwd").val()+$("#con_pwd").val());
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
			//alert("Success :" + data.MESSAGE);
		},
		error : function(data) {
			//alert("Unsuccess: " + data.MESSAGE);
			sweetAlert("Fail", "Your password has been not updated!", "error");
			console.log("ERROR..." + data);
		}
	});
}*/
// cancel for user profile form
function cancelUser(){
	//alert("cancel");
	sweetAlert("Opp...", "Cancel updated!", "error");
}
//clear modal change password 
function clearModalPwd(){
	$("#old_pwd").val("");
	$("#new_pwd").val("");
	$("#con_pwd").val("");
}