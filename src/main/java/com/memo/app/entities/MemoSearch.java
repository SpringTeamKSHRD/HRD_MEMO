package com.memo.app.entities;

public class MemoSearch {
		private int userid;
		private int page;
		private int limit;
		private String column;
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
		@Override
		public String toString() {
			return "MemoSearch [userid=" + userid + ", page=" + page + ", limit=" + limit + ", column=" + column
					+ ", search=" + search + "]";
		}
		
}
