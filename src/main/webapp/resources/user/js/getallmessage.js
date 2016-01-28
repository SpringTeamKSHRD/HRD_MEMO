function listAllMessage(){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/oldreport/"+uid,
		success : function(data) {
		       $("#message_diplayer").html(extractData(data));
		       updateMessageStatus();
		},
		error : function(data) {
			  $("#message_diplayer").html("<div class='row'><div class='col s12 m12' style='text-align:center;'>" +
			  		"<div class='card-panel red'>" +
			  		"<h3 class='white-text'>NO MESSAGE FOR DISPLAY</h3>" +
			  		"</div></div></div>");
		}
	});
}
function goToPage() {
	window.location.href="http://localhost:8080/HRD_MEMO/user/userreport";
}
listAllMessage();
function extractData(data){
	var str="<table class='bordered highlight responsive-table' style='margin-top:10px;'>" +
			"<thead style='background: #26a69a; color:white;'>" +
			"<tr><th data-field='id'>No</th>" +
			"<th data-field='name'>Sender</th>" +
			"<th data-field='price'>Description</th>" +
			"<th data-field='name'>Date</th>" +
			"<th data-field='name'>Action</th>" +
			" </tr></thead><tbody>";
	for(var i=0;i<data.DATA.length;i++){
		str+=" <tr style='padding:0px;'>"+
				"<td>"+(i+1)+"</td>" +
				"<td>Admin</td>" +
				"<td>"+data.DATA[i].message+"</td>" +
				"<td>"+data.DATA[i].date+"</td>" +
				"<td><a class='waves-effect waves-light btn modal-trigger' onclick=getBlockedMemo("+data.DATA[i].memoid+")><i class='material-icons'>visibility</i></a></td>" +
				"</tr>";
	}
	str+=" </tbody></table>";
	return str;
}
function getBlockedMemo(id){
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/"+id,
		success : function(data) {
		       $("#memo_title").text("Title: "+generateTitle(data.DATA.title));
		       $("#website").text("Website: "+data.DATA.domain);
		       $("#memo_content").text(data.DATA.content);
		       $("#memo_date").text("Date: "+data.DATA.date);
		       $('#modal1').openModal();
		},
		error : function(data) {
			 alert("rerror");
		}
	});
}
function generateTitle(title){
	 var tl=title.length;
	 if(tl>50){
		 return title.substring(0, 50)+"...";
	 }else{
		 return title;
	 }
}
function getNumberMesage(){
	var uid=parseInt($("#userid").val());
	$.ajax({
		type : "GET",
		url : "http://localhost:8080/HRD_MEMO/user/numbermessage/"+uid,
		success : function(data) {
			if(data.DATA>0){
				$(".numnotify").css('display',"inline");
				$(".numnotify").text(data.DATA);
			}else{
				$(".numnotify").css('display',"none");
			}
		},
		error : function(data) {
		}
	});
}
var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
  var websocket=new WebSocket(url);
  websocket.onopen=function(message){
  }
  websocket.onclose=function(message){
 	 websocket.close();
  }
  websocket.onmessage=function(message){
 	 if(message.data==="response"){
 		 alert("respone");
 		listAllMessage();
 	 }
  }
  function updateMessageStatus(){
		var uid=parseInt($("#userid").val());
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/user/changereport/"+uid,
			success : function(data) {
				getNumberMesage();
			},
			error : function(data) {
			}
		});
	}
  
  function getAllNumberMessage(){
	  var uid=parseInt($("#userid").val());
		$.ajax({
			type : "GET",
			url : "http://localhost:8080/HRD_MEMO/user/allnumbermessage/"+uid,
			success : function(data) {
			},
			error : function(data) {
			}
		});
  }
  getAllNumberMessage();
  
  function generatPagination(data){
	  var p="<li><i class='material-icons'>chevron_left</i></li>";
	  for(var i=1;i<=data.DATA;i++){
		  p+="<li  class='waves-effect><>1</a></li>";
	  }
  }
  
  
  