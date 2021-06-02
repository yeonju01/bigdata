package com.lect.ex2_dataInputStreamDataOutputStream;

import java.io.*;
import java.util.ArrayList;

public class Ex04_ProductInput {
	public static void main(String[] args) {
		InputStream fis = null;
		DataInputStream dis = null;
		ArrayList<Product> products = new ArrayList<Product>();
		try {
			fis = new FileInputStream("src/com/lect/ex2_dataInputStreamDataOutputStream/product.dat");
			dis = new DataInputStream(fis);
			while(true) {
				String name = dis.readUTF();
				int price = dis.readInt();
				int ps = dis. readInt();
				products.add(new Product(name, price, ps));
			}
		} catch (FileNotFoundException e) {
			System.out.println(e.getMessage());
		} catch (IOException e) {
			System.out.println(e.getMessage());
			System.out.println("��� �����ʹ� ������ �����ϴ�");
		} finally {
			try {
				if(dis!=null) dis.close();
				if(fis!=null) fis.close();
			}catch(Exception e2) { }
		}
		if(products.isEmpty()) {
			System.out.println("��� �����ϴ�");
		}else {
			System.out.println("���Ǹ�\t����\t�����");
			for(Product product : products) {
				System.out.println(product);
			}
			System.out.println("�̻� "+products.size()+"�� ��� ��ǰ �Էµ�");
		}//if
	}
}
