var domain=window.location.origin+"/HRD_MEMO";
var img="";

function updateUser(){
	if(img==""){
		alert("did not change profile.");
		img=$("#origin_img").val();
		alert(img);
		updateUserInfo(); // to update user information not include with upload photo
	}else{
		alert("changed profile.");
		uploadImage();
		updateUserInfo();
	}
	img="";
}

function uploadImage() {
	//alert("upload image.");
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
			alert("success uploading."+img);
			
		}
	});
} 

//to update user information not include with upload photo
function updateUserInfo(){
	alert("update user info: "+img);
	json = {userid : parseInt($("#userid").val()),
			username : $("#username").val(),
			gender : $("input[type='radio'][name='gender']:checked").val(),
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
			alert("Success :" + data.MESSAGE);
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

function updateUserPwd(){
	alert($("#password").val()+"\n"+$("#old_pwd").val()+$("#new_pwd").val()+$("#con_pwd").val());
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
			alert("Success :" + data.MESSAGE);
			//loadPage();
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}
function cancelUser(){
	alert("cancel");
}