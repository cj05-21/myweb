package net.bbs2;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsInsert implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		//평소 사용하던 DTO 역할의 article객체를 생성시켜 준다
		BoardDataBean article=new BoardDataBean();//DTO
		article.setNum(Integer.parseInt(req.getParameter("num")));
		article.setWriter(req.getParameter("writer"));
		article.setEmail(req.getParameter("email"));
		article.setSubject(req.getParameter("subject"));
		article.setPasswd(req.getParameter("passwd"));
		article.setReg_date(new Timestamp(System.currentTimeMillis()));
		article.setRef(Integer.parseInt(req.getParameter("ref")));
		article.setRe_step(Integer.parseInt(req.getParameter("re_step")));
		article.setRe_level(Integer.parseInt(req.getParameter("re_level")));
		article.setContent(req.getParameter("content"));
		article.setIp(req.getRemoteAddr());
		
		BoardDBBean dao=new BoardDBBean();	//DAO
		dao.insertArticle(article);
		
		return "bbsinsertProc.jsp";
	}//requestPro() end
	

}//BbsInsert end
