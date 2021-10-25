package com.springapp.uglys.user.vo;

import org.springframework.stereotype.Component;

@Component("userVO")
public class UserVO {

	private String user_id;				// 아이디
	private String user_password;		// 비밀번호
	private String user_email;			// 이메일
	private String user_name;			// 이름
	private String user_birth;			// 생년월일
	private String user_phone;			// 전화번호
	private String user_basic_address;	// 기본주소
	private String user_detail_address;	// 상세주소
	private String user_img;			// 이미지
	private String user_admin;				// 관리자,사용자 선택
	
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_password() {
		return user_password;
	}
	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_birth() {
		return user_birth;
	}
	public void setUser_birth(String user_birth) {
		this.user_birth = user_birth;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_basic_address() {
		return user_basic_address;
	}
	public void setUser_basic_address(String user_basic_address) {
		this.user_basic_address = user_basic_address;
	}
	public String getUser_detail_address() {
		return user_detail_address;
	}
	public void setUser_detail_address(String user_detail_address) {
		this.user_detail_address = user_detail_address;
	}
	public String getUser_img() {
		return user_img;
	}
	public void setUser_img(String user_img) {
		this.user_img = user_img;
	}
	public String getUser_admin() {
		return user_admin;
	}
	public void setUser_admin(String user_admin) {
		this.user_admin = user_admin;
	}
	
	@Override
	public String toString() {
		return "UserVO [user_id=" + user_id + ", user_password=" + user_password + ", user_email=" + user_email
				+ ", user_name=" + user_name + ", user_birth=" + user_birth + ", user_phone=" + user_phone
				+ ", user_basic_address=" + user_basic_address + ", user_detail_address=" + user_detail_address
				+ ", user_img=" + user_img + ", user_admin=" + user_admin + "]";
	}
	
	
	
	
	
}


