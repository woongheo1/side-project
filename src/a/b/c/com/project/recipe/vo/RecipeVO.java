package a.b.c.com.project.recipe.vo;

public class RecipeVO {
	private String rnum;
	private String rtitle;
	private String rcontent;
	private String rcategory;
	private String rphoto;
	private String insertdate;
	private String updatedate;
	private String mmanager;
	private String deletyn;
	
	/*
	레시피번호
	레시피제목
	레시피내용
	레시피카테고리
	레시피사진
	작성일
	수정일
	관리자여부
	삭제여부
	*/
	
	// search 변수
	private String keyword;			// 검색어
	private String searchFilter;	// 검색조건
	private String startDate;		// 검색기간 시작일
	private String endDate;			// 검색기간 종료일
		
	// 페이징 이동 필드
	private String pageSize;
	private String groupSize;
	private String curPage;
	private String totalCount;
	
	public RecipeVO() {
		
	}
	
	public RecipeVO(String rnum, String rtitle, String rcontent, String rcategory, String rphoto, String insertdate,
			String updatedate, String mmanager, String deletyn, String keyword, String searchFilter, String startDate,
			String endDate, String pageSize, String groupSize, String curPage, String totalCount) {

		this.rnum = rnum;
		this.rtitle = rtitle;
		this.rcontent = rcontent;
		this.rcategory = rcategory;
		this.rphoto = rphoto;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.mmanager = mmanager;
		this.deletyn = deletyn;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.startDate = startDate;
		this.endDate = endDate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}
	
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getRtitle() {
		return rtitle;
	}
	public void setRtitle(String rtitle) {
		this.rtitle = rtitle;
	}
	public String getRcontent() {
		return rcontent;
	}
	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}
	public String getRcategory() {
		return rcategory;
	}
	public void setRcategory(String rcategory) {
		this.rcategory = rcategory;
	}
	public String getRphoto() {
		return rphoto;
	}
	public void setRphoto(String rphoto) {
		this.rphoto = rphoto;
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
	public String getMmanager() {
		return mmanager;
	}
	public void setMmanager(String mmanager) {
		this.mmanager = mmanager;
	}
	public String getDeletyn() {
		return deletyn;
	}
	public void setDeletyn(String deletyn) {
		this.deletyn = deletyn;
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
	
	
}
