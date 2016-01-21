//add css to iclude iframe
$('head').append("<script src='http://192.168.178.123:8080/HRD_MEMO/resources/js/dragbox.js'></script>");
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/icondisplayer.css'/>");
$('head').append("<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'/>");
$('head').append("<script src='http://192.168.178.123:8080/HRD_MEMO/resources/js/alertify.min.js'></script>");
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/alertify.core.css'/>");
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/alertify.default.css'/>");

var wrapper=document.getElementById("hrd_memo_pess");
var ifrm_hrdmemo = document.createElement("IFRAME");
ifrm_hrdmemo.setAttribute("src", "http://192.168.178.123:8080/HRD_MEMO/hrdmemoplugin");
ifrm_hrdmemo.setAttribute("id", "hrdmemo_iframe");
ifrm_hrdmemo.setAttribute("sandbox","allow-same-origin allow-scripts allow-modals");
ifrm_hrdmemo.style.width ="100%";
ifrm_hrdmemo.style.height ="70px";
ifrm_hrdmemo.style.position="relative";
ifrm_hrdmemo.style.overflow="hidden";
ifrm_hrdmemo.style.margin="0px";
ifrm_hrdmemo.style.marginTop="10px";
ifrm_hrdmemo.style.padding="0px";
ifrm_hrdmemo.style.border ="none";
ifrm_hrdmemo.setAttribute('scrolling','no');
ifrm_hrdmemo.style.overflow="hidden";
//wrapper style
wrapper.style.height="auto";
wrapper.style.width="330px";
wrapper.style.right="2px";
wrapper.style.position="absolute";
wrapper.style.top="0px";
wrapper.style.margin="0px";
wrapper.style.padding="0px";
wrapper.style.overflow="hidden";
wrapper.appendChild(ifrm_hrdmemo);
//create description panel
var desc_panel=document.createElement("DIV");
desc_panel.setAttribute("class","mem_desc_panel");
desc_panel.style.width="98%";
desc_panel.style.maxHeight="500px";
desc_panel.style.padding="5px";
desc_panel.style.overflow="auto";
desc_panel.style.position="relative";
wrapper.appendChild(desc_panel);
var retrievedObject=null;
//get memory
try {
retrievedObject =JSON.parse(Cookies.get('MEMO'));
}
catch(err) {
    retrievedObject="";
}
if(retrievedObject!="")
var memo_frm_id=retrievedObject.userid;
var memo_title = document.getElementsByTagName("title")[0].innerHTML;
var memo_url=location.href;
var memo_domain=location.hostname;
var myedit_memo=false;

function handlingMsg(e){
	if(e.origin=="http://192.168.178.123:8080"){
		var datas = e.data.split("#");
		if(datas[0]=='size'){
			ifrm_hrdmemo.style.height=datas[1];
			ifrm_hrdmemo.style.display='block';
			$("#btn-act-desc").fadeOut(500);
			/*if(memo_frm_id!=null||memo_frm_id==""&&myedit_memo==false){
				pluginGetMemo();
				myedit_memo=false;
				}*/
		}else if(datas[0]=='signup'){
			signUpUser(datas[1]);
			//alert(datas[1]);
		}else if(datas[0]=='login'){
			alert(datas[1]);
		}else if(datas[0]=='savememo'){
			saveMemo(datas[1]);
			//alert(datas[1]);
		}else if(datas[0]=="animate"){
			$(".mem_desc_panel").slideToggle();
		}else if(datas[0]=="updatesuccess"){
			pluginGetMemo();
		}
	}
}
addEventListener("message",handlingMsg,true);
//sign up user
function signUpUser(data){
	$.ajax({
		type : "POST",
		url : "http://192.168.178.123:8080/HRD_MEMO/plugin/signup",
		contentType: 'application/json;charset=utf-8',
        data:data,
		success : function(data) {
			//localStorage.setItem('memory', JSON.stringify(data.DATA));
			Cookies.set('MEMO', JSON.stringify(data.DATA));
			retrievedObject=JSON.parse(Cookies.get('MEMO'));
			 memo_frm_id=retrievedObject.userid;
		},
		error : function(data) {
			alert(data.MESSAGE);
		}
	});
}
//user save memo
function saveMemo(data){
	var json=JSON.parse(data);
	json.title=memo_title;
	json.domain=memo_domain;
	json.url=memo_url;
	json.isenable=true;
	json.userid=retrievedObject.userid;
	$.ajax({
		type : "POST",
		url : "http://192.168.178.123:8080/HRD_MEMO/plugin/savememo",
		contentType: 'application/json;charset=utf-8',
        data:JSON.stringify(json),
		success : function(data) {
			createDescribeBox(json.content,json.title);
			pluginGetMemo();
			$("#hrdmemo_iframe").slideUp(2000);
			$("#btn-act-desc").fadeIn(500);
		},
		error : function(data) {
		}
	});
}
//PLUGIN GET MEMO
function pluginGetMemo(){
	var json=new Object();
	json.url=memo_url;
	json.userid=retrievedObject.userid;
	$.ajax({
		type : "POST",
		url : "http://192.168.178.123:8080/HRD_MEMO/plugin/plugingetmemo",
		contentType: 'application/json;charset=utf-8',
        data:JSON.stringify(json),
		success : function(data) {
			listMemoDescriptionBox(data);
		},
		error : function(data) {
		}
	});
}
if(memo_frm_id!=null||memo_frm_id==""){
pluginGetMemo();
}
//list description box
var isIhave=false;
function listMemoDescriptionBox(data){
	removeAllChild();
	for(var i=0;i<data.DATA.length;i++){
		if(data.DATA[i].userid==memo_frm_id){
			isIhave=true;
		}
		createDescribeBox(data.DATA[i].content,data.DATA[i].title,data.DATA[i].userimage,data.DATA[i].userid,data.DATA[i].id);
	}
	if(isIhave==true){
		ifrm_hrdmemo.style.display='none';
		$("#btn-act-desc").fadeIn(500);
		isIhave=false;
	}
}
$(document).on('click.chip', '.chip .material-icons', function (e) {
	if($(this).text()==='delete'){
		 $(this).parent().remove();
	}else if($(this).text()=='mode_edit'){
	}
	else if($(this).text()==='assignment'){
			alertify.prompt("Enter your report to this memo", function (e, str) {
			    if (e&&str!=""){
			        sendReportNotify();
			    }
				}, "");
		    }
});
//delete memo
function pluginDeleteMemo(id){
	$.ajax({
		type : "GET",
		url : "http://192.168.178.123:8080/HRD_MEMO/plugin/"+id,
		success : function(data) {
			pluginGetMemo();
			if(isIhave==false){
			ifrm_hrdmemo.style.display='block';
			$("#btn-act-desc").fadeOut(500);
			}
		},
		error : function(data) {
		}
	});
}
function getToEdit(id){
	myedit_memo=true;
	document.getElementById("hrdmemo_iframe").contentWindow.postMessage(memo_url+"#"+retrievedObject+"#"+id,"http://192.168.178.123:8080/HRD_MEMO/hrdmemoplugin");
}
//create description box
function createDescribeBox(text,title,image,userid,memoid){
	var desc=document.createElement("P");
	//create image and data wrapper
	var memo_img_wraper=document.createElement("DIV");
	memo_img_wraper.setAttribute("class","memo_img_wrapper");
	var user_memo_img=document.createElement("img");
	user_memo_img.setAttribute('class','user-memo-img');
	user_memo_img.setAttribute('src','http://192.168.178.123:8080/HRD_MEMO/resources/'+image);
	memo_img_wraper.appendChild(user_memo_img);
	//create title 
	var memo_title_label=document.createElement('small');
	memo_title_label.style.color="white";
	memo_title_label.style.float="right";
	memo_title_label.style.margin="0px";
	memo_title_label.style.paddingRight="10px";
	memo_title_label.style.fontSize="14px";
	var memo_desc_title=document.createTextNode(title);
	memo_title_label.appendChild(memo_desc_title);
	memo_img_wraper.appendChild(memo_title_label);
	//create date label
	var memo_date_label=document.createElement('small');
	memo_date_label.style.color="gray";
	memo_date_label.style.float="right";
	memo_date_label.style.margin="0px";
	var today = new Date();
	var memo_date_time='Date :'+today.getDate()+'/'+today.getMonth()+1+'/'+today.getFullYear()+'    Time:'+today.getHours()+':'+today.getMinutes();
	var memo_desc_date=document.createTextNode(memo_date_time);
	memo_date_label.appendChild(memo_desc_date);
	///
	desc.setAttribute('class','chip');
	var close=document.createElement("i");
	close.setAttribute('class','material-icons');
	close.setAttribute('title','close');
	close.style.color="red";
	close.setAttribute('onclick','pluginDeleteMemo('+memoid+')');
	var close_text=document.createTextNode("delete");
	close.appendChild(close_text);
	var report=document.createElement("i");
	report.setAttribute('class','material-icons');
	report.setAttribute('title','report');
	report.style.color="#FFC107";
	var report_text=document.createTextNode("assignment");
	report.appendChild(report_text);
	var desc_text=document.createTextNode(text);
	//create edit text
	var edit=document.createElement("i");
	edit.setAttribute('onclick','getToEdit('+memoid+')');
	edit.setAttribute('class','material-icons');
	edit.setAttribute('title','edit');
	edit.style.color="#00E676";
	var edit_text=document.createTextNode("mode_edit");
	edit.appendChild(edit_text);
	//create footer
	var memo_footer=document.createElement("P");
	memo_footer.setAttribute('class','mymemo-footer');
	memo_footer.appendChild(memo_date_label);
	desc.appendChild(memo_img_wraper);
	desc.appendChild(desc_text);
	if(userid==memo_frm_id){
		desc.appendChild(close);
		desc.appendChild(edit);
	}
	if(userid!=memo_frm_id){
		desc.appendChild(report);
	}
	desc.appendChild(memo_footer);
	desc_panel.appendChild(desc);
}

//Send current url to child
function sendDomain(){
	document.getElementById("hrdmemo_iframe").contentWindow.postMessage(memo_url+"#"+retrievedObject,"http://192.168.178.123:8080/HRD_MEMO/hrdmemoplugin");
}

addEventListener('load',sendDomain,true);
//report memo
var hrd_notify_url="ws://192.168.178.123:8080/HRD_MEMO/memo/usernotification";
var hrd_memo_websocket=new WebSocket(hrd_notify_url);

var messages=document.getElementById("messages");
var message=document.getElementById("forsend");

hrd_memo_websocket.onopen=function(message){
	// messages.value="Connected...!\n";
}
hrd_memo_websocket.onclose=function(message){
	 websocket.close();
}
hrd_memo_websocket.onmessage=function(message){
	 if(message.data==="response"){
	 }
}
function sendReportNotify(){
	hrd_memo_websocket.send("report");
}
//hide iframe 
function removeAllChild(){
	while( desc_panel.hasChildNodes() ){
		desc_panel.removeChild(desc_panel.lastChild);
	}
}
//create button
var activate_desc_memo=document.createElement("BUTTON");
activate_desc_memo.setAttribute('id','btn-act-desc');
var btn_desc_img=document.createElement("i");
btn_desc_img.setAttribute('class','material-icons');
activate_desc_memo.setAttribute('title','active memo panel');
btn_desc_img.style.fontSize="25px";
var act_btn_text=document.createTextNode("swap_vert");
btn_desc_img.appendChild(act_btn_text);
activate_desc_memo.appendChild(btn_desc_img);
$('body').append(activate_desc_memo);
$("#btn-act-desc").click(function(){
	$(".mem_desc_panel").slideToggle();
});
$("#btn-act-desc").css('display','none');




