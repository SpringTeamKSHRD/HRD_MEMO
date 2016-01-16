var wrapper=document.getElementById("hrd_memo_pess");
var ifrm_hrdmemo = document.createElement("IFRAME");
ifrm_hrdmemo.setAttribute("src", "http://localhost:8080/HRD_MEMO/hrdmemoplugin");
ifrm_hrdmemo.setAttribute("id", "hrdmemo_iframe");
//ifrm_hrdmemo.setAttribute("sandbox","allow-same-origin allow-scripts allow-popups allow-forms");
ifrm_hrdmemo.style.width ="100%";
ifrm_hrdmemo.style.height ="65px";
ifrm_hrdmemo.style.position="relative";
ifrm_hrdmemo.style.float ="right";
ifrm_hrdmemo.style.overflow="hidden";
ifrm_hrdmemo.style.margin="0px";
ifrm_hrdmemo.style.padding="0px";
ifrm_hrdmemo.style.border ="none";
ifrm_hrdmemo.setAttribute('scrolling','no');
wrapper.style.height="auto";
wrapper.style.width="100%";
wrapper.style.margin="0px";
wrapper.style.padding="0px";
wrapper.style.overflow="hidden";
ifrm_hrdmemo.style.overflow="hidden";
wrapper.appendChild(ifrm_hrdmemo);
ifrm_hrdmemo.addEventListener('load', function(){
document.getElementById("hrdmemo_iframe").style.height = document.getElementById("hrdmemo_iframe").contentWindow.document.body.scrollHeight + "px";
});
var iframeWin = document.getElementById('hrdmemo_iframe').contentWindow;
$(iframeWin).on('resize', function(){
	document.getElementById("hrdmemo_iframe").style.height = document.getElementById("hrdmemo_iframe").contentWindow.document.body.scrollHeight + "px";
});