package kr.or.ddit.common.model;

public class PageVo_S {
	private int page;
	private int pageSize;
	private String s_value;
	
	public String getS_value() {
		return s_value;
	}

	public void setS_value(String s_value) {
		this.s_value = s_value;
	}

	public PageVo_S() {}
	
	public PageVo_S(int page, int pageSize, String s_value) {
		this.page = page;
		this.pageSize = pageSize;
		this.s_value = s_value;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
}
