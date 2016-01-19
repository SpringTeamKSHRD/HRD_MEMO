//add css to iclude iframe
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/icondisplayer.css'/>");
$('head').append("<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'/>");
$('head').append("<script src='http://192.168.178.123:8080/HRD_MEMO/resources/js/alertify.min.js'></script>");
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/alertify.core.css'/>");
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/alertify.default.css'/>");
//iframe wrapper
var wrapper=document.getElementById("hrd_memo_pess");
var ifrm_hrdmemo = document.createElement("IFRAME");
ifrm_hrdmemo.setAttribute("src", "http://192.168.178.123:8080/HRD_MEMO/hrdmemoplugin");
ifrm_hrdmemo.setAttribute("id", "hrdmemo_iframe");
ifrm_hrdmemo.setAttribute("sandbox","allow-same-origin allow-scripts allow-modals");
ifrm_hrdmemo.style.width ="100%";
ifrm_hrdmemo.style.height ="60px";
ifrm_hrdmemo.style.position="relative";
ifrm_hrdmemo.style.overflow="hidden";
ifrm_hrdmemo.style.margin="0px";
ifrm_hrdmemo.style.padding="0px";
ifrm_hrdmemo.style.border ="none";
ifrm_hrdmemo.setAttribute('scrolling','no');
ifrm_hrdmemo.style.overflow="hidden";
//wrapper style
wrapper.style.height="auto";
wrapper.style.width="100%";
wrapper.style.margin="0px";
wrapper.style.padding="0px";
wrapper.style.overflow="hidden";
wrapper.appendChild(ifrm_hrdmemo);
//create description panel
var desc_panel=document.createElement("DIV");
desc_panel.style.width="98%";
desc_panel.style.height="auto";
desc_panel.style.padding="5px";
wrapper.appendChild(desc_panel);

var title = document.getElementsByTagName("title")[0].innerHTML;
var url=location.href;
var domain=location.hostname;

function handlingMsg(e){
	if(e.origin=="http://192.168.178.123:8080"){
		var datas = e.data.split("#");
		if(datas[0]=='size'){
			ifrm_hrdmemo.style.height=datas[1];
		}else if(datas[0]=='signup'){
			//signUpUser(datas[1]);
			alert(datas[1]);
		}else if(datas[0]=='login'){
			alert(datas[1]);
		}else if(datas[0]=='savememo'){
			saveMemo(datas[1]);
			//alert(datas[1]);
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
			alert(data.MESSAGE);
		},
		error : function(data) {
		}
	});
}
var memo_title = document.getElementsByTagName("title")[0].innerHTML;
var memo_url=location.href;
var memo_domain=location.hostname;
//user save memo
function saveMemo(data){
	var json=JSON.parse(data);
	createDescribeBox(json.content);
	/*json.title=memo_title;
	json.domain=memo_domain;
	json.url=url;
	json.userid=2;
	json.isenable=true;
	$.ajax({
		type : "POST",
		url : "http://localhost:8080/HRD_MEMO/plugin/savememo",
		contentType: 'application/json;charset=utf-8',
        data:JSON.stringify(json),
		success : function(data) {
			createDescribeBox(json.content);
		},
		error : function(data) {
		}
	});*/
}
function createDescribeBox(text){
	var desc=document.createElement("P");
	var memo_img_wraper=document.createElement("DIV");
	memo_img_wraper.setAttribute("class","memo_img_wrapper");
	var user_memo_img=document.createElement("img");
	user_memo_img.setAttribute('class','user-memo-img');
	user_memo_img.setAttribute('src','http://192.168.178.123:8080/HRD_MEMO/resources/Male-icon.png');
	memo_img_wraper.appendChild(user_memo_img);
	desc.setAttribute('class','chip');
	var close=document.createElement("i");
	close.setAttribute('class','material-icons');
	close.setAttribute('title','close');
	close.style.color="red";
	var close_text=document.createTextNode("close");
	close.appendChild(close_text);
	var report=document.createElement("i");
	report.setAttribute('class','material-icons');
	report.setAttribute('title','report');
	report.style.color="#00E676";
	var report_text=document.createTextNode("assignment");
	report.appendChild(report_text);
	var desc_text=document.createTextNode(text);
	desc.appendChild(memo_img_wraper);
	desc.appendChild(desc_text);
	desc.appendChild(close);
	desc.appendChild(report);
	desc_panel.appendChild(desc);
}

$(document).on('click.chip', '.chip .material-icons', function (e) {
	if($(this).text()=='close'){
		 $(this).parent().remove();
	}else{
			alertify.prompt("Enter your report to this memo", function (e, str) {
			    if (e&&str!=""){
			        sendReportNotify();
			    }
				}, "");
		    }
});
//Send current url to child
function sendDomain(){
	document.getElementById("hrdmemo_iframe").contentWindow.postMessage(memo_url,"http://192.168.178.123:8080/HRD_MEMO/hrdmemoplugin");
}
addEventListener('load',sendDomain,true);
//report memo
var hrd_notify_url="ws://192.168.178.123:8080/HRD_MEMO/memo/usernotification";
var hrd_memo_websocket=new WebSocket(hrd_notify_url);

var messages=document.getElementById("messages");
var message=document.getElementById("forsend");

hrd_memo_websocket.onopen=function(message){
	 messages.value="Connected...!\n";
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
