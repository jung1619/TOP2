package global.sesoc.TOPproject.Interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


/**
 * 사용자 로그인 확인 인터셉터 HandlerInterceptorAdapter를 상속받아서 정의.
 * */
public class LoginInterceptor extends HandlerInterceptorAdapter {

	
	//컨트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		//세션정보 읽기
		HttpSession session = request.getSession();
		String loginId = (String)session.getAttribute("loginedId");
		
		//로그인 되지 않은 경우 로그인 페이지로 이동
		if(loginId == null){
			//루트 경로를 구하는 방법
			String path = request.getContextPath();
			response.sendRedirect(path+"/home");
			return false;
		}
		return super.preHandle(request, response, handler);
	}

	
	
}
