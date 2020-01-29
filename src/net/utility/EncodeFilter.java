package net.utility;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncodeFilter implements Filter {//한글필터

	@Override
	public void destroy() {}

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1,
			FilterChain arg2) throws IOException, ServletException {
		//사용자가 요청을 하면 doFilter를 거쳐서 나가고
		//사용자에게 response를 할때도 doFilter를 거쳐서 보내준다
		
		//request 보내기전에 전처리할 코드가 있으면 여기서 처리한다.
		//또한 response후의 후처리할 코드가 있다면 여기서 처리
		arg0.setCharacterEncoding("UTF-8");
		arg2.doFilter(arg0, arg1);
		
	}//doFilter end

	@Override
	public void init(FilterConfig arg0) throws ServletException {}

}//class end
