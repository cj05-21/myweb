package net.bbs;
public class BbsDTO{
	//Data Transfer Object 데이터 전송 객체
	private int bbsno;	 
	private String wname;   	
	private String subject;		 
	private String content; 	
	private String passwd;	
	private int readcnt;
	private String regdt;
	private int grpno;
	private int indent;
	private int ansnum; 	 
	private String ip;
	private String reple;
	private int resno;
	private String regdt1;
	private String id;
	private	String	mlevel;
	
	public BbsDTO() {}

	public int getBbsno() {
		return bbsno;
	}

	public void setBbsno(int bbsno) {
		this.bbsno = bbsno;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPasswd() {
		return passwd;
	}

	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}

	public int getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}

	public String getRegdt() {
		return regdt;
	}

	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}

	public int getGrpno() {
		return grpno;
	}

	public void setGrpno(int grpno) {
		this.grpno = grpno;
	}

	public int getIndent() {
		return indent;
	}

	public void setIndent(int indent) {
		this.indent = indent;
	}

	public int getAnsnum() {
		return ansnum;
	}

	public void setAnsnum(int ansnum) {
		this.ansnum = ansnum;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	
	public String getReple() {
		return reple;
	}

	public void setReple(String reple) {
		this.reple = reple;
	}

	
	public int getResno() {
		return resno;
	}

	public void setResno(int resno) {
		this.resno = resno;
	}
	
	
	public String getRegdt1() {
		return regdt1;
	}

	public void setRegdt1(String regdt1) {
		this.regdt1 = regdt1;
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}

	@Override
	public String toString() {
		return "BbsDTO [bbsno=" + bbsno + ", wname=" + wname + ", subject="
				+ subject + ", content=" + content + ", passwd=" + passwd
				+ ", readcnt=" + readcnt + ", regdt=" + regdt + ", grpno="
				+ grpno + ", indent=" + indent + ", ansnum=" + ansnum + ", ip="
				+ ip + ", reple=" + reple + ", resno=" + resno + ", regdt1="
				+ regdt1 + ", id=" + id + ", mlevel=" + mlevel + "]";
	}

}//class end

