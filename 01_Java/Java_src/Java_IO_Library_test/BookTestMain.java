package com.lect.ex5_lib;

import java.util.InputMismatchException;
import java.util.Scanner;

public class BookTestMain {
	public static void main(String[] args) {
		BookLib[] books = {new BookLib("890��-01", "java", "ȫ�浿"),
				new BookLib("890��-02", "dbms", "ȫ����"),
				new BookLib("890��-03", "html", "�����"),
				new BookLib("890��-04", "hadoop", "�̸���"),
				new BookLib("890��-05", "python", "����")	};
		Scanner sc = new Scanner(System.in);
		int fn; // ��ɹ�ȣ
		int idx; // �����̳� �ݳ��� ó���� å�� index
		String bTitle, borrower;
		do {
			System.out.print("0.��ü ���⿩�� ���� ���� 1.���� 2.�ݳ� �׿�:����");
			try {
				fn = sc.nextInt();
			}catch (InputMismatchException e) {
				System.out.println("0,1,2 �� �� ���ڸ� �Է��Ͻø� ����ǿ�");
				break;
			}
			switch(fn) {
			case 0:
				for(BookLib book : books) {
					System.out.println(book);
				}
				break;
			case 1: 
				//����ó�� 1.å�̸��Է� 2.å�˻� 3.å����Ȯ�� 4.�������Է� 5.����ó�� 
				System.out.print("�����ϰ��� �ϴ� å�̸���?");            // (1)�ܰ�. å�̸��Է�
				sc.nextLine();
				bTitle = sc.nextLine(); // å�̸��� space���� ����.
				for(idx=0 ; idx<books.length ; idx++) {                  // (2)�ܰ�. å�˻�
					if(books[idx].getBookTitle().equals(bTitle)) {
						break;//ã�Ҵ�. �̰� �����ϸ� �ǰڴ�
					}
				}
				// idx<books.length���� ã�Ҵ�. idx==books.length���� ��ã�Ҵ�
				if(idx==books.length) {
					System.out.println("���� �������� ���� �����Դϴ�.");
				}else {
					if(books[idx].getState() == BookLib.STATE_BORROWED) {// (3) �ܰ�. å����Ȯ��
						System.out.println("���� �������� �����Դϴ�.");
					}else {
						System.out.print("�����ڴ�?");// (4)�ܰ�. �������Է�
						borrower = sc.next();
						try {
							books[idx].checkOut(borrower);// (5)����ó��
						}catch(Exception e) {
							System.out.println(e.getMessage());
						}
					}
				}
				break;
			case 2:
				//�ݳ�ó�� 1.å�̸� 2.å�˻� 3.�ݳ�ó��
				System.out.print("�ݳ��� å�̸���?"); //(1)�ܰ�. å�̸�
				sc.nextLine();
				bTitle = sc.nextLine(); // å�̸��� space���� ����.
				for(idx=0 ; idx<books.length ; idx++) { // (2)�ܰ�. å�˻�
					if(books[idx].getBookTitle().equals(bTitle)) {
						break; //ã�Ƽ� ����
					}
				}
				if(idx==books.length) {
					System.out.println("�̵����� �������� ����å�� �ƴմϴ�.");
				}else {
					try {
						books[idx].checkIn(); // (3)�ܰ�. �ݳ�ó��
					}catch (Exception e) {
						System.out.println(e.getMessage());
					}
				}
				break;
			default:
				System.out.println("0,1,2 �� �� ���ڸ� �Է��Ͻø� ����ǿ�");
				//System.exit(0);
			}
		}while(fn==0 || fn==1 || fn==2);
		sc.close();
	}
}