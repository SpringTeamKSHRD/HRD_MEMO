<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<textarea rows="10" cols="50" id="messages" readonly="readonly"></textarea><br/>
     <input type="text" id="forsend" size="45"/><input type="button" value="Send" onclick="sendMessage()"/>
     
     <script type="text/javascript">
     var url="ws://localhost:8080/HRD_MEMO/memo/usernotification";
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
    	if(message.data==="report")  
    	messages.value+=message.data+"\n";
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