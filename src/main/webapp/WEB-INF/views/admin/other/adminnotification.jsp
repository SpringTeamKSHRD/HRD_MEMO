<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script
	src='${pageContext.request.contextPath}/resources/admin/js/jquery-2.1.4.min.js'></script>
</head>
<body>
<textarea rows="10" cols="50" id="messages" readonly="readonly"></textarea><br/>
     <input type="text" id="forsend" size="45"/><input type="button" value="Send" onclick="sendMessage()"/>
     <div id="numnot" style="background: red; color: white; font-size: 17; border-radius:90%; padding: 5px; width: 30px; height: 30px; margin: auto; font-weight: bolder;"></div>
     
     <script type="text/javascript">
     var notify=0;
     var url="ws://memo.khmeracademy.org/memo/usernotification";
     var websocket=new WebSocket(url);
     
     var messages=document.getElementById("messages");
     var message=document.getElementById("forsend");

     websocket.onopen=function(message){
    	 messages.value="Connected...!\n";
     }
     websocket.onclose=function(message){
    	 websocket.close();
     }
      websocket.onmessage=function(message){
    	if(message.data==="report"){  
    	messages.value+=message.data+"\n";
    	notify++;
    	$("#numnot").text(notify);
    	}
     }  
     function sendMessage(){
    	 websocket.send("response");
     }
     /* function getAutoplay() {
 		var snd = new Audio('alert2.mp3');
 		snd.play();
 	} */
 		
     </script>
</body>
</html>