package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdateForm implements CommandAction{

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		int num=0;
		String passwd=null;
		String pageNum=null;
		
		BoardDataBean dto=new BoardDataBean();
		
		try{
			num=Integer.parseInt(req.getParameter("num"));
			passwd=req.getParameter("passwd");
			pageNum=req.getParameter("pageNum");
			dto.setNum(num);
			dto.setPasswd(passwd);
			BoardDBBean dao=new BoardDBBean();
			dto=dao.bbsread(dto);
		}catch(Exception e){e.printStackTrace();}
			
			req.setAttribute("num", new Integer(num));
			req.setAttribute("pageNum", new String(pageNum));
			req.setAttribute("dto", dto);
		if(dto==null){
			return "bbsWrong.jsp";
		}else{
			return "bbsupdateForm.jsp";
		}
		
	}
	

}
