var domain=window.location.origin+"/HRD_MEMO";

function updateMemo(id){
	var data=$("#cont_memo").val();
	var ispublic;
	
	if($("#privacy").val()==0) ispublic=false;
	else ispublic=true;
	
	json = {userid : parseInt($('#userid').val()),
			title : $('.titlememo').val(),
			content : data,
			/*titleurl : "Memo Dashboard",
			domain : "www.khmeracademy.org.kh",
			url : "http://khmeracademy.org.kh",
			isenable : true,*/
			ispublic : ispublic,
			id : id
		};
	
	$.ajax({
		type : "PUT",
		url : domain + "/user/"+id,
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			swal("Success","Your memo has been updated.","success");
			loadPage();
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
	
}