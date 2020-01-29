package net.notice;

public class NoticeDTO {

	private int noticeno;
	private String subject;
	private String content;
	private String regdt;
	private String conf;
	private int readcnt;
	private String id;
	private String reple;
	private String mlevel;
	private int resno;
	
	
	
	public NoticeDTO() {}
	public int getNoticeno() {
		return noticeno;
	}
	public void setNoticeno(int noticeno) {
		this.noticeno = noticeno;
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
	public String getRegdt() {
		return regdt;
	}
	public void setRegdt(String regdt) {
		this.regdt = regdt;
	}
	public String getConf() {
		return conf;
	}
	public void setConf(String conf) {
		this.conf = conf;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	
	public String getReple() {
		return reple;
	}
	public void setReple(String reple) {
		this.reple = reple;
	}
	
	
	public String getMlevel() {
		return mlevel;
	}
	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	
	public int getResno() {
		return resno;
	}
	public void setResno(int resno) {
		this.resno = resno;
	}
	@Override
	public String toString() {
		return "NoticeDTO [noticeno=" + noticeno + ", subject=" + subject
				+ ", content=" + content + ", regdt=" + regdt + ", conf="
				+ conf + ", readcnt=" + readcnt + ", id=" + id + ", reple="
				+ reple + ", mlevel=" + mlevel + ", resno=" + resno + "]";
	}
	
	
	
	
	
	
	
	
	
}//class end