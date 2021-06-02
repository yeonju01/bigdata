package com.lect.ex5_printWriter;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;

public class MainTest {
	public static void main(String[] args) {
		ArrayList<Customer> cus = new ArrayList<Customer>();
		Calendar cal = Calendar.getInstance();
		Scanner scanner = new Scanner(System.in);
		String answer;
		Writer writer = null;
		Reader reader = null;
		try {
			writer = new FileWriter("txtFile/customer.txt", true);
			while(true) {
				System.out.print("ȸ������ �Ͻǰǰ���(Y/N)? ");
				answer = scanner.next();
				if(answer.equalsIgnoreCase("n")) {
					for(Customer c : cus) {
					System.out.println(c);
					}
					break;
				}else if(answer.equalsIgnoreCase("y")) {
					System.out.print("�̸� : ");
					String name = scanner.next();
					writer.write(name+"\t");
					System.out.print("��ȭ��ȣ : ");
					String tel = scanner.next();
					writer.write(tel+"\t");
					System.out.print("���� : ");
					String birth = scanner.next();
					writer.write(birth+"��\t");
					System.out.print("�ּ� : ");
					scanner.nextLine();
					String address = scanner.nextLine();
					writer.write(address+"\n");
					Customer temp = new Customer(name, tel, birth, address);
					cus.add(temp);
				}
			}
			reader = new FileReader("txtFile/customer.txt");
			while(true) {
				int i = reader.read();
				if(i==-1) {
					System.out.println("...����"+cus.size()+"�� ����");
					break;
				}else {
					System.out.print((char)i);
				}
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if(writer!=null) writer.close();
				if(reader!=null) reader.close();
			} catch (Exception e2) {	}
			scanner.close();
		}
	}
}
