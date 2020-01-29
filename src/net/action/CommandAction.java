//-명령어 메뉴 나열
//-매니저 클래스 역할
//-서블릿으로 부터 명령어의 처리를 지시받아 해당 명령에 대한 작업을 처리하고
//-작업결과를 서블릿으로 리턴한다
//-실제로 작업을 처리하는 것은 구현클래스가 수행
package net.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//요청 파라미터로 명령어를 전달하는 방식의 슈퍼 인터페이스
public interface CommandAction {
	
	//추상메소드
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
										throws Throwable;
}//interface end
