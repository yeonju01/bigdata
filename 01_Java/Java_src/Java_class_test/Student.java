package com.lect.ex8_student;

public class Student {
	private int num;
	private String name;
	private int kor;
	private int eng;
	private int mat;
	private int tot;
	private double avg;
	public static int count;
	// new Student("정우성",90,90,90)
	public Student() {}
	public Student(String name, int kor, int eng, int mat) {
		num = ++count;
		this.name = name; 
		this.kor = kor;
		this.eng = eng;   
		this.mat = mat;
		tot = kor+eng+mat;
		avg = tot/3.0;
	}

	public void infoPrint() {
		System.out.printf("%d \t %s \t %d \t %d \t %d \t %d \t %.1f\n",
	             num, name, kor,  eng,   mat,  tot,  avg);
	}
	public String infoString() {
		String result = num +"\t" + name +"\t" +kor +"\t"+eng+"\t"+mat+"\t"+tot+"\t"+avg;
		result = String.format("%d \t %s \t %d \t %d \t %d \t %d \t %.1f\n",
				num, name, kor,  eng,   mat,  tot,  avg);
		return result;
	}
	// getter 만 추가 (총점 누적시 필요)
	public String getName() {
		return name;
	}
	public int getKor() {
		return kor;
	}
	public int getEng() {
		return eng;
	}
	public int getMat() {
		return mat;
	}
	public int getTot() {
		return tot;
	}
	public double getAvg() {
		return avg;
	}
}
