package com.memo.app.entities;

import java.io.Serializable;

public class Pagination implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private int currentPage;
	private int perPage;
	private Long totalCount;
	private int totalPages;
	
	public Pagination(){
		this(1,9,0L,0);
	}	
	
	public Pagination(int currentPage, int perPage, Long totalCount, int totalPages){
		this.currentPage = currentPage;
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.totalPages = totalPages;
	}
	public int getCurrentPage() {
		return currentPage;
	}

	public int totalPages(){
		return (int) Math.ceil((double)this.totalCount/perPage);
		
	}
	
	public int nextPage(){
		if(this.hasNextPage()){
			return this.currentPage+1;
		}else{
			return this.totalPages();
		}
	}
	
	public int previousPage(){
		if(this.hasPreviousPage()){
			return this.currentPage-1;
		}else{
			return 1;
		}
	}
	
	public boolean hasNextPage(){
		return this.nextPage() <=this.totalPages()? true :false;
	}
	
	public boolean hasPreviousPage(){
		return this.previousPage()>=1 ? true : false;
	}	
	
	public int offset(){
		return (this.currentPage-1)* perPage;
	}
	
	public void setCurrentPage(int currentPage) {
		if(currentPage<=0){
			currentPage = 1;
		}
		this.currentPage = currentPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		if(perPage > 9 ){
			perPage = 9;
		}
		this.perPage = perPage;
	}

	public Long getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Long totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

}
