package com.lect.ex02_date;
/*	2021.05.24, 부서명, Gil-Dong Hong
 *  new Sawon("a01","홍길동",Part.COMPUTER)
데이터 : 사번, 이름, 부서(COMPUTER, PLANNING, DESIGN, ACCOUNTING, HUMANRESOURCES), 입사일
생성자 : 사번, 이름, 부서, 입사일은 객체생성 당일로 합니다
메소드 : infoString()의 실행결과는 다음과 같습니다
 */

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.GregorianCalendar;

public class Sawon {
	private String num;
	private String name;
	private String part;
	private Date enterDate;
	public Sawon(String num, String name, String part) {
		this.num = num;
		this.name = name;
		this.part = part;
		enterDate = new Date(); // 객체가 생성되는 시점을 enterDate에 넣음
	}
	public Sawon(String num, String name, String part, int y, int m, int d) {
		this.num = num;
		this.name = name;
		this.part = part;
		enterDate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); // GregorianCalendar형이 아니므로 get
	}
	@Override
	public String toString() { // 2019년2월2일
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년M월d일");
		String temp = sdf.format(enterDate);
		if(part.length()>8) { // part가 8글자보다 짧은 경우 탭2번하도록
		return "[사번]" + num + "\t[이름]" + name + "\t[부서]" + part + "\t[입사일]" + temp;
		}else {
			return "[사번]" + num + "\t[이름]" + name + "\t[부서]" + part + "\t\t[입사일]" + temp;
		}
	}
}
