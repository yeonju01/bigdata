package com.lect.ex02_date;
/*	2021.05.24, �μ���, Gil-Dong Hong
 *  new Sawon("a01","ȫ�浿",Part.COMPUTER)
������ : ���, �̸�, �μ�(COMPUTER, PLANNING, DESIGN, ACCOUNTING, HUMANRESOURCES), �Ի���
������ : ���, �̸�, �μ�, �Ի����� ��ü���� ���Ϸ� �մϴ�
�޼ҵ� : infoString()�� �������� ������ �����ϴ�
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
		enterDate = new Date(); // ��ü�� �����Ǵ� ������ enterDate�� ����
	}
	public Sawon(String num, String name, String part, int y, int m, int d) {
		this.num = num;
		this.name = name;
		this.part = part;
		enterDate = new Date(new GregorianCalendar(y, m-1, d).getTimeInMillis()); // GregorianCalendar���� �ƴϹǷ� get
	}
	@Override
	public String toString() { // 2019��2��2��
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy��M��d��");
		String temp = sdf.format(enterDate);
		if(part.length()>8) { // part�� 8���ں��� ª�� ��� ��2���ϵ���
		return "[���]" + num + "\t[�̸�]" + name + "\t[�μ�]" + part + "\t[�Ի���]" + temp;
		}else {
			return "[���]" + num + "\t[�̸�]" + name + "\t[�μ�]" + part + "\t\t[�Ի���]" + temp;
		}
	}
}
