var domain=window.location.origin+"/HRD_MEMO";

	var s_website="<div class='row'>"
					+"<div class='input-field col s12'>"
						+"<input placeholder='type website name' id='first_name' type='text' class='validate'>"
					+"</div>"
				 +"</div>";
	var s_public="&nbsp;&nbsp;<br/><br/>"
				+"<div class='switch'>"
					+"<label>"
						+"Public"
							+"<input type='checkbox'>"
							+"<span class='lever'></span>"
						+"</label>"
				+"</div>";
	var s_date="<br/><div class='row'>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date' id='s_date' onchange='filterByDate()'>"
				+"</div>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date' id='e_date' onchange='filterByDate()'>"
				+"</div>"
				+"</div>";

	$("#searching").change(function(){
		$("#searcharea").html("");
		
		var value = $("#searching").val(); //alert(value);
		if(value==1){
			$("#searcharea").html(s_website);
		}else if(value==2){
			$("#searcharea").html(s_public);
		}else if(value==3){
			$("#searcharea").html(s_date);
		}

	});
	
	function filterByDate(){
		//alert("start date :"+$("#s_date").val()+" And end date: "+$("#e_date").val()); alert(typeof($("#s_date")));
		var sd=$("#s_date").val();
		var ed=$("#e_date").val();
		alert("start date :"+sd+" And end date: "+ed);
		if(sd!=null && ed!=null){
			$.ajax({
				type : "GET",
				url : domain+"/user/filterdate/"+sd+"/"+ed,
				dataType : 'json',
				data : null,
				success : function(data) {
					//alert("Success :" + data);
					displayData(data);
				},
				error : function(data) {
					alert("Unsuccess: " + data.MESSAGE);
					console.log("ERROR..." + data);
				}
			});
		}
	}
