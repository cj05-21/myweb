package net.pds;
public class PdsDTO{
	private int pdsno;        
	private String wname;    
	private String subject;     
	private String regdate;  
	private String passwd;     
	private int readcnt;    
	private String filename; 
	private long filesize;
	private String reple;
	private int resno;
	private String id;
	private String regdt1;
	private String mlevel;
	private String job;
	
	
	public PdsDTO() {}

	public int getPdsno() {
		return pdsno;
	}

	public void setPdsno(int pdsno) {
		this.pdsno = pdsno;
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

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
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

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public long getFilesize() {
		return filesize;
	}

	public void setFilesize(long filesize) {
		this.filesize = filesize;
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

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getRegdt1() {
		return regdt1;
	}

	public void setRegdt1(String regdt1) {
		this.regdt1 = regdt1;
	}

	public String getMlevel() {
		return mlevel;
	}

	public void setMlevel(String mlevel) {
		this.mlevel = mlevel;
	}
	

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	@Override
	public String toString() {
		return "PdsDTO [pdsno=" + pdsno + ", wname=" + wname + ", subject="
				+ subject + ", regdate=" + regdate + ", passwd=" + passwd
				+ ", readcnt=" + readcnt + ", filename=" + filename
				+ ", filesize=" + filesize + ", reple=" + reple + ", resno="
				+ resno + ", id=" + id + ", regdt1=" + regdt1 + ", mlevel="
				+ mlevel + ", job=" + job + "]";
	}

	
	
	
	
	


	 

}//class end

