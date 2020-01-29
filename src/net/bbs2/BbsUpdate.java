package net.bbs2;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class BbsUpdate implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest req, HttpServletResponse resp)
			throws Throwable {
		
			int num=0;
			String pageNum=null;
			try{
				if(req.getParameter("num")!=null){
					num=Integer.parseInt(req.getParameter("num"));
					pageNum=req.getParameter("pageNum");
				}
			}catch(Exception e){e.printStackTrace();}
			req.setAttribute("num", new Integer(num));
			req.setAttribute("pageNum", new String(pageNum));
		return "bbsupdate.jsp";
	}//requestPro end
	

}//BbsUpdateForm end
