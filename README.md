# Taobao
Java Web final exam project.
工程：需要在MyEclipse中Import导入Taobao文件夹下的JDWeb工程。
数据库：需装入Taobao文件夹下数据库文件“TAOBAO 20170528 1102.sql”文件到你的个人数据库，登录名“root”，密码为“123456”。如果需要修改，请到路径Taobao\JDWeb\src\cn\edu\zhku\she\Util下，编辑DBUtil.java文件，修改DBUtil()方法中的username和password值。
Tomcat配置：需要在tomcat服务器的conf文件夹下，编辑server.xml文件，找到
<Connector connectionTimeout="20000" port="8080" protocol="HTTP/1.1"
redirectPort="8443" URIEncoding="UTF-8"/>
添加上URIEncoding="UTF-8"，保存，将Tomcat的URI编码设置为utf-8，否则上传含有中文的图片时，会导致无法解析图片路径。
文件：请确保Tomcat根目录的webapps中的JDWeb应用目录包含uploadFile文件夹，在uploadFile文件夹下包含product、shop和user三个文件夹，用于存放上传的图片。
系统导航URL：http://localhost:8080/JDWeb/mainPage.html。
最佳分辨率：1366×768
用户测试帐号：
用户名she1383  密码123456
用户名she1234  密码123456
手机18924553452  密码123456
平台管理页面URL：http://localhost:8080/JDWeb/Admin/managerLogin.html。
管理员帐号：
登录名admin	密码123456
说明：使用该系统前请确保浏览器开启了cookie功能；该系统中商品实体的图片均来自与淘宝网，包括界面均模仿淘宝网制作，仅供学习，请勿用于商业用途，转载需标明出处。
cn.edu.zhku.jsj144.she  2017-05-30
