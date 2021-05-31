package com.lect.ex2_swing;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileNotFoundException;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.ArrayList;

import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class MyFrame extends JFrame implements ActionListener {
	private Container contenPane;
	private JPanel jp;
	private JPanel jp2;
	private JTextField jtxtName, jtxtTel, jtxtAge;
	private ImageIcon icon1;
	private ImageIcon icon2;
	private JButton btnIn;
	private JButton btnOut;
	private JTextArea jta;
	private JScrollPane scrollpane;
	private ArrayList<Person> persons;
	public MyFrame(String title) {
		super(title);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		contenPane = getContentPane();
		jp = new JPanel(new GridLayout(3 ,2));
		jp2 = new JPanel(new GridLayout(1, 2));
		jtxtName = new JTextField();
		jtxtTel = new JTextField();
		jtxtAge = new JTextField();
		icon1 = new ImageIcon("icon/join.png");
		btnIn = new JButton("입력", icon1);
		jp2.add(btnIn);
		icon2 = new ImageIcon("icon/output.png");
		btnOut = new JButton("출력", icon2);
		jp2.add(btnOut);
		jta = new JTextArea(5, 30);
		scrollpane =new JScrollPane(jta);
		persons = new ArrayList<Person>();
		jp.add(new JLabel("이름", (int)CENTER_ALIGNMENT));
		jp.add(jtxtName);
		jp.add(new JLabel("전화", (int)CENTER_ALIGNMENT));
		jp.add(jtxtTel);
		jp.add(new JLabel("나이", (int)CENTER_ALIGNMENT));
		jp.add(jtxtAge);
		contenPane.add(jp, BorderLayout.NORTH);
		contenPane.add(jp2, BorderLayout.CENTER);
		contenPane.add(scrollpane, BorderLayout.SOUTH);
		setVisible(true);
		setBounds(100, 100, 400, 300);
		btnIn.addActionListener(this);
		btnOut.addActionListener(this);
	}
	public MyFrame() {
		this("");
	}
	@Override
	public void actionPerformed(ActionEvent e) {
		Writer writer = null;
		try {
			writer = new FileWriter("txtFile/person.txt", true);
			if(e.getSource() == btnIn) {
				String name = jtxtName.getText().trim();
				String tel = jtxtTel.getText().trim();
				if(name.equals("") || tel.equals("")) {
					System.out.println("이름과 전화번호는 필수 입력사항입니다");
					return;
				}
				if(tel.indexOf("-") == tel.lastIndexOf("-") || tel.indexOf("-")<2) {
					System.out.println("전화번호 포맷이 맞지 않습니다");
					return;
				}
				int age = 0;
				try {
					age = Integer.parseInt(jtxtAge.getText());
					if(age<0 || age>=150) {
						System.out.println("유효하지 않은 나이는 0살로 표시됩니다");
						age = 0;
					}
				}catch (NumberFormatException e1) {
					System.out.println("유효하지 않은 나이는 0살로 표시됩니다");
				}
				Person person = new Person(name, tel, age);
				jta.append(person.toString());
				persons.add(person);
				jtxtName.setText("");
				jtxtTel.setText("");
				jtxtAge.setText("");
			}
			if(e.getSource() == btnOut) {
				for(Person p : persons) {
					System.out.print(p);
					writer.write(p.toString());
				}
				System.out.println("저장성공");
			}
		} catch (FileNotFoundException e2) {
			System.out.println(e2.getMessage());
		} catch (IOException e2) {
			System.out.println(e2.getMessage());
		} finally {
			try {
				if(writer!=null) writer.close();
			} catch(Exception ignore) {
				System.out.println(ignore.getMessage());
			}
		}
	}
	public static void main(String[] args) {
		new MyFrame("GUI 예제");
	}
}
