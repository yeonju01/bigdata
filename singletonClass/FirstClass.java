package com.me.singletonClass;

public class FirstClass {
	public FirstClass() {
		SingletonClass singletonObject = SingletonClass.getSingletonClass();
		System.out.println("FirstClass 객체");
		System.out.println(singletonObject.getI());
		singletonObject.setI(999);
		System.out.println("i = " + singletonObject.getI());
	}
}
