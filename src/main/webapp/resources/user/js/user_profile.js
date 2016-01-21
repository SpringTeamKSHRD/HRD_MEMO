var domain=window.location.origin+"/HRD_MEMO";
loadPage();

function loadPage(){
	
}

function updateUser(){
	json = {userid : parseInt($("#userid").val()),
			username : $("#username").val(),
			gender : $("input[type='radio'][name='gender']:checked").val(),
			phone : $("#phone").val(),
			email : $("#email").val()	
		   };

	$.ajax({
		type : "POST",
		url : domain + "/user/updateuser",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("Success :" + data.MESSAGE);
			//loadPage();
			uploadImage();
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

function uploadImage() {
	alert("upload image.");
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
			alert("success uploading.");
		}
	});
} 

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