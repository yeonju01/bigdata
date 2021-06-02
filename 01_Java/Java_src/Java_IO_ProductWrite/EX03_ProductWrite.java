package com.lect.ex2_dataInputStreamDataOutputStream;

import java.io.DataOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Scanner;

public class EX03_ProductWrite {
	public static void main(String[] args) {
		// n을 입력할 때 까지 재고(상품명, 가격, 재고량)을 파일로 출력
		Scanner scanner = new Scanner(System.in);
		String answer;
		OutputStream fos = null;
		DataOutputStream dos = null;
		try {
			fos = new FileOutputStream("src/com/lect/ex2_dataInputStreamDataOutputStream/product.dat", true);
			dos = new DataOutputStream(fos);
			while(true) {
				System.out.println("입력할 재고가 더 있나요(Y/N)?");
				answer = scanner.next();
				if(answer.equalsIgnoreCase("n")) {
					break;
				}else if(answer.equalsIgnoreCase("y")) {
					System.out.print("입력할 재고 상품명은? ");
					dos.writeUTF(scanner.next());
					System.out.print("입력할 상품의 가격은? ");
					dos.writeInt(scanner.nextInt());
					System.out.print("입력할 상품의 재고량은? ");
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