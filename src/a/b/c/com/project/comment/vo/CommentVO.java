package a.b.c.com.project.comment.vo;

public class CommentVO {
		private String mnick;
		private String mnum;
		private String pnum;
		private String cnum;
		private String ccontent;
		private String clikes;
		private String deleteyn;
		private String insertdate;
		private String updatedate;

	   // 생성자 
	   public CommentVO() {
	   
	   }

	   public CommentVO(String mnick,  String mnum, String pnum, String cnum, String ccontent, String clikes,
	         String deleteyn, String insertdate, String updatedate) {
	      

	      this.mnum = mnick;
	      this.mnum = mnum;
	      this.pnum = pnum;
	      this.cnum = cnum;
	      this.ccontent = ccontent;
	      this.clikes = clikes;
	      this.deleteyn = deleteyn;
	      this.insertdate = insertdate;
	      this.updatedate = updatedate;
	   }

	   
	   
	   
	   public String getMnick() {
	      return mnick;
	   }

	   public String getMnum() {
	      return mnum;
	   }


	   public String getPnum() {
	      return pnum;
	   }

	   
	   public String getCnum() {
	      return cnum;
	   }

	   
	   public String getCcontent() {
	      return ccontent;
	   }

	   
	   public String getClikes() {
	      return clikes;
	   }


	   public String getDeleteyn() {
	      return deleteyn;
	   }


	   public String getInsertdate() {
	      return insertdate;
	   }

	   
	   public String getUpdatedate() {
	      return updatedate;
	   }



	   
	   public void setMnick(String mnick) {
	      this.mnick = mnick;
	   }
	   
	   public void setMnum(String mnum) {
	      this.mnum = mnum;
	   }

	   
	   public void setPnum(String pnum) {
	      this.pnum = pnum;
	   }

	   
	   public void setCnum(String cnum) {
	      this.cnum = cnum;
	   }


	   public void setCcontent(String ccontent) {
	      this.ccontent = ccontent;
	   }

	   
	   public void setClikes(String clikes) {
	      this.clikes = clikes;
	   }

	   
	   public void setDeleteyn(String deleteyn) {
	      this.deleteyn = deleteyn;
	   }

	   
	   public void setInsertdate(String insertdate) {
	      this.insertdate = insertdate;
	   }

	   
	   public void setUpdatedate(String updatedate) {
	      this.updatedate = updatedate;
	   }

	   
	   
	}
