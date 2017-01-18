package websocket.socket;

import java.util.*;

import org.springframework.web.socket.*;
import org.springframework.web.socket.handler.*;

public class ChatSocket extends TextWebSocketHandler{
	// ������ ���� ���� ���
	private List<WebSocketSession> users;
	
	public ChatSocket(){
		users = new Vector<WebSocketSession>();
	}
	
	// ���ӽ� ���� ��Ͽ� ���� ����
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		users.add(session);
	}
	
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		for(WebSocketSession wss : users){
			// <span>user</span>�� user�� ����� �α��� ���̵��
			wss.sendMessage(new TextMessage("<span>user</span> : "+message.getPayload()));
		}
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		users.remove(session);
	}
	
}
