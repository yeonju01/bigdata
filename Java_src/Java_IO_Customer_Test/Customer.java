package com.lect.ex5_printWriter;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Customer {
	private String name;
	private String tel;
	private String birth;
	private String address;
	private Date enterDate;
	public Customer(String name, String tel, String birth, String address) {
		this.name = name;
		this.tel = tel;
		this.birth = birth;
		this.address = address;
		enterDate = new Date();
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("MM-dd");
		String temp = sdf.format(enterDate);
		if(birth.equals(temp)) {
			return name+"\t"+tel+"\t"+birth+"생\t"+address+"\n생일 축하합니다!";
		}
		return name+"\t"+tel+"\t"+birth+"생\t"+address+"\n";
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
}
