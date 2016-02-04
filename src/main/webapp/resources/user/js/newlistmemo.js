

// path variable declare in your jsp file
var pageNumber=0;
var displayRecord=0;
var current=1;
function generatePageNumber(data,displayrec){
	displayRecord=displayrec;
	     if(data>0){
	    	 if(data % displayrec !=0){
	    		 pageNumber=Math.floor(data/displayrec)+1;
	    	 }else{
	    		 pageNumber=data/displayrec;
	    	 }
	     }
}
function init(){
	 $.ajax({
			type : "GET",
			url : path+"/user/listdomain",
			success : function(data) {
				console.log(data)
				$('#searchdomain')
				         .append($("<option></option>")
				         .attr("value","")
				         .text("All Websites"));
				$.each(data.DATA, function(key, value) {   
				     $('#searchdomain')
				         .append($("<option></option>")
				         .attr("value",value)
				         .text(value)); 
				});
				listMemo();
			},
			error : function(data) {
			  console.log(data)
			}
		});
}
function listMemo(){
	var json={};
	var url='';
	if(($('input[name="privacy"]:checked').val())==""){
		url=path+"/user/mylistmemo";
		json = {
				userid:$("#userid").val(),//for userid can text ""
				title:$("#searchtitle").val(),//for search title text can ""
				domainName:$("#searchdomain").val(),//for search domainName text can "
			};
	}else{
		url=path+"/user/mylistmemo1";
		json = {
				userid:$("#userid").val(),//for userid can text ""
				title:$("#searchtitle").val(),//for search title text can ""
				domainName:$("#searchdomain").val(),//for search domainName text can ""
				ispublic:$('input[name="privacy"]:checked').val()//for privacy true or false text can ""
			};
	}
	
  $.ajax({
		type : "POST",
		url : url,
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
			var tr='';
			var privacy_icon='';
			$.each(data.DATA, function(key, value) {   
				if(value.ispublic==false){
					privacy_icon='<small class="label label-danger">Private</small>';
				}else{
					 privacy_icon='<small class="label label-info">Public</small>';
				}
				tr+='<tr>';
			    tr+='<td class="mailbox-name" align="center"><a href="'+value.fullDomain+'"><img src="https://www.google.com/s2/favicons?domain='+value.fullDomain+'" title="'+value.fullDomain+'"></a></td>';
			    tr+='<td class="mailbox-subject"><b>'+privacy_icon+"&nbsp;&nbsp;&nbsp;"+value.title+'</b> <br />'+value.content+'</td>';
			    tr+='<td class="mailbox-attachment"><div class="tools"><i class="fa fa-edit"></i> <i class="fa fa-trash-o"></i></div>';
			    tr+='</td><td class="mailbox-date" align="center">'+moment(value.date).format("DD-MM-YYYY HH:mm:ss")+' </td>';
			    tr+='</tr>';
			});
			$('table.table').html(tr);
			
			
			/* HOVER ON EACH MEMO */
			$('tr').hover(function() {
				$(this).find('.tools i').show();
			}, function() {
				$(this).find('.tools i').hide();
			});
		},
		error : function(data) {
		  $('table.table').html("");
		}
	});  
}

function getMemoDisplay(page){
	json = {
			userid:$("#userid").val(),//for userid
			title:$("#searchtitle").val(),//for search title 
			domainName:$("#searchdomain").val(),//for search domainName can ""
			date:"",//for search date format YYYY-MM-DD text can ""
			ispublic:$('input[name="privacy"]:checked').val(),//for privacy true or false text can ""
			page:page,
			limit:displayRecord
		};
  $.ajax({
		type : "POST",
		url : path+"/user/usermemo",
		data : JSON.stringify(json),
		contentType: 'application/json',
		success : function(data) {
				//Extract data function here
		},
		error : function(data) {
			$("#listmemo").html("<div>No Recorde Has Been Found</div>");
		  $("#pagination").html("");
		  $("#rowwrapper").css("display","none");
		}
	});  	
}

//for next button 
$("#next").click(function(){
	if(current<pageNumber){
		current++;
		getMemoDisplay(current);
	}
});
//for prev button
$("#prev").click(function(){
	if(current>1){
		current--;
		getMemoDisplay(current);
	}
});