package daconn;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconn {
	Connection conn = null;
	String url="jdbc:oracle:thin:@127.0.0.1:1521:xe";
	String id="system";
	String password="1234";
	
	public Connection getConnerction(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, id, password);
			System.out.println("�����ͺ��̽� ���Ӽ���");
		}catch(Exception e){
			e.printStackTrace();
			System.out.println("�����ͺ��̽� ���ӽ���");
		}
		return conn;
	}
}
