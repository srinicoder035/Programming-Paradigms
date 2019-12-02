import java.util.*;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
class Frame1 
{
	JFrame f1 = new JFrame("LOGIN FRAME");
	JLabel l = new JLabel("ENTER YOUR ATM PIN");
	JTextField t = new JTextField();
	Frame1()
	{
		f1.setSize(300,300);
		l.setBounds(100,50,150,30);
		t.setBounds(100,100,100,30);
		f1.add(l);
		f1.add(t);
		f1.setLayout(null);
		f1.setVisible(true);
		t.addActionListener(new ActionListener()
		{
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showMessageDialog(f1,"Hello, Welcome ");
			}
		}
		);
	}
}
class atm
{
	public static void main(String[] args)
	{
		Frame1 f = new Frame1();
	}
} 
