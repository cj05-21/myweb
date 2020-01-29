package net.bbs2;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsDeleteProc implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		
		int num=0;
		String passwd=null;
		String pageNum=null;
		int cnt=0;
		try{
		num=Integer.parseInt(req.getParameter("num"));
		passwd=req.getParameter("passwd");
		pageNum=req.getParameter("pageNum");
		
		BoardDataBean dto=new BoardDataBean();
		dto.setNum(num);
		dto.setPasswd(passwd);
		BoardDBBean dao=new BoardDBBean();
		
		cnt=dao.bbsDel(dto);
		
		}catch(Exception e){e.printStackTrace();}
		
		req.setAttribute("pageNum", new Integer(pageNum));
		
		
		if(cnt==0){
			 
			return "bbsWrong.jsp";
		}else{
		
			return "bbsdeleteProc.jsp";
		}
	}//requestPro end
	

}//BbsDeleteForm end
