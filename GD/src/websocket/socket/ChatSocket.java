package websocket.socket;

import java.util.*;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.*;

public class ChatSocket extends TextWebSocketHandler{
	// 서버에 접속 유저 목록
	private List<WebSocketSession> users;
	
	public ChatSocket(){
		users = new Vector<WebSocketSession>();
	}
	
	// 접속시 유저 목록에 유저 저장
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(WebSocketSession wss : users){
			// <span>user</span>에 user를 사용자 로그인 아이디로
			wss.sendMessage(new TextMessage("<span>user</span> : "+message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
	}
	
}
