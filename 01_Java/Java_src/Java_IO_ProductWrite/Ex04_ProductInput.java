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
			System.out.println("재고 데이터는 다음과 같습니다");
		} finally {
			try {
				if(dis!=null) dis.close();
				if(fis!=null) fis.close();
			}catch(Exception e2) { }
		}
		if(products.isEmpty()) {
			System.out.println("재고가 없습니다");
		}else {
			System.out.println("물건명\t가격\t재고갯수");
			for(Product product : products) {
				System.out.println(product);
			}
			System.out.println("이상 "+products.size()+"개 재고 상품 입력됨");
		}//if
	}
}
