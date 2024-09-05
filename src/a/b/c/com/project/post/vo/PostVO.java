package a.b.c.com.project.post.vo;

public class PostVO {
	private String pnum;
	private String ptitle;
	private String pcontent;
	private String pcategory;
	private String mnick;
	private String plikes;
	private String cnum;
	private String mnum;
	private String pphoto;
	private String bhit;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	/*
		게시글 번호
		게시글 제목
		게시글 내용
		게시글 카테고리
		회원 닉네임
		게시판 좋아요
		댓글번호
		회원번호
		게시글사진
		조회수 
		삭제여부
		가입일
		수정일
	*/
	
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
	
	public PostVO() {
		
	}

	public PostVO(String pnum, String ptitle, String pcontent, String pcategory, String mnick, String plikes,
			String cnum, String mnum, String pphoto, String bhit, String deleteyn, String insertdate, String updatedate,
			String pageSize, String groupSize, String curPage, String totalCount, String keyword, String searchFilter,
			String startDate, String endDate) {

		this.pnum = pnum;
		this.ptitle = ptitle;
		this.pcontent = pcontent;
		this.pcategory = pcategory;
		this.mnick = mnick;
		this.plikes = plikes;
		this.cnum = cnum;
		this.mnum = mnum;
		this.pphoto = pphoto;
		this.bhit = bhit;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getPtitle() {
		return ptitle;
	}

	public void setPtitle(String ptitle) {
		this.ptitle = ptitle;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getPcategory() {
		return pcategory;
	}

	public void setPcategory(String pcategory) {
		this.pcategory = pcategory;
	}

	public String getMnick() {
		return mnick;
	}

	public void setMnick(String mnick) {
		this.mnick = mnick;
	}

	public String getPlikes() {
		return plikes;
	}

	public void setPlikes(String plikes) {
		this.plikes = plikes;
	}

	public String getCnum() {
		return cnum;
	}

	public void setCnum(String cnum) {
		this.cnum = cnum;
	}

	public String getMnum() {
		return mnum;
	}

	public void setMnum(String mnum) {
		this.mnum = mnum;
	}

	public String getPphoto() {
		return pphoto;
	}

	public void setPphoto(String pphoto) {
		this.pphoto = pphoto;
	}

	public String getBhit() {
		return bhit;
	}

	public void setBhit(String bhit) {
		this.bhit = bhit;
	}

	public String getDeletyn() {
		return deleteyn;
	}

	public void setDeletyn(String deletyn) {
		this.deleteyn = deletyn;
	}

	public String getInsertdate() {
		return insertdate;
	}

	public void setInsertdate(String insertdate) {
		this.insertdate = insertdate;
	}

	public String getUpdatedate() {
		return updatedate;
	}

	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getGroupSize() {
		return groupSize;
	}

	public void setGroupSize(String groupSize) {
		this.groupSize = groupSize;
	}

	public String getCurPage() {
		return curPage;
	}

	public void setCurPage(String curPage) {
		this.curPage = curPage;
	}

	public String getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(String totalCount) {
		this.totalCount = totalCount;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearchFilter() {
		return searchFilter;
	}

	public void setSearchFilter(String searchFilter) {
		this.searchFilter = searchFilter;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	

}
