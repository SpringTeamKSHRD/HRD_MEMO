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
					    getUserDetail(username,data);
				};
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});
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

//Test Login With Khmer Academy
function isKhmerAcademyLogin(){
		 $.ajax({
				url: "http://192.168.178.121:8080/KAWEBCLIENT/api/isLogin",
				type: "GET",
				success: function(data) {
						 alert(data.STATUS);
				},
				error: function(data){
					 	alert("Login Khmer academy error");	
				}
				});
	
}
//isKhmerAcademyLogin();
function logingMainMemo(email,pwd){
	var json={
			username:email,
			password:pwd
	};
	$.ajax({
		url : path+"/login",
		type : "POST",
		dataType:'json',
		data :json,
		success : function(data) {
			 getUserDetail(email);
		},
		error : function(data) {
			console.log(data);
		}
	});
}

function getUserDetail(email,data1){
	 $.ajax({
			url: path+"getuserdetail",
			type: "GET",
			data:{email:email},
			success: function(data) {
				Cookies.set('MEMO',JSON.stringify(data.DATA));
				location.href = path + data1;
			},
			error: function(data){
				 	alert("Set Cookie Error..!");	
			}
			});
}














