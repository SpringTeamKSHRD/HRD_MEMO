$(function() {
	$("#frmLogin").submit(function(e) {
		var username=$("#username").val();
		var password=$("#password").val();
		e.preventDefault();
		$('#memo-loading').show();
		$.ajax({
			url : path+"login",
			type : "POST",
			data : $("#frmLogin").serialize(),
			success : function(data) {
				
				if (data == "User account is locked" 
					|| data == "User is disabled" 
					|| data == "Bad credentials"){
					$('#memo-loading').hide();
						alert(data);
				}else{	
						$('#memo-loading').hide();
					    getUserDetail(username,data);
				};
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});
function isValidEmailAddress(emailAddress) {
    var pattern = /^([a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+(\.[a-z\d!#$%&'*+\-\/=?^_`{|}~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]+)*|"((([ \t]*\r\n)?[ \t]+)?([\x01-\x08\x0b\x0c\x0e-\x1f\x7f\x21\x23-\x5b\x5d-\x7e\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|\\[\x01-\x09\x0b\x0c\x0d-\x7f\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))*(([ \t]*\r\n)?[ \t]+)?")@(([a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\d\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.)+([a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]|[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF][a-z\d\-._~\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]*[a-z\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])\.?$/i;
    return pattern.test(emailAddress);
};
$("#frmRegister")
.submit(
    function(e) {
        e.preventDefault();
        $('#memo-loading').show();
        if(!isValidEmailAddress($('#r_email').val())){
        	alert('Invalid email address !');
        }else{
        $
            .ajax({
                url: path+"plugin1/memo/validate",
                type: "POST",
                data: {
                    email: $('#r_email').val()
                },
                success: function(data) {
                    if (data.RESPONSE_DATA == true) {
                    	$('#memo-loading').hide();
                        alert('Email already exist !');
                    } else {
                    	console.log(data)
                        $
                            .ajax({
                                url: path+"plugin1/memo/register",
                                type: "POST",
                                data: $("#frmRegister").serialize(),
                                success: function(data) {
                                    if (data.MESSAGE == "SUCCESS") {
                                    	$('#memo-loading').hide();
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
                                					|| data == "Bad credentials"){
                                						//alert(data);
                                				}else{	
                                						//khmerAcademeyLogin(username, password);
                                						location.href = path + data.split("#")[0];
                                				}
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
        }
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

function getUserDetail(email, data1) {
	$.ajax({
		url : path + "getuserdetail",
		type : "GET",
		data : {
			email : email
		},
		success : function(data) {
			Cookies.set('MEMO', JSON.stringify(data.DATA));
			Cookies.set('LOGGED', {
				"userid" : data.USERID,
				"email" : data.EMAIL,
				"lang" : "km",
				"imageUrl" : data.IMAGE_URL
			}, {
				expires : 1,
				path : ''
			});
			location.href = path + data1.split("#")[0];
		},
		error : function(data) {
			alert("Set Cookie Error..!");
		}
	});
}














