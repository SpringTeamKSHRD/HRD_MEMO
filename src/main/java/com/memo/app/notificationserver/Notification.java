package com.memo.app.notificationserver;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
@ServerEndpoint("/memo/usernotification")
public class Notification {
		private  static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
		@OnOpen
		public void onOpen(Session session){
			clients.add(session);
			System.out.println("client cooneted");
		}
		@OnMessage
		public void onMessage(String message,Session session){
			for(Session client:clients){
				try {
					client.getBasicRemote().sendText(message);
				} catch (IOException e) {
					// TODO Auto-generated catch block
				}
			}
		}
		@OnClose
		public void OnClose(Session session){
			clients.remove(session);
		}
		@OnError
		public void onError(Throwable error)
		{
	}

}
