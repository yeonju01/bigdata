package com.lec.ex;
// �Ž����� 2680�� 500, 100, 50, 10¥�� �������� �ٶ�      ��� �־�� �ϳ�?
public class Quiz4 {
	public static void main(String[] args) {
		int money = 2680;
		int[] coinUnit = {500, 100, 50, 10};
		for(int i = 0 ; i<coinUnit.length ; i++) {
			System.out.println(coinUnit[i]+"��¥�� ����"+(money/coinUnit[i])+"��");
			money %= coinUnit[i];
		}
//		for(int coin : coinUnit) {
//			System.out.println(coin+"��¥�� ����"+(money/coin)+"��");
//			money %= coin;
//		}
	}
}