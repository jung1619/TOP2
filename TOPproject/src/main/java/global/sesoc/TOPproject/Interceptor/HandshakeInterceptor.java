package global.sesoc.TOPproject.Interceptor;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.server.ServerHttpRequest;
import org.springframework.http.server.ServerHttpResponse;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.server.support.HttpSessionHandshakeInterceptor;

import global.sesoc.TOPproject.DAO.UserDAO;
import global.sesoc.TOPproject.VO.User;
@Component
public class HandshakeInterceptor extends HttpSessionHandshakeInterceptor{
	
	private static final Logger logger = LoggerFactory.getLogger(HandshakeInterceptor.class);
	
	@Autowired
	private UserDAO dao;

	@Override
	public boolean beforeHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Map<String, Object> attributes) throws Exception {
		
		logger.info("////Before Handshke/////");
		
		
		if(request instanceof ServletServerHttpRequest){
			ServletServerHttpRequest servletRequest = (ServletServerHttpRequest) request;
			HttpSession session = servletRequest.getServletRequest().getSession();
			User user = dao.searchUser((String)session.getAttribute("loginedId"));
			System.out.println(user);
			attributes.put("user", user);
			
		}

		return super.beforeHandshake(request, response, wsHandler, attributes);
	}

	@Override
	public void afterHandshake(ServerHttpRequest request, ServerHttpResponse response, WebSocketHandler wsHandler,
			Exception ex) {
		
		logger.info("/////// After Handshake //////");
		super.afterHandshake(request, response, wsHandler, ex);
	}
	
	
	
	
	

}
