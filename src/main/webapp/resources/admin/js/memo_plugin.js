
    var iframe = document.createElement('iframe');
    iframe.id="form-memo-iframe";
    iframe.style.border="none";
    iframe.style.zIndex="99999";
    iframe.style.maring="0";
    iframe.style.overflow="hidden";
    iframe.style.position="absolute";
    iframe.style.right="0px";
    iframe.style.bottom="0px";
    iframe.style.width="100%";
    iframe.style.height="100%";
    iframe.scrolling="no";
    iframe.src = "http://192.168.178.186:8080/HRD_MEMO/test_plugin1";
    document.body.appendChild(iframe);
    
 // SEND MESSAGE TO IFRAME
    addEventListener('load',function(){
    	var domainName = window.location.protocol + '//' + window.location.hostname + (window.location.port ? ':' + window.location.port : '');
        var url = window.location.href.replace(domainName,"");
    	iframe = document.getElementById('form-memo-iframe');
    	iframe.contentWindow.postMessage(domainName+" "+url, 'http://192.168.178.186:8080');
    },true);



/*#form-memo-iframe{
	z-index:9999999;
    margin: 0;
    border: none;
    overflow: hidden;
    position: absolute;
    right: 0px;
    bottom: 0px;
    width: 100%;
    height: 100%;
}*/