package com.memo.app.entities;

public class MemoFilter {

	private boolean hasPublic;
	
	private String website;
	
	private String title;
	
	private boolean isPublic;

	public boolean isPublic() {
		return isPublic;
	}

	public void setPublic(boolean isPublic) {
		this.isPublic = isPublic;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public boolean getHasPublic() {
		return hasPublic;
	}

	public void setHasPublic(boolean hasPublic) {
		this.hasPublic = hasPublic;
	}
	
}
