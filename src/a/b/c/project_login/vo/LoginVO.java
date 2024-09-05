package a.b.c.project_login.vo;

public class LoginVO {
	
	private String mnum;
	private String mmanager;
	private String mnick;
	private String mid;
	private String mpw;	
	private String mphoto;	
	
	public LoginVO() {
		// TODO Auto-generated constructor stubs
	}

	
	public LoginVO(String mnum, String mmanager, String mnick, String mid, String mpw, String mphoto) {
		
		this.mnum = mnum;
		this.mmanager = mmanager;
		this.mnick = mnick;
		this.mid = mid;
		this.mpw = mpw;
		this.mphoto = mphoto;
	}


	

	public LoginVO(String mid, String mpw) {
		// TODO Auto-generated constructor stub
	}


	public String getMnum() {
		return mnum;
	}


	public String getMmanager() {
		return mmanager;
	}

	
	public String getMnick() {
		return mnick;
	}


	public String getMid() {
		return mid;
	}


	public String getMpw() {
		return mpw;
	}


	public String getMphoto() {
		return mphoto;
	}


	public void setMnum(String mnum) {
		this.mnum = mnum;
	}


	public void setMmanager(String mmanager) {
		this.mmanager = mmanager;
	}

	
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}


	public void setMid(String mid) {
		this.mid = mid;
	}

	
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}


	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}

}
