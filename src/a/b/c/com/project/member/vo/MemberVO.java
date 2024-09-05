package a.b.c.com.project.member.vo;

import a.b.c.project_login.vo.LoginVO;

public class MemberVO {
	
	private String mnum;
	private String mmanager;
	private String mname;
	private String mnick;
	private String mid;
	private String mpw;
	private String mbirth;
	private String mhp;
	private String memail;
	private String mzonecode;
	private String mroadaddr;
	private String mroaddetail;
	private String mjibunaddr;
	private String mphoto;
	private String deleteyn;
	private String insertdate;
	private String updatedate;
	
	/*
		회원번호
		관리자여부
		회원이름
		회원닉네임
		회원아이디
		회원비밀번호
		회원생년월일
		회원전화번호
		회원이메일
		우편번호
		도로명주소
		상세주소
		지번주소
		회원프로필사진
		삭제여부
		가입일
		수정일
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
		
	public MemberVO() {
		
	}
	
	public MemberVO(String mnum, String mmanager, String mname, String mnick, String mid, String mpw,
			String mbirth, String mhp, String memail, String mzonecode, String mroadaddr, String mroaddetail,
			String mjibunaddr, String mphoto, String deleteyn, String insertdate, String updatedate,
			String keyword, String searchFilter, String startDate, String endDate, String pageSize, String groupSize, String curPage,
			String totalCount) {
		
		this.mnum = mnum;
		this.mmanager = mmanager;
		this.mname = mname;
		this.mnick = mnick;
		this.mid = mid;
		this.mpw = mpw;
		this.mbirth = mbirth;
		this.mhp = mhp;
		this.memail = memail;
		this.mzonecode = mzonecode;
		this.mroadaddr = mroadaddr;
		this.mroaddetail = mroaddetail;
		this.mjibunaddr = mjibunaddr;
		this.mphoto = mphoto;
		this.deleteyn = deleteyn;
		this.insertdate = insertdate;
		this.updatedate = updatedate;
		this.keyword = keyword;
		this.searchFilter = searchFilter;
		this.startDate = startDate;
		this.endDate = endDate;
		this.pageSize = pageSize;
		this.groupSize = groupSize;
		this.curPage = curPage;
		this.totalCount = totalCount;
	}
	
	public String getMnum() {
		return mnum;
	}
	public void setMnum(String mnum) {
		this.mnum = mnum;
	}
	public String getMmanager() {
		return mmanager;
	}
	public void setMmanager(String mmanager) {
		this.mmanager = mmanager;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getMnick() {
		return mnick;
	}
	public void setMnick(String mnick) {
		this.mnick = mnick;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpw() {
		return mpw;
	}
	public void setMpw(String mpw) {
		this.mpw = mpw;
	}
	public String getMbirth() {
		return mbirth;
	}
	public void setMbirth(String mbirth) {
		this.mbirth = mbirth;
	}
	public String getMhp() {
		return mhp;
	}
	public void setMhp(String mhp) {
		this.mhp = mhp;
	}
	public String getMemail() {
		return memail;
	}
	public void setMemail(String memail) {
		this.memail = memail;
	}
	public String getMzonecode() {
		return mzonecode;
	}
	public void setMzonecode(String mzonecode) {
		this.mzonecode = mzonecode;
	}
	public String getMroadaddr() {
		return mroadaddr;
	}
	public void setMroadaddr(String mroadaddr) {
		this.mroadaddr = mroadaddr;
	}
	public String getMroaddetail() {
		return mroaddetail;
	}
	public void setMroaddetail(String mroaddetail) {
		this.mroaddetail = mroaddetail;
	}
	public String getMjibunaddr() {
		return mjibunaddr;
	}
	public void setMjibunaddr(String mjibunaddr) {
		this.mjibunaddr = mjibunaddr;
	}
	public String getMphoto() {
		return mphoto;
	}
	public void setMphoto(String mphoto) {
		this.mphoto = mphoto;
	}
	public String getdeleteyn() {
		return deleteyn;
	}
	public void setdeleteyn(String deleteyn) {
		this.deleteyn = deleteyn;
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
	
	
	// search 변수 setter/getter
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



}
