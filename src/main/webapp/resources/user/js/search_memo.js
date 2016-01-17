var domain=window.location.origin+"/HRD_MEMO";

	var s_title="<div class='row'>"
			+"<div class='input-field col s12'>"
				+"<input placeholder='type name' id='first_name' type='text' class='validate'>"
			+"</div>"
		+"</div>";
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
					+"<input type='date'>"
				+"</div>"
				+"<div class='col s12 m4 l6'>"
					+"<input type='date'>"
				+"</div>"
				+"</div>";

	$("#searching").change(function(){
		$("#searcharea").html("");
		
		var value = $("#searching").val(); //alert(value);
		if(value==1){
		$("#searcharea").html(s_title);
		}else if(value==2){
		$("#searcharea").html(s_website);
		}else if(value==3){
		$("#searcharea").html(s_public);
		}else if(value==4){
		$("#searcharea").html(s_date);
			/*$('.datepicker').pickadate({
			//selectMonths: true, // Creates a dropdown to control month
			//selectYears: 15 // Creates a dropdown of 15 years to control year
			});*/
		}

	});
