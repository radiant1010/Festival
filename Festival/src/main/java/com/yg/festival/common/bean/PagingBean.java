package com.yg.festival.common.bean;

public class PagingBean extends CommonBean {

	/** 한페이지당 보여지는 레코드의 갯수 **/
	public static final int COUNT_PER_RECORD = 10;
	
	/** 페이징 그룹당 보여지는 페이지의 갯수 **/
	public static final int COUNT_PER_PAGE_GROUP = 5;
	
	/** 요청 페이지 번호 **/
	private int pageNo;
	/** 전체 레코드 갯수 **/
	private int totalRecordCount;
	
	/** 전체 페이지 갯수 **/
	private int totalPageCount;
	/** DB시작 로우 **/
	private int startRow;
	/** DB끝 로우 **/
	private int endRow;
	
	/** 전체 페이지의 그룹갯수 */
	private int totalGroupCount;
	/** 현재 페이지의 그룹번호(그룹번호는 1부터 시작) */
	private int groupNo;
	
	/** 시작 페이지 번호 **/
	private int pageStartNo;
	/** 끝 페이지 번호 **/
	private int pageEndNo;
	
	/** 검색타입 ex)제목, 내용, 제목+내용 **/
	private String searchType;
	/** 검색어 **/
	private String searchText;
	
	/**
	 * 화면에 표시할 페이징 변수정보를 계산한다.
	 * @param totalRecordCount 전체 레코드 갯수
	 */
	public void calcPage(int totalRecordCount) {
		//페이지 디폴트값은 무조건 1 이다.
		this.pageNo = pageNo == 0 ? 1 : pageNo; 
		this.totalRecordCount = totalRecordCount;
		
		//페이지 갯수 계산
		totalPageCount = calcTotalPageCount(this.totalRecordCount, 
											COUNT_PER_RECORD);
		//DB에서 가져올 시작행 번호
		startRow = (pageNo - 1) * COUNT_PER_RECORD;
		//DB에서 가져올 행갯수
		endRow = COUNT_PER_RECORD;
		
		/////////// 그룹 //////////////////////
		//전체 그룹의 갯수
		totalGroupCount = calcTotalPageCount(totalPageCount, 
											COUNT_PER_PAGE_GROUP);
		//현재 페이지의 소속 그룹번호 계산
		groupNo = calcTotalPageCount(pageNo, COUNT_PER_PAGE_GROUP);
		//시작 페이지 번호
		pageStartNo = ((groupNo - 1) * COUNT_PER_PAGE_GROUP) + 1;
		//끝 페이지 번호
		pageEndNo = groupNo * COUNT_PER_PAGE_GROUP;
		
		//마지막 페이지번호보다 끝페이지 번호가 크다면 
		//더이상 페이지가 없는 것이기 떄문에 전체 페이지 갯수를 대입한다.
		if(pageEndNo >= totalPageCount) {
			pageEndNo = totalPageCount;
		}
	}
	
	/**
	 * 전체 레코드 갯수에 대한 화면에 표시할 페이지수 계산
	 * @param totalRecordCount 전체 레코드 갯수
	 * @param countPerPageGroup 한화면에 표시할 페이지그룹 갯수
	 * @return
	 */
	public int calcTotalPageCount(int totalRecordCount, int countPerPageGroup) {
		int totalPageCount = 0;
		if(totalRecordCount > 0) {
			totalPageCount = totalRecordCount / countPerPageGroup;
			if( (totalRecordCount % countPerPageGroup)  > 0 ) {
				totalPageCount += 1;
			}
		}
		return totalPageCount;
	}

	
	
	public String getSearchType() {
		return searchType;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getPageStartNo() {
		return pageStartNo;
	}

	public int getPageEndNo() {
		return pageEndNo;
	}

	public void setPageStartNo(int pageStartNo) {
		this.pageStartNo = pageStartNo;
	}

	public void setPageEndNo(int pageEndNo) {
		this.pageEndNo = pageEndNo;
	}

	public int getTotalGroupCount() {
		return totalGroupCount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setTotalGroupCount(int totalGroupCount) {
		this.totalGroupCount = totalGroupCount;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public int getTotalRecordCount() {
		return totalRecordCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public int getStartRow() {
		return startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setPageNo(String pageNo) {
		
		this.pageNo = (pageNo == null || pageNo.length() == 0 ? 1 : new Integer(pageNo) );
	}

	public void setTotalRecordCount(int totalRecordCount) {
		this.totalRecordCount = totalRecordCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	
}
