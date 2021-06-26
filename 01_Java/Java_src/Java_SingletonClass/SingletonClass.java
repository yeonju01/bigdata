package com.me.singletonClass;

public class SingletonClass {
	private static SingletonClass SINGLETON_INSTANCE;
	private int i;
	private SingletonClass() {
		i = 10;
	}
	public static SingletonClass getSingletonClass() {
		if(SINGLETON_INSTANCE==null)
			SINGLETON_INSTANCE = new SingletonClass();
		return SINGLETON_INSTANCE;
	}
	public int getI() {
		return i;
	}
	public void setI(int i) {
		this.i = i;
	}
}