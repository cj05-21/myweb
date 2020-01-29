/*myscript.js*/
function showTime(){
  		//alert(moment().year());
  		var now=moment();
  		var hour=now.hour();
  		var min=now.minute();
  		var sec=now.second();
  		
  		$("#hour").text(hour+"시").appendTo();
  		$("#minutes").text(min+"분").appendTo();
  		$("#sec").text(sec+"초").appendTo();
  	}//showTime() end

  function createYearMonthDate(){
  	
  	var nowYear=moment().year();
  	var nowMonth=moment().month()+1;
  	var nowDate=moment().date();
  	
  	$("#year").text(nowYear+"년").appendTo();
  	$("#month").text(nowMonth+"월").appendTo();
  	$("#day").text(nowDate+"일").appendTo();
  }
  
  function bbsCheck(f){
	  //게시판 유효성 검사
	  //1) 작성자 2글자 이상 입력
	  var wname= f.wname.value;
	  wname=wname.trim();
	  if(wname.length<2){
		  alert("작성자 2글자이상 입력해 주세요");
		  f.wname.focus();
		  return false;
	  }
	  //2) 제목 2글자이상 입력
	  var subject= f.subject.value;
	  subject=subject.trim();
	  if(subject.length<2){
		  alert("제목 2글자이상 입력해 주세요");
		  f.subject.focus();
		  return false;
	  }
	  //3) 내용 2글자이상 입력
	  var content= f.content.value;
	  content=content.trim();
	  if(content.length<2){
		  alert("내용 2글자이상 입력해 주세요");
		  f.content.focus();
		  return false;
	  }
	  //4) 비밀번호 4글자이상 입력
	  var passwd= f.passwd.value;
	  passwd=passwd.trim();
	  if(passwd.length<4){
		  alert("비밀번호 4글자이상 입력해 주세요");
		  f.passwd.focus();
		  return false;
	  }
	  return true;//onsubmit 이벤트에서 서버로 전송
  }
  
  function pwCheck(f){
	  //비밀버호가 4글자 이상 입력 되었는지 검사
	  var passwd= f.passwd.value;
	  passwd=passwd.trim();
	  
	  if(passwd.length<4){
		  alert("비밀번호 4글자이상 입력해 주세요");
		  f.passwd.focus();
		  return false;
	  }
		  
     if(confirm(message)){//확인 true, 취소 false
    	 return true;
     }else{
    	 return false;
     }//if end
  }// pwCheck end
  
  function searchCheck(w){
	  var word=w.word.value;
	  word=word.trim();
	  if(word.length==0){
		  alert("검색어를 입력하세요");
		  return false;//서버 전송 불가
	  }//if end
	  return true;	//서버로 전송
	  
  }//searchCheck() end
  
  
  function loginCheck(f){
	  //로그인 유효성 검사
	  //1) 아이디 5~10글자 이내
	  var id=f.id.value;
	  id=id.trim();
	  if(id.length<4||id.length>10){
		  alert("아이디를 4~10글자 입력해 주세요");
		  return false;//서버 전송 불가
	  }//if end
	  //2) 비밀번호 5~10글자 이내
	  var passwd=f.passwd.value;
	  passwd=passwd.trim();
	  if(passwd.length<4||passwd.length>10){
		  alert("아이디를 4~10글자 입력해 주세요");
		  return false;//서버 전송 불가
	  }//if end
	  return true;
  }
  
  
  function send(f){
	  if(f.agree.checked==true){
		  return true;
	  }else{
		  alert("약관 동의 후 회원가입이 가능합니다");
		  return false;
	  }
	
  }
  
  function idCheck(){
	  //아이디 중복화인
	  
	  //새창만들기 (팝업창)
	  //window.open("파일명","새창이름","다양한옵션");
	  window.open("idCheckForm.jsp","idwin","width=400 height=350")
  }//idCheck()
  
  function emailCheck(){
	  //이메일 중복화인
	  
	  //새창만들기 (팝업창)
	  //window.open("파일명","새창이름","다양한옵션");
	  window.open("emailCheckForm.jsp","emailwin","width=400 height=350")
}//idCheck()

  function idSearch(){
	  window.open("idSearch.jsp","searchlwin","width=500 height=500")
  }
  function pwSearch(){
	  window.open("pwSearch.jsp","searchlwin","width=500 height=500")
  }
  function Close(){
	  window.close();
  }
  
function blankCheck(p){
	var id=p.id.value;
	id=id.trim();
	if(id.length<4){
		alert("아이디는 4글자 이상 입력해 주세요");
		return false;
	}//if end
	return true;
} //end
  
function eblankCheck(p){
	var email=p.email.value;
	email=email.trim();
	if(email.length<10){
		alert("이메일을 10글자 이상 입력해 주십쇼");
		return false;
	}//if end
	return true;
} //end
function apply(id){
	//중복확인 id를 부모창에 적용
	//부모창 opener
	opener.document.regForm.id.value=id;
	window.close();
}//apply() end

function applye(email){
	//중복확인 id를 부모창에 적용
	//부모창 opener
	opener.document.regForm.email.value=email;
	window.close();
}//apply() end


function memberCheck(f){
	//회원가입 유효성 검사
	//1) 아이디 4~10글자 이내인지?
		var id=f.id.value;
		id=id.trim();
		if(id.length<4||id.length>10){
			alert("아이디 4~10글자 입력해 주세요");
			return false;
		}
		
	//2) 비밀번호 5~10글자 이내인지?
		var passwd=f.passwd.value;
		passwd=passwd.trim();
		if(passwd.length<5||passwd.length>10){
			alert("비밀번호 5~10글자 입력해 주세요");
			return false;
		}
	//3) 비밀번호와 비밀번호확인이 서로 일치하는지?
		var repasswd=f.repasswd.value;
		repasswd=repasswd.trim();
		if(passwd !=repasswd){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	//4) 이름 2~20 글자 이내인지?
		var mname=f.mname.value;
		mname=mname.trim();
		if(mname.length<2||mname.length>20){
			alert("이름을 2~20글자 입력해 주세요");
			return false;
		}
	//5) 이메일에 @ 문자가 있는지?
		var email=f.email.value;
		email=email.trim();
		
		
	    if(email.indexOf("@")==-1){
	    	alert("이메일 주소가 틀렸습니다.");
	    	return false;
	    	}
		
			//6) 직업을 선택했는지?
			var job=f.job.value;
			if(job=="0"){
				alert("직업을 선택해 주세요");
				return false;
			}//if end
			return true;//유효성 검사를 모두 통과했으므로
							//member.Proc.jsp 로 전송됨
	
}//memberCheck end

function pwcheck(f){
	//회원 정보 수정시 패스워드 체크
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd.length<5||passwd.length>10){
		alert("비밀번호 5~10글자 입력해 주세요");
		return false;
	}
	return true;
}//pwcheck end

function memberUpdatCheck(f){
	//회원가입 유효성 검사
	
	// 비밀번호 5~10글자 이내인지?
		var passwd=f.passwd.value;
		passwd=passwd.trim();
		if(passwd.length<5||passwd.length>10){
			alert("비밀번호 5~10글자 입력해 주세요");
			return false;
		}
	//1)기존 비밀번호와 새 비밀번호가 다른지	
		if(passwd==newpasswd){
			alert("기존 비밀번호와 다르게 입력해 주세요");
			return false;
		}
	//2)새 비밀번호와 새 비밀번호확인이 서로 일치하는지?
		var newpasswd=f.newpasswd.value;
		newpasswd=newpasswd.trim();
		var repasswd=f.repasswd.value;
		repasswd=repasswd.trim();
		if(newpasswd !=repasswd){
			alert("비밀번호가 일치하지 않습니다.");
			return false;
		}
	
	//3) 직업을 선택했는지?
	var job=f.job.value;
	if(job=="0"){
		alert("직업을 선택해 주세요");
		return false;
	}//if end
	return true;//유효성 검사를 모두 통과했으므로
					//member.Proc.jsp 로 전송됨
	
}//memberUpdatCheck end

function Send(f){
	  if(f.agree1.checked==true && f.agree2.checked==true&& f.agree3.checked==true){
		  return true;
	  }else{
		  alert("모든 약관 동의 후 회원탈퇴가 가능합니다");
		  return false;
	  }
	
}//Send end

function pdsCheck(f){
	//포토갤러리 유효성 검사
	//1) 이름
	var wname=f.wname.value;
	wname=wname.trim();
	if(wname<2||wname>10){
		alert("이름을 2~10글자로 입력하세요");
		f.wname.focus();
		return false;
	}
	//2) 제목
	var subject=f.subject.value;
	subject=subject.trim();
	if(subject<2||subject>20){
		alert("제목을 2~20글자 입력하세요");
		f.subject.focus();
		return false;
	}
	//3) 비밀번호는 4~15글자 이내인지?
	/*
	var passwd=f.passwd.value;
	passwd=passwd.trim();
	if(passwd<4||passwd>10){
		alert("비밀번호를 4~10 글자 입력하세요");
		f.passwd.focus();
		return false;
	}
	*/
	//4) 첨부파일
	var filename=f.filename.value;
	//alert(filename);
	filename= filename.trim();
	if(filename.length==0){//파일 선택을 하지 않았을 때
		alert("첨부파일 선택해라 어~!!?");
		return false;
	}else{
		//alert(filename);
		//alert(filename.lastIndexOf("."));
		
		//문제) 파일 타입을 출력하시오
		//마지막 .의 순서
		var dot=filename.lastIndexOf(".");
		//마지막 . 이후 문자열만 자르기
		var ext=filename.substr(dot+1);
		//전부 소문자로 치환
		ext=ext.toLowerCase();// 전부소문자로
		//alert(ext);
		
		if(ext=="png"|| ext=="jpg" || ext=="gif"){
			return true;
		}else{
			alert("이미지 파일만 넣으라고!!");
			return false;
		}//if end
		}// if end 

}//pdsCheck end

function noticeCheck(f){
	var subject=f.subject.value;
	subject=subject.trim();
	if(subject.length<2){
		alert("제목을 2글자 이상 입력해 주세요");
		return false;
	}//if end
	
	var content=f.content.value;
	content=content.trim();
	if(content.length<2){
		alert("글을 2글자 이상 입력해 주세요");
		return false;
	}//if end
	
	return true;
}//end


