package net.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.action.CommandAction;

public class MyController extends HttpServlet{
	
	private Map commandMap = new HashMap(); //명령어와 명령어 처리 클래스를 쌍으로 저장

	//명령어와 처리클래스가 매핑되어 있는 propertise 파일을 읽어서 Map 객체인 commandMap에 저장
	//명령어와 처리클래스가 매핑되어 있는 propertise 파일은 command.properties파일
	@Override
	public void init(ServletConfig config) throws ServletException {
		//web.xml 에서 propertyConfig에 해당하는 init=param 의 값을 읽어옴
		String props= config.getInitParameter("propertyConfig");
		Properties pr=new Properties(); //명령어와 처리클래스의 매핑정보를 저장할 Properties 객체 생성
		FileInputStream f=null;
		try{
			f = new FileInputStream(props); //command.properties 파일 가져오기 가져온 파일을 f변수에 넣어준후 
			pr.load(f);  //command.properties파일을 명령어와 처리 클래스의  Properties 객체에 저장하기
		}catch(IOException e){
			System.out.println(e);
			}finally{
				if(f!=null)try{f.close();}catch(Exception ex){}
		}//try end
		
		
		Iterator keyiter = pr.keySet().iterator();// Iterator객체는 Enumeration 개체를 확장시킨 개념의 객체
		while(keyiter.hasNext()){// 객체를 하나씩 꺼내서 그 객체명으로 Properties 객체에 저장된 객체에 접근
			String key= (String)keyiter.next();
			String value=pr.getProperty(key);
			//System.out.println(key);
			//System.out.println(value);
			//http://localhost:8090/myweb/index.do
			try{
				Class commandClass = Class.forName(value);					//해당 문자열을 클래스로 만든다.
				Object commandInstance = commandClass.newInstance();	//해당클래스의 객체를 생성
				commandMap.put(key, commandInstance);//Map객체인 commandMap 에 객체 저장
				
				//System.out.println(key);
				//System.out.println(commandInstance);
				
			}catch(Exception e){System.out.println(e);}
		}//while
	}//init() end
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		process(req, resp);
	}//doGet() end

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		process(req, resp);
	}//doPost() end
	
	//사용자의 요청을 분석해서 해당 작업을 처리
	protected void process(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String view=null;
		CommandAction com=null; // 슈퍼인터페이스
		try{
		String command=req.getRequestURI();		///myweb/index.do
		com = (CommandAction)commandMap.get(command);
		view=com.requestPro(req, resp);
		
		}catch(Throwable e){
			throw new ServletException(e);
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher(view);
		dispatcher.forward(req, resp);
	}//process() end

}//class
