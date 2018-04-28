package global.sesoc.TOPproject.Chat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.AbstractWebSocketMessageBrokerConfigurer;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketTransportRegistration;

import global.sesoc.TOPproject.Interceptor.HandshakeInterceptor;

@Configuration
@EnableWebSocketMessageBroker
public class Config extends AbstractWebSocketMessageBrokerConfigurer{
	
	@Autowired
	private HandshakeInterceptor handshakeInterceptor;

	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/endpoint").withSockJS().setInterceptors(handshakeInterceptor);
	}

	@Override
	public void configureWebSocketTransport(WebSocketTransportRegistration registration) {
		registration.setSendTimeLimit(15*1000).setSendBufferSizeLimit(512*1024);
		super.configureWebSocketTransport(registration);
	}

	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
			registry.enableSimpleBroker("/subscribe");
			registry.setApplicationDestinationPrefixes("/");
	
	}
	
	
	
	

}
