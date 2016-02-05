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
function khmerAcademeyLogin(username,password){
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
}
$("#frmRegister")
.submit(
    function(e) {
        e.preventDefault();
        $
            .ajax({
                url: "http://localhost:8080/HRD_MEMO/plugin/memo/validate",
                type: "POST",
                data: {
                    email: $('#r_email').val()
                },
                success: function(data) {
                    if (data.RESPONSE_DATA == true) {
                        alert('Email already exist !');
                    } else {
                    	console.log(data)
                        $
                            .ajax({
                                url: "http://localhost:8080/HRD_MEMO/plugin/memo/register",
                                type: "POST",
                                data: $("#frmRegister").serialize(),
                                success: function(data) {
                                    if (data.MESSAGE == "SUCCESS") {
                                    	var data={
                                    	"username":$("#r_email").val(),
                                		"password":$("#r_password").val()
                                    	}
                                		$.ajax({
                                			url : path+"/login",
                                			type : "POST",
                                			data : data,
                                			datatype:"JSON",
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
                                    } else {
                                        alert('Oop ! something went wrong, please try again later !');
                                    }
                                },
                                error: function(data) {
                                    alert(data.RESPONSE_DATA);
                                }
                            });
                    }
                },
                error: function(data) {
                    alert(data.RESPONSE_DATA);
                }
            });
    });