
var img="";

function updateUser(){
	if(img==""){
		img=$("#origin_img").val();
		updateUserInfo();
	}else{
		uploadImage();
	}
	img="";
}

/* For updating profile picture*/
function uploadImage() {
	var data1;
    data1 = new FormData($(this)[0]);
    data1.append('file', $('#image')[0].files[0]);
	$.ajax({
		url : path+"/user/uploadimage",
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
		url : path + "/user/updateuser",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("User profile has been updated..!");
		},
		error : function(data) {
			alert("Update Eorror");
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
function getNumberMesage(){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : path+"/user/numbermessage/"+uid,
		success : function(data) {
				$("#newmsg").css('display',"inline");
				$("#numnotify").css('display',"inline");
				$("#numnotify").text(data.DATA);
				$("#newnumnotify").css('display',"inline");
				$("#newnumnotify").text("     You have "+data.DATA+" messages");
		},
		error : function(data) {
			$("#numnotify").css('display',"none");
			$("#newnumnotify").css('display',"none");
			$("#newmsg").css('display',"none");
		}
	});
}
getNumberMesage();
var url="ws://"+location.host+"/memo/usernotification";
var websocket=new WebSocket(url);
websocket.onopen=function(message){
}
websocket.onclose=function(message){
	 websocket.close();
}
websocket.onmessage=function(message){
	 if(message.data==="response"){
		 getNumberMesage();
		 audio.play();
	 }
}
var audio = new Audio(path+'/resources/audio/notifysouand.mp3');