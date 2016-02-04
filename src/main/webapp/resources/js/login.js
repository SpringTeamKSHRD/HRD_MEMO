$(function() {
	$("#frmLogin").submit(function(e) {
		var username=$("#username").val();
		var password=$("#password").val();
		e.preventDefault();
		$.ajax({
			url : path+"/login",
			type : "POST",
			data : $("#frmLogin").serialize(),
			success : function(data) {
				if (data == "User account is locked" 
					|| data == "User is disabled" 
					|| data == "Bad credentials")
						alert(data);
				else{	
						khmerAcademeyLogin(username, password);
						location.href = path + data
				};
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});
function khmerAcademeyLogin(username,password){
	alert(username+" "+password);
	$.ajax({
		url: "http://192.168.178.121:8080/KAWEBCLIENT/login",
		type: "POST",
		data : {
		'ka_username':username,
		'ka_password':password},
		success: function(data) {
				 alert("Loig Khmer academy success");	
				 console.log(data);
		},
		error: function(data){
			alert("Loig Khmer academy error");	
		console.log(data);
		}
		});
}