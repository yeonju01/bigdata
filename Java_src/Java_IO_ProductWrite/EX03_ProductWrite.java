package com.lect.ex2_dataInputStreamDataOutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Scanner;

public class EX03_ProductWrite {
	public static void main(String[] args) {
		// n�� �Է��� �� ���� ���(��ǰ��, ����, ���)�� ���Ϸ� ���
		Scanner scanner = new Scanner(System.in);
		String answer;
		OutputStream fos = null;
		DataOutputStream dos = null;
		try {
			fos = new FileOutputStream("src/com/lect/ex2_dataInputStreamDataOutputStream/product.dat", true);
			dos = new DataOutputStream(fos);
			while(true) {
				System.out.println("�Է��� ��� �� �ֳ���(Y/N)?");
				answer = scanner.next();
				if(answer.equalsIgnoreCase("n")) {
					break;
				}else if(answer.equalsIgnoreCase("y")) {
					System.out.print("�Է��� ��� ��ǰ����? ");
					dos.writeUTF(scanner.next());
					System.out.print("�Է��� ��ǰ�� ������? ");
					dos.writeInt(scanner.nextInt());
					System.out.print("�Է��� ��ǰ�� �����? ");
					dos.writeInt(scanner.nextInt());
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(dos!=null) dos.close();
				if(fos!=null) fos.close();
			}catch (Exception e2) {
				System.out.println(e2.getMessage());
			}
		}
	}
}