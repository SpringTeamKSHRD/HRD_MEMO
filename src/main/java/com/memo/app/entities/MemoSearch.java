package com.memo.app.entities;

public class MemoSearch {
		private int userid;
		private int page;
		private int limit;
		private String column;
		private String domain;
		private String title;
		private String date;
		private Boolean ispublic;
		private String search;
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		public String getColumn() {
			return column;
		}
		public void setColumn(String column) {
			this.column = column;
		}
		public String getSearch() {
			return search;
		}
		public void setSearch(String search) {
			this.search = search;
		}
		public int getPage() {
			return page;
		}
		public void setPage(int page) {
			this.page = page;
		}
		public int getLimit() {
			return limit;
		}
		public void setLimit(int limit) {
			this.limit = limit;
		}
		
		public String getDomain() {
			return domain;
		}
		public void setDomain(String domain) {
			this.domain = domain;
		}
		public String getTitle() {
			return title;
		}
		public void setTitle(String title) {
			this.title = title;
		}
		public String getDate() {
			return date;
		}
		public void setDate(String date) {
			this.date = date;
		}
		
		public Boolean getIspublic() {
			return ispublic;
		}
		public void setIspublic(Boolean ispublic) {
			this.ispublic = ispublic;
		}
		@Override
		public String toString() {
			return "MemoSearch [userid=" + userid + ", page=" + page + ", limit=" + limit + ", column=" + column
					+ ", domain=" + domain + ", title=" + title + ", date=" + date + ", search=" + search + "]";
		}
		
}
