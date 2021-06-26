package com.lect.ex09_test;

public class Person {
	private String id;
	private String name;
	private String ban;
	public Person(String id, String name, String ban) {
		this.id = id;
		this.name = name;
		this.ban = ban;
	}
	public void introId() {
		System.out.print("(ID)"+id+"\t");
	}
	public void introName() {
		System.out.print("(¿Ã∏ß)"+name+"\t");
	}
	public void introBan() {
		System.out.print("(π›)"+ban+"\n");
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBan() {
		return ban;
	}
	public void setBan(String ban) {
		this.ban = ban;
	}
}
