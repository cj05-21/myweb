<%@ page contentType="text/html; charset=UTF-8" %>
<%@ include file="../header.jsp"%>

<!-- 본문시작 agreement.jsp-->
<div style="text-align: center">* 회원 탈되에 앞서<strong style="color:#FF7F00;">유의사항 및 안내</strong>반드시 읽고 진행해 주세요!</div>
<br>	    
<!--
 onsubmit 이벤트는 form이 submit이 될 때 발생함.
 실행된 함수가 false를 리턴하면 submit을 하지 않음.
-->
<form action="memberdelete.jsp"
		 onsubmit="return Send(this)">

<table border="1" cellspacing="0" cellpadding="2"  align="center">
    

    <tr align="center" height="10"> 
        <td>
   			<strong>Myweb 아이디는 재사용 및 복구 불가 안내</strong>
        <br><br>회원탈퇴 진행 시 본인을 포함한 타인 모두 <strong style="color:#FF7F00;">아이디 재사용이나 복구가 불가능 합니다.</strong>
        <br>신중히 선택하신 후 결정해주세요.
        <br>
    	<input type="checkbox" name="agree1" >동의
        </td>
    </tr>

    <tr align="center" height="10"> 
        <td>
   			<strong>내정보 및 개인형 서비스 이용 기록 삭제 안내</strong>
        <br><br>내정보 및 개인형 서비스 이용기록이 모두 삭제되며, <strong style="color:#FF7F00;">삭제된 데이터는 복구되지 않습니다.</strong>
        <br>삭제되는 서비스를 확인하시고, 필요한 데이터는 미리 백업을 해주세요.
        <br>회원 정보는 탈퇴일부터 최대 5년간 보관 후 파기합니다. 
        <br>
    	<input type="checkbox" name="agree2" >동의
        </td>
    </tr>
   
    <tr align="center" height="10"> 
        <td>
   			<strong>게시판형 서비스에 등록한 게시글 삭제 불가 안내</strong>
        <br><br>삭제를 원하시는 게시글이 있다면 반드시 회원탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
        <br>탈퇴 후에는 회원 정보가 삭제되어 본인 여부를 확인 할 수 있는 방법이 없어, <strong style="color:#FF7F00;">게시글을 임의로 삭제해 드릴 수 없습니다.</strong>
        <br>
    	<input type="checkbox" name="agree3" >동의
        </td>
    </tr>

</table>
<br>
<div style="text-align: center">
  <input type="submit" value="회원탈되" class="btn btn-warning"> 
  <input type="button" value="취소"  class="btn btn-warning" onclick="javascript:history.back();"/>
</div>
</form>
<script>

</script>

<!-- 본문 끝 -->
<%@ include file="../footer.jsp"%>			




