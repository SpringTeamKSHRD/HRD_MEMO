//add css to iclude iframe
$('head').append("<link rel='stylesheet' href='http://192.168.178.123:8080/HRD_MEMO/resources/css/icondisplayer.css'/>");
$('head').append("<link rel='stylesheet' href='https://fonts.googleapis.com/icon?family=Material+Icons'/>");
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
//create script for iframe auto heigth
var memo_auto_height=document.createElement("SCRIPT");
memo_auto_height.setAttribute("src",'http://192.168.178.123:8080/HRD_MEMO/resources/js/iframeautoheight.js')
ifrm_hrdmemo.append(memo_auto_height);
//wrapper style
wrapper.style.height="auto";
wrapper.style.width="100%";
wrapper.style.margin="0px";
wrapper.style.padding="0px";
wrapper.style.overflow="hidden";
wrapper.appendChild(ifrm_hrdmemo);
//create description panel
var desc_panel=document.createElement("DIV");
desc_panel.style.width="95%";
desc_panel.style.height="auto";
desc_panel.style.padding="0px";
desc_panel.style.margin="10px";
wrapper.appendChild(desc_panel);

var title = document.getElementsByTagName("title")[0].innerHTML;
var url=location.href;
var domain=location.hostname;

function handlingMsg(e){
	if(e.origin=="http://192.168.178.123:8080"){
		alert(document.getElementById("hrdmemo_iframe").contentWindow.style.height);
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
var title = document.getElementsByTagName("title")[0].innerHTML;
var url=location.href;
var domain=location.hostname;
//user save memo
function saveMemo(data){
	var json=JSON.parse(data);
	createDescribeBox(json.content);
	/*json.titleurl=title;
	json.titlememo=title;
	json.domain=domain;
	json.url=url;
	json.userid=2;
	json.isenable=true;
	$.ajax({
		type : "POST",
		url : "http://localhost:8080/HRD_MEMO/plugin/savememo",
		contentType: 'application/json;charset=utf-8',
        data:JSON.stringify(json),
		success : function(data) {
			alert(data.MESSAGE);
		},
		error : function(data) {
		}
	});*/
}
function createDescribeBox(text){
	var desc=document.createElement("P");
	desc.setAttribute('class','chip');
	var close=document.createElement("i");
	close.setAttribute('class','material-icons');
	var close_text=document.createTextNode("close");
	close.appendChild(close_text);
	var desc_text=document.createTextNode(text);
	desc.appendChild(desc_text);
	desc.appendChild(close);
	desc_panel.appendChild(desc);
}

$(document).on('click.chip', '.chip .material-icons', function (e) {
	var ch=desc_panel.offsetHeight;
  $(this).parent().remove();
});

function sendDomain(){
	document.getElementById("hrdmemo_iframe").contentWindow.postMessage(url,"http://192.168.178.123:8080/HRD_MEMO/hrdmemoplugin");
}
addEventListener('load',sendDomain,true);
