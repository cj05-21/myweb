<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
<%@ include file="ssi.jsp"%>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3> * 등록 사진 수정 결과 * </h3>
<%
//1) 첨부된 파일 저장하기----------------------------------
	String saveDirectory=application.getRealPath("/storage")+"/";
	int maxPostsize=1024*1024*10;
	String encoding="UTF-8";
	MultipartRequest mr=new MultipartRequest(request,saveDirectory,maxPostsize,encoding,new DefaultFileRenamePolicy());
	//2) 저장된 파일명, 파일크기 가져오기---------------------
	String item 		= "";
	String fileName		="";
	File 	file 		= null;
	long 	filesize	=0;
	
	Enumeration files= mr.getFileNames();

	//이름-> 파일-> 파일 크기
	while(files.hasMoreElements()){
		item=(String)files.nextElement();
		fileName=mr.getFilesystemName(item);
		if(fileName!=null){
			file=mr.getFile(item);		//파일담기
				if(file.exists()){			//파일 존재하는지?
					filesize=file.length();
				}//if end
		}// if end
	}//while end
	
	//3) tb_pds 테이블에 행 추가하기--------------------------
	String wname=mr.getParameter("wname").trim();
	String subject=mr.getParameter("subject").trim();
	String passwd=mr.getParameter("passwd").trim();
	int pdsno=Integer.parseInt(request.getParameter("pdsno").trim());
	
	
	dto.setWname(wname);
	dto.setSubject(subject);
	dto.setPasswd(passwd);
	dto.setFilename(fileName);
	dto.setPdsno(pdsno);
	
	
	int cnt=dao.pdsUpdate(dto,saveDirectory);
	if(cnt==0){
		out.println(" <script>");
		out.println(" alert('등록 사진 수정에 실패했습니다');");
		out.println(" </script>");
		out.println(" <p><button class='btn btn-warning href='javascript:history.back()'>다시시도</button></p>");
	}else{
		out.println(" <script>");
		out.println(" alert(' 등록 사진 수정 성공하였습니다!!');");
		out.println(" location.href='pdsRead.jsp?pdsno="+pdsno+"'");
		out.println(" </script>");
	}

%>	
	
	
	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>