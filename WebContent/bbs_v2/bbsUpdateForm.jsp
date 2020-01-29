<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="ssi.jsp" %>
<%@ include file="../header.jsp"%>
<!-- 본문시작  -->
	<h3>* 내용 수정 *</h3>
	<p>
	<a href="bbsList.jsp"><button id="me" class="btn btn-warning">목록</button></a>
	<a href="bbsForm.jsp"><button id="me"  class="btn btn-warning">쓰기</button></a>
	</p>
<%
	int bbsno=Integer.parseInt(request.getParameter("bbsno"));
	String passwd=request.getParameter("passwd");
		
	dto.setPasswd(passwd);
	dto.setBbsno(bbsno);
	
	dto=dao.updateform(dto);

	if(dto==null){
		 out.println("<script>");
		    out.println("   alert('비밀번호가 일치하지 않습니다');");
		    out.println("   history.back();");
		    out.println("</script>");
	}else{
%>
	<form name="bbsfrm"  method="post" action="bbsUpdateProc.jsp" onsubmit="return bbsCheck(this)">
      <!--넘기는 값이 sno 가 없어서 hidden속성을 넘겨주는 것이 중요하다  -->
      <input type="hidden" name="bbsno" value="<%=bbsno%>">
      <input type="hidden" name="col" value="<%=col%>">
      <input type="hidden" name="word" value="<%=word%>">
	  <div class="container">
	<table class="table table-striped">
	<tr>
		<th>작성자</th>
		<td><input type="text" name="wname" size="10" maxlength="20" required  class="form-control"  value="<%=dto.getWname()%>"></td>
		 <!-- required 는 input창에 데이터를 입력하지 않으면 form 을 보낼수 없는 속성이다 -->
	</tr>
	<tr>  
		<th >제목</th>
		<td><input type="text" name="subject" size="30" maxlength="100"  required class="form-control" value="<%=dto.getSubject()%>"></td>
	</tr>
	<tr> 	
		<th>내용</th>
		<td><textarea rows="5" cols="30" name="content" class="form-control" ><%=dto.getContent()%></textarea></td>
	</tr>
	<tr> 	
		<th>비밀번호</th>
		<td><input type="password" name="passwd" size="10" maxlength="10" required class="form-control" value="<%=passwd%>"></td>
	</tr>	
	<tr>
		<td colspan="2"> 		
		<input type="submit"  name="btn1" value="수정"  class="btn btn-warning">
		<input type="reset"  name="btn1"  value="취소"  class="btn btn-warning">
		</td>
	</tr>	
	</table>		
</div>			 
	  </form>
<%			
		}//if end
	%>
	
<!-- 본문 끝  -->
<%@ include file="../footer.jsp"%>