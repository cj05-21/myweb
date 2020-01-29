package net.member2;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.action.CommandAction;

public class LoginProc implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		int res=0;
		MemberDAO dao= new MemberDAO();
		
		try{
		String id=req.getParameter("id");
		String passwd=req.getParameter("passwd");
		
		res=dao.login(id,passwd);
		if(res==1){
			req.setAttribute("id", id);
			req.setAttribute("passwd", passwd);
		//session 영역에 자료 올리기
			HttpSession session= req.getSession();
			session.setAttribute("s_id", id);
			session.setAttribute("s_passwd", passwd);
//------------------------------------------------------쿠키(아이디저장)
		String c_id=req.getParameter("c_id");
			if(c_id==null){
				c_id="";
			}
			
			Cookie cookie=null;
			if(c_id.equals("SAVE")){
				cookie=new Cookie("c_id", id);
				cookie.setMaxAge(60*60*24*31);//1달동안 쿠키저장
			}else{
				cookie=new Cookie("c_id","");
				cookie.setMaxAge(0);//1달동안 쿠키저장
			}
		resp.addCookie(cookie);//사용자pc에 쿠키값 저장
		}//if end
		
		}catch(Exception e){e.printStackTrace();}
			
			req.setAttribute("res", new Integer(res));
			return "loginProc.jsp";
	}
	

}
