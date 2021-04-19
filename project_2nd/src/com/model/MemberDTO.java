package com.model;

public class MemberDTO {
	private String user_id;
	private int diary_id;
	private String user_pw;
	private String user_name;
	private int age;
	private String sex;
	private String location;
	private String pregnancy_day;

	// 회원가입 시
	public MemberDTO(String user_id, String user_pw, String user_name, int age, String sex, String location,
			String pregnancy_day) {
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.age = age;
		this.sex = sex;
		this.location = location;
		this.pregnancy_day = pregnancy_day;
	}

	// 로그인 시
	public MemberDTO(String user_id, String user_pw, String user_name, int age){
		this.user_id = user_id;
		this.user_pw = user_pw;
		this.user_name = user_name;
		this.age = age;
	}

	// 회원정보 수정 시
	public MemberDTO(String user_id, String user_name, String user_pw, String location, String pregnancy_day) {
		super();
		this.user_id = user_id;
		this.user_name = user_name;
		this.user_pw = user_pw;
		this.location = location;
		this.pregnancy_day = pregnancy_day;
	}
	
	public MemberDTO(String user_id, String user_pw) {
	      this.user_id = user_id;
	      this.user_pw = user_pw;
	   }

	public String getUser_id() {
		return user_id;
	}


	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public int getDiary_id() {
		return diary_id;
	}

	public void setDiary_id(int diary_id) {
		this.diary_id = diary_id;
	}

	public String getUser_pw() {
		return user_pw;
	}

	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getPregnancy_day() {
		return pregnancy_day;
	}

}
