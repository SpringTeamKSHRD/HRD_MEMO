var domain=window.location.origin+"/HRD_MEMO";

function saveMemo(){
	
	var data=$("#cont_memo").val();
	var ispublic;
	
	if($("#privacy").val()==0) ispublic=false;
	else ispublic=true;
	
	json = {userid : parseInt($('#userid').val()),
			title : $('.titlememo').val(),
			content : data,
			titleurl : "Memo Dashboard",
			domain : "www.khmeracademy.org.kh",
			url : "http://khmeracademy.org.kh",
			isenable : true,
			ispublic : ispublic
		};
	
	//alert("after data json.")
	$.ajax({
		type : "POST",
		url : domain + "/user/",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			alert("Success :" + data.MESSAGE);
			loadPage();
		},
		error : function(data) {
			alert("Unsuccess: " + data.MESSAGE);
			console.log("ERROR..." + data);
		}
	});
}