package cn.edu.zhku.she.Util;

import java.awt.Color;  
import java.awt.Font;  
import java.awt.Graphics;  
import java.awt.image.BufferedImage;  
import java.io.IOException;  
import java.io.OutputStream;  
import javax.imageio.ImageIO;

public class CheckedCode {
	/***
	 * 
	 * @param x
	 * @param y
	 * @return x��y֮��������
	 */
	private int rand(int x,int y)
	{
		int randNumber;
		int diff = y - x;
		randNumber = x + (int)(Math.random() * diff + 1 );
		return randNumber;
	}
	/***
	 * 
	 * @param ascii
	 * @return ascii��Ӧ���ַ�
	 */
	private char getChar(int ascii)
	{
		char ch = (char)ascii;
		return ch;
	}
	public String getCheckCode(OutputStream os)
	{
		int width = 120;
		int height = 40;
		int x = 20;
		String checkCode = "";
		//����һ���ض���ʽ��BufferedImage  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        //��ȡͼ��������  
        Graphics g = image.getGraphics(); 
        Color bg = new Color(rand(200,255),rand(200,255),rand(200,255));
        Color pc = new Color(rand(100,200),rand(100,200),rand(100,200));
        //  ���ñ���ɫ
        g.setColor(bg);
        g.fillRect(0, 0, width, height); 
        //  �������4λ��֤��
        g.setFont(new Font("Atlantic Inline", Font.ITALIC, 25)); 
        for( int i = 0; i < 4; i++ )
        {
        	Color fc = new Color(rand(100,200),rand(100,200),rand(100,200));
        	g.setColor(fc);
        	String ch = "";
        	switch(rand(1,3))
        	{
        		case 1:ch = "" + getChar(rand(65,90));break;
        		case 2:ch = "" + getChar(rand(97,122));break;
        		case 3:ch = "" + rand(0,9);break;
        	}
        	g.drawString(ch, x, 25);
        	x += 20;
        	checkCode += ch;
        }
        g.setColor(pc);
        //  ���Ƹ��ŵ�
        for( int i = 0; i < 100; i++ )
        {
        	g.drawOval(rand(0,width-1),rand(0,height-1), 1, 1);  
        }
        //  ���Ƹ�����
        for( int i = 0; i < 5; i++ )
        {
        	g.drawLine(rand(0,width/2),rand(0,height),rand(width/2,width),rand(0,height));
        }
        //�ͷ�ͼ��������  
        g.dispose();  
        try {  
            ImageIO.write(image, "png", os);  
        } catch (IOException e) {  
            return "";  
        }  
		return checkCode;
	}
}
