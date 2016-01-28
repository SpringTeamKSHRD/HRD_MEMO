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
				getNumPagination(data.DATA,10,5);
			},
			error : function(data) {
			}
		});
  }
  getAllNumberMessage();
  var numDisplay=0;
  var paginNum=0;
  var currentPNum=0;
  var currentPagin=1;
  var pageNum=0;
  var lastPage=0;
  var recordNum=0;
  var trueDisplay=0;
  function getNumPagination(data,renum,display){
	  recordNum=renum;
	  if(data % renum != 0){
		  pageNum=Math.floor(data/renum)+1;
	  }else{
		  pageNum=data/renum;
	  }
	  if(pageNum % display != 0){
		 paginNum=Math.floor(pageNum/display)+1;
	  }else{
		  paginNum=pnpageNum/display;
	  }
	  if(pageNum < display){
		  trueDisplay=pageNum;
	  }else{
		  trueDisplay=display;
	  }
	  lastPage=trueDisplay;
	  $("#pagination").html(firstGeneratePagination());
  }
	  
  $(document).on('click.waves-effect', '.waves-effect .pbtn', function (e) {
		alert($(this).text());
 });
  $(document).on('click.waves-effect', '.waves-effect #btnprev', function (e) {
		alert($(this).text()+"left");
});
 $(document).on('click.waves-effect', '.waves-effect #btnnext', function (e) {
		alert($(this).text()+"right");
});
  function generatePage(click){
	  var myPagin=" <li class='waves-effect'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(click> pageNum){
		  
	  }else if(click > lastPage){
		  if(currentPagin<paginNum){
			  currentPagin++;
		  }else{
			  currentPagin=currentPagin;
		  }
		  if(currentPagin * trueDisplay <= pageNum){
			  lastPage=currentPagin * trueDisplay;
			  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
				  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
			  }  
		  }else{
			  lastPage=pageNum;
			  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
				  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
			  } 
		  }
	  }else{
		  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
			  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
		  }  
	  }
	  myPagin+="<li class='waves-effect'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
	  return myPagin;
  }
  
  function firstGeneratePagination(){
	  var myPagin=" <li class='waves-effect'><a id='btnprev'><i class='material-icons'>chevron_left</i></a></li>";
	  if(currentPagin * trueDisplay <= pageNum){
		  lastPage=currentPagin * trueDisplay;
		  for(var i=(currentPagin-1) * trueDisplay+1;i<=currentPagin*trueDisplay;i++){
			  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
		  }  
	  }else{
		  lastPage=pageNum;
		  for(var i=(currentPagin-1) * trueDisplay+1;i <= pageNum;i++){
			  myPagin+="<li class='waves-effect'><a class='pbtn'>"+i+"</a></li>";
		  }
	  }
	  myPagin+="<li class='waves-effect'><a id='btnnext'><i class='material-icons'>chevron_right</i></a></li>";
	  return myPagin;
}
 
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  