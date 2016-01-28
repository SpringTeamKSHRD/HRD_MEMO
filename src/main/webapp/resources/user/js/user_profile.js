var domain=window.location.origin+"/HRD_MEMO";
var img="";

function updateUser(){
	if(img==""){
		img=$("#origin_img").val();
		updateUserInfo();
		swal("Success!", "Your profile has been updated.", "success");
	}else{
		uploadImage();
		swal("Success!", "Your profile has been updated", "success");
	}
	img="";
}

/* For updating profile picture*/
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

// cancel for user profile form
function cancelUser(){
	sweetAlert("Opp...", "Cancel updated!", "error");
}

//clear modal change password 
function clearModalPwd(){
	$("#old_pwd").val("");
	$("#new_pwd").val("");
	$("#con_pwd").val("");
}