package com.me.singletonClass;

public class SecondClass {
	public SecondClass() {
		SingletonClass singletonObject = SingletonClass.getSingletonClass();
		System.out.println("SecondClass 객체");
		System.out.println(singletonObject.getI());
	}
}
