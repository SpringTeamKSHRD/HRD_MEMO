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
						//khmerAcademeyLogin(username, password);
						location.href = path + data
				};
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});
/*function khmerAcademeyLogin(username,password){
	$.ajax({
		url: "http://localhost:8080/KAWEBCLIENT/login",
		type: "POST",
		data : {
		'ka_username':username,
		'ka_password':password},
		success: function(data) {
				 alert("Loig Khmer academy success");	
		},
		error: function(data){
			 alert("Login Khmer academy error");	
		}
		});
}*/