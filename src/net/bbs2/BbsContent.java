package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsContent implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
			//해당글번호
		 int num=Integer.parseInt(req.getParameter("num"));
		 	//해당페이지번호
		 String pageNum=req.getParameter("pageNum");
		 
		 //DB 처리
		 BoardDBBean dao= new BoardDBBean();
		 //해당 글번호에 대한 해당 레코드
		 BoardDataBean article = dao.getArticle(num);
		 req.setAttribute("num", new Integer(num));
		 req.setAttribute("pageNum", new Integer(pageNum));
		 req.setAttribute("article",article);
		return "bbsContent.jsp";
	}//requestPro() end
	
}//BbsContent end
