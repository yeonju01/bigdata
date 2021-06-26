package com.lect.ex09_test;

public class Main {
	public static void main(String[] args) {
		Person person[] = {new Student("A01","나학생","JAVA반"),
							new Student("A02","홍길동","C++반"),
							new Staff("S01","나직원","교무팀"),
							new Staff("S02","나도요","취업지원팀"),
							new Gangsa("G01","나선생","프로그래밍")
		};
		for(Person p : person) {
			p.introId();
			p.introName();
			p.introBan();
		}
	}
}
