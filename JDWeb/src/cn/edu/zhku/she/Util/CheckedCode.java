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
	 * @return x到y之间的随机数
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
	 * @return ascii对应的字符
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
		//创建一个特定样式的BufferedImage  
        BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);  
        //获取图形上下文  
        Graphics g = image.getGraphics(); 
        Color bg = new Color(rand(200,255),rand(200,255),rand(200,255));
        Color pc = new Color(rand(100,200),rand(100,200),rand(100,200));
        //  设置背景色
        g.setColor(bg);
        g.fillRect(0, 0, width, height); 
        //  随机产生4位验证码
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
        //  绘制干扰点
        for( int i = 0; i < 100; i++ )
        {
        	g.drawOval(rand(0,width-1),rand(0,height-1), 1, 1);  
        }
        //  绘制干扰线
        for( int i = 0; i < 5; i++ )
        {
        	g.drawLine(rand(0,width/2),rand(0,height),rand(width/2,width),rand(0,height));
        }
        //释放图形上下文  
        g.dispose();  
        try {  
            ImageIO.write(image, "png", os);  
        } catch (IOException e) {  
            return "";  
        }  
		return checkCode;
	}
}
