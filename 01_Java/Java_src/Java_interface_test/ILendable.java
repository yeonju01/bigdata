package com.lect.ex11_quiz;

public interface ILendable {
	public byte STATE_BORROWED = 1;
	public byte STATE_NORMAL = 0;
	public void checkOut(String borrower, String checkOutDate);
	public void checkIn();
	public String toString();
}
