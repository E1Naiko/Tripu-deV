package testGUI;

import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.*;

public class GUI implements ActionListener{
	private int count = 0;
	private JFrame frame;
	private JButton button;
	private JLabel label;
	private JPanel panel;

	public GUI() {
		frame = new JFrame();
		
		button = new JButton("Click Me");
		button.addActionListener(this);
		
		label = new JLabel("Number of Clicks: 0");
		
		panel = new JPanel();
		
		panel.setBorder(BorderFactory.createEmptyBorder());
		panel.setLayout(new GridLayout(0, 1));
		panel.add(button);
		panel.add(label);
		
		frame.add(panel, BorderLayout.CENTER);
		frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frame.setTitle("Our GUI");
		frame.pack();
		frame.setVisible(true);
	}
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		new GUI();
		
	}
	
	@Override
	public void actionPerformed(ActionEvent e) {
		count++;
		label.setText("Number of Clicks " + count);
	}

}
