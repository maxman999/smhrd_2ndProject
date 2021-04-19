package com.model;

public class DiaryDTO {
	
	private int num;
	private String id;
	private String img;
	private String day;
	private String title;
	private String content;

	public DiaryDTO(String id, String img, String day, String title, String content) {
		this.id = id;
		this.img = img;
		this.day = day;
		this.title = title;
		this.content = content;
	}

	public DiaryDTO(String img, String day, String title, String content) {
		
		this.img = img;
		this.day = day;
		this.title = title;
		this.content = content;
		
	}

	public DiaryDTO(int num, String id, String img, String day, String title, String content) {
		this.num = num;
		this.id = id;
		this.img = img;
		this.day = day;
		this.title = title;
		this.content = content;
	}
	
	

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
