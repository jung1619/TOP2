package global.sesoc.TOPproject.Chat;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;



public class EchoHandler extends TextWebSocketHandler {
	private ArrayList<Map<String,WebSocketSession>> sessionList;
	private static Logger logger = Logger.getLogger(EchoHandler.class);
	private int count = 0;
	private String nickName="초기값";
	private Map<String,WebSocketSession> sessionMap;
	private Map<String,String> selectNickName; //getid가 key값, nickname
	private HttpServletRequest req;
	
	public EchoHandler(){
		this.logger.info("create SocketHandler instance!");
		sessionList =new ArrayList<Map<String,WebSocketSession>>();
		selectNickName= new HashMap<String,String>();
					//<websocketId,nickname>
		
		
	}
	

	//클라이언트와 연결 된 후
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {

		
		
		
		logger.info("접속확인 : "+session.getId());
		sessionMap = new HashMap<String,WebSocketSession>(); 
		sessionMap.put(nickName, session);
		selectNickName.put(session.getId(),nickName);
		System.out.println("map누적 상태:"+sessionMap);
		sessionList.add(sessionMap);
		System.out.println("list누적상태:"+sessionList);
		nickName = count+"";
		count++;
		logger.info(count+"명째 입장중");
		
	}
	//웹 소켓 서버로 데이터를 전송했을 경우
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		// TODO Auto-generated method stub
		System.out.println("메시지 보냄");
		super.handleTextMessage(session, message);
		logger.info("session : "+session.getId());
		System.out.println(message.getPayload());
		
		for(Map<String,WebSocketSession> sessionMap : sessionList){
			System.out.println("sessionMap:"+sessionMap);
			for(Map.Entry<String, WebSocketSession> elem : sessionMap.entrySet()){
				logger.info("for문 elem.getValue() : "+elem.getValue());
				if(elem.getValue().getId().equals(session.getId())){
					logger.info("id 같을때 elem.getValue: " + elem.getValue());
					elem.getValue().sendMessage(new TextMessage("나 :"+message.getPayload()));
				}else{
					logger.info("id다를때 elem.Key: " + elem.getKey());
					elem.getValue().sendMessage(new TextMessage(selectNickName.get(session.getId()) +" : "+message.getPayload()));
					
					
					
				}
				
			}
		}
		
		
		
		
		/*	for(Map.Entry<WebSocketSession, String> elem : nickNameList.entrySet()){
				
				if(elem.getKey().getId().equals(session.getId())){
					elem.getKey().sendMessage(new TextMessage("나 : "+message.getPayload()));
				}else{
					elem.getKey().sendMessage(new TextMessage(elem.getValue()+":"+message.getPayload()));
				}
				
			}*/				
			
	
		/*for(WebSocketSession sess:sessionList){
			logger.info("sess:"+sess);
			logger.info(session.getId()+"getid");
			
			
			if(sess.getId().equals(session.getId())){
				//sessionList에서 add했던 id를 꺼내고 메시지를 출력
				sess.sendMessage(new TextMessage("나 :"+message.getPayload()));
			}else{
				sess.sendMessage(new TextMessage(session.getId()+" : "+message.getPayload()));
			}
			
		}*/
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		// TODO Auto-generated method stub
		super.afterConnectionClosed(session, status);
		System.out.println("종료");
		//List삭제
		
		
		for(Map<String,WebSocketSession> sessionMap : sessionList){
			for(Map.Entry<String, WebSocketSession> elem : sessionMap.entrySet()){
				
				if(session.equals(elem.getValue())){
						sessionList.remove(elem);
				}
				
			}
		}
		
		/*for(WebSocketSession webSocketSession : sessionList){
			if(session.getId().equals(webSocketSession.getId())){
				webSocketSession.sendMessage(new TextMessage(webSocketSession.getRemoteAddress().getHostName()+"퇴장했습니다."));
			}
		}*/
	}

	
}
