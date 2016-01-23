//add css to iclude iframe
$('head').append("<script type='text/javascript' src='http://localhost:8080/HRD_MEMO/resources/js/iframeResizer.min.js'></script>");
$('head').append("<script type='text/javascript' src='http://localhost:8080/HRD_MEMO/resources/js/shortcutkey.js'></script>");
//iframe wrapper
var wrapper=document.getElementById("hrd_memo_pess");
var ifrm_hrdmemo = document.createElement("IFRAME");
ifrm_hrdmemo.setAttribute("src", "http://localhost:8080/HRD_MEMO/hrdmemoplugin");
ifrm_hrdmemo.setAttribute("sandbox","allow-same-origin allow-scripts allow-modals");
ifrm_hrdmemo.setAttribute('class','my-memo-class');
ifrm_hrdmemo.style.width ="100%";
ifrm_hrdmemo.style.height="600px";
ifrm_hrdmemo.style.position="relative";
ifrm_hrdmemo.style.right="0px";
ifrm_hrdmemo.style.top="0px";
ifrm_hrdmemo.style.marginRight="0px";
ifrm_hrdmemo.style.padding="0px 0px 5px 0px";
ifrm_hrdmemo.style.border ="none";
ifrm_hrdmemo.setAttribute('scrolling','no');
//wrapper style
wrapper.style.maxHeight="500px";
wrapper.style.width="0px";
wrapper.style.right="2px";
wrapper.style.position="absolute";
wrapper.style.top="0px";
wrapper.style.margin="0px";
wrapper.style.padding="0px";
wrapper.appendChild(ifrm_hrdmemo);
///start script
var iframe_memo_id="";
var memo_title = document.getElementsByTagName("title")[0].innerHTML;
iFrameResize({
	messageCallback         : function(messageData){
		iframe_memo_id=messageData.iframe.id;
	},
	resizedCallback         : function(messageData){
        document.getElementsByClassName('my-memo-class')[0]
        .iFrameResizer.sendMessage( messageData.height+"#"+location.hostname+"#"+location.href+"#"+memo_title);
	}
});
var activate_desc_memo=document.createElement("BUTTON");
activate_desc_memo.setAttribute("id","btn-act-desc");
activate_desc_memo.style.position="fixed";
activate_desc_memo.style.right="5px";
activate_desc_memo.style.bottom="5px";
var act_btn_text=document.createTextNode("Memo");
activate_desc_memo.appendChild(act_btn_text);
$('body').append(activate_desc_memo);
var my_memo_hide=true;
$("#btn-act-desc").click(function(){
	if(my_memo_hide==true){
	$("#hrd_memo_pess").animate({width: 341, marginLeft: 0}, {duration: 500});
	my_memo_hide=false;
	}else{
		my_memo_hide=true;
		$("#hrd_memo_pess").animate({width: 0, marginLeft: 0}, {duration: 500});
	}
});
$("#btn-act-desc").css('display','block');
Mousetrap.bind('a+m', function(e) {
	if(my_memo_hide==true){
		$("#hrd_memo_pess").animate({width: 320, marginLeft: 0}, {duration: 500});
		my_memo_hide=false;
		}else{
			my_memo_hide=true;
			$("#hrd_memo_pess").animate({width: 0, marginLeft: 0}, {duration: 500});
		}
});



















