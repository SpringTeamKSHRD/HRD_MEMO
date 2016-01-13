var wrapper=document.getElementById("hrd_memo_pess");
var ifrm_hrdmemo = document.createElement("IFRAME");
ifrm_hrdmemo.setAttribute("src", "http://localhost:8080/HRD_MEMO/hrdmemoplugin");
ifrm_hrdmemo.setAttribute("id", "hrdmemo_iframe");
ifrm_hrdmemo.style.width ="100%";
ifrm_hrdmemo.style.position="relative";
ifrm_hrdmemo.style.border ="none";
ifrm_hrdmemo.setAttribute('scrolling','none');
/*ifrm_hrdmemo.setAttribute('onload',"frameSize('hrdmemo_iframe')");
ifrm_hrdmemo.setAttribute('onresize',"frameSize('hrdmemo_iframe')");*/
wrapper.appendChild(ifrm_hrdmemo);