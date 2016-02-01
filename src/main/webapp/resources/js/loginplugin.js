$(function() {
	$("#frmLogin").submit(function(e) {
		e.preventDefault();
		$.ajax({
			url : path+"/login",
			type : "POST",
			data : $("#frmLogin").serialize(),
			success : function(data) {
				alert("success");
				$("#frm-loginreg-wrapper").css('display','none');
				$("#frm-memodesc-panel").fadeIn(500);
				pluginGetMemoOwner();
				$("#descmemo").val("");
				$("#descmemo").focus();
				$("#useropt").prop('checked','');
				$("#public").prop('checked','');
			},
			error : function(data) {
				console.log(data);
			}
		});
	});
});