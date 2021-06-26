package com.lect.ex8_student;

public class StudentMain {
	public static void main(String[] args) {
		Student[] student = {new Student("���켺", 90, 80, 95),
							new Student("���ϴ�", 100, 80, 95),
							new Student("Ȳ����", 95, 80, 90),
							new Student("������", 95, 90, 99),
							new Student("������", 90, 90, 90)};
		String[] title = {"��ȣ","�̸�","����","����","����","����","���"};
		// �� ���� �������� ����(0:�����, 1 index:�����, 2:���д���, 3:��������, 4:��մ���)
		// �迭 tot�� avg�� 0�̳� 0.0���� �ʱ�ȭ
		int[] tot = new int[5]; 
		int[] avg = new int[5]; // �� ���� ��յ� ����
		System.out.println("�������������������������������������������������������");
		System.out.println("\t\t\t����ǥ");
		System.out.println("------------------------------------------------------");
//		for(int i=0 ; i<title.length ; i++) {
//			System.out.print("\t "+title[i]);
//		}
		for(String t : title) {
			System.out.print(t+"\t");
		}
		System.out.println();
		System.out.println("------------------------------------------------------");

		for(Student s : student) {
			s.infoPrint();
			// �� ���� �������� ����(0:�����, 1 index:�����, 2:���д���, 3:��������, 4:��մ���)
			tot[0] += s.getKor(); //tot[0] = tot[0] + s.getKor();
			tot[1] += s.getEng();
			tot[2] += s.getMat();
			tot[3] += s.getTot();
			tot[4] += s.getAvg();
			
		}
		System.out.println("------------------------------------------------------");
		System.out.print("����\t");
		for(int idx=0 ; idx<avg.length ; idx++) { // ��յ� ���
			avg[idx] = tot[idx] / student.length;
			System.out.print("\t "+tot[idx]);
		}
		System.out.print("\n���\t");
		for(double a : avg) {
			System.out.print("\t"+a);
		}
		System.out.println();
		System.out.println("�������������������������������������������������������");
		
	}
}
