var domain=window.location.origin+"/HRD_MEMO";

/* This function is for creating memo */
function saveMemo(){	
	var data=$("#cont_memo").val();
	var ispublic;
	
	if($('.titlememo').val()=="" || data==""){
		sweetAlert("Fail", "Title and content memo cannot be empty!", "error");
	}else{
		if($("#privacy").val()==0) ispublic=false;
		else ispublic=true;
		var domainName = window.location.protocol + '//' + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
        var url = window.location.href.replace(domainName,"");
        
		json = {userid : parseInt($('#userid').val()),
				title : $('.titlememo').val(),
				content : data,
				titleurl : "Memo Dashboard",
				domain : "memo.khmeracademy.org",
				url : url,
				isenable : true,
				ispublic : ispublic
			};
		
		$.ajax({
			type : "POST",
			url : domain + "/user/",
			data : JSON.stringify(json),
			contentType: 'application/json',
			success : function(data) {
				swal("Success","Your memo has been saved.","success");
				loadPage();
			},
			error : function(data) {
				sweetAlert("Fail", "Fail with create memo!", "error");
				console.log("ERROR..." + data);
			}
		});
	}
	
}