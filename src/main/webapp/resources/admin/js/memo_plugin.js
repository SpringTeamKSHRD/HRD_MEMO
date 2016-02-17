if (window.jQuery) {
    $(window).bind("load", function() {
        	$.getScript('http://khmemo-plugin.herokuapp.com/resources/admin/js/iframeResizer.min.js', function() {
        		$(function() {
//            	APPEND iFrame
        		var iframe = document.createElement('iframe');
       			iframe.zIndex="99999999";
        		iframe.id = "form-memo-iframe";
      			iframe.style.border = "none";
        		//iframe.style.overflow="hidden";
        		iframe.style.position="fixed";
        		iframe.style.right="0px";
        		iframe.style.bottom="0px";
        		//iframe.style.width = "100%";
        		iframe.scrolling = "no";
        		iframe.src = "http://khmemo-plugin.herokuapp.com/test_plugin1";
        		document.body.appendChild(iframe);
        			iFrameResize({bodyMargin:0});
                })

        	});
    });
} else {
    script = document.createElement("script"),
        script.onload = function() {
    	$.getScript('http://khmemo-plugin.herokuapp.com/resources/admin/js/iframeResizer.min.js', function() {
    		$(function() {
//        	APPEND iFrame
    		var iframe = document.createElement('iframe');
    		iframe.zIndex="99999999";
    		iframe.id = "form-memo-iframe";
  			iframe.style.border = "none";
    		//iframe.style.overflow="hidden";
    		iframe.style.position="fixed";
    		iframe.style.right="0px";
    		iframe.style.bottom="0px";
    		//iframe.style.width = "100%";
    		iframe.scrolling = "no";
    		iframe.src = "http://khmemo-plugin.herokuapp.com/test_plugin1";
    		document.body.appendChild(iframe);
    			iFrameResize({bodyMargin:0});
            })
    	});
        },
        script.type = "text/javascript",
        script.src = "http://khmemo-plugin.herokuapp.com/resources/admin/js/jquery-2.1.4.min.js",
        document.body.appendChild(script);
}
