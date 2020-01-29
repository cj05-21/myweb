package net.bbs2;

import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdateProc implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		BoardDataBean dto=new BoardDataBean();
		int cnt=0;
		String pageNum=req.getParameter("pageNum");
		int num=Integer.parseInt(req.getParameter("num"));
		try{
		dto.setNum(Integer.parseInt(req.getParameter("num")));
		dto.setWriter(req.getParameter("writer"));
		dto.setEmail(req.getParameter("email"));
		dto.setSubject(req.getParameter("subject"));
		dto.setPasswd(req.getParameter("passwd"));
		dto.setContent(req.getParameter("content"));
	    
		BoardDBBean dao=new BoardDBBean();
		cnt=dao.update(dto);
		}catch(Exception e){e.printStackTrace();}
	
		req.setAttribute("pageNum", new String(pageNum));
		req.setAttribute("num", new Integer(num));
		
		return "bbsupdateProc.jsp";
	}
	

}
