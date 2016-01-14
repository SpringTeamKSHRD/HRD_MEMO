$(function() {
	$("#frmLogin").submit(function(e) {
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
				else	location.href = path + data;
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});