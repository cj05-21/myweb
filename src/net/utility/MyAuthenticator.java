package net.utility;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MyAuthenticator extends Authenticator {
	//사용하고자 하는 메일서버에서 인증받은 계정 비번
	private PasswordAuthentication pa;
	
	public MyAuthenticator(){
		pa=new PasswordAuthentication("soldesk@pretyimo.cafe24.com","soldesk6901");
	
		
	}
	
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		// TODO Auto-generated method stub
		return pa;
	}
	
}//class end
