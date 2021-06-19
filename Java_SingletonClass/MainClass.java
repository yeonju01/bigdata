package com.me.singletonClass;

public class MainClass {
	public static void main(String[] args) {
		FirstClass firstObj = new FirstClass();
		SecondClass secondObj = new SecondClass();
		SingletonClass singObj = SingletonClass.getSingletonClass();
		System.out.println("main()메소드에서 singleton객체");
		System.out.println(singObj.getI());
	}
}
