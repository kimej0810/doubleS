package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import daconn.DBconn;

public class UserDAO {
	PreparedStatement pstmt;
	private Connection conn;
	
	public UserDAO(){
		DBconn dbconn = new DBconn();
		this.conn = dbconn.getConnerction();
	}
	//회원가입 담당
	public int userJoin(String userId, String userPwd, String userName, String birthyear, String userEmail, String userPhone){
		int result = 0;
		try{
			String sql="insert into userTable(UIDX,USERID,USERPWD,USERNAME,BIRTHYEAR,USEREMAIL,USERPHONE,WRITEDAY,DELYN) "
					+ "values(uidx_seq.nextval,?,?,?,?,?,?,sysdate,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			pstmt.setString(3, userName);
			pstmt.setString(4, birthyear);
			pstmt.setString(5, userEmail);
			pstmt.setString(6, userPhone);
			pstmt.setString(7, "N");
			result = pstmt.executeUpdate();
			System.out.println("result :"+result);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}
	//로그인 처리 메소드
	public String loginCheck(String userId, String userPwd){
		String result = null;
		String sql = "select uidx,count(*) as result from usertable where USERID = ? and USERPWD = ? group by uidx";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPwd);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				result = rs.getString("uidx");
				result += "/";
				result += rs.getString("result");
				System.out.println("회원이 존재합니다."+result);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return result;
	}
	//회원정보 다 가져오는 메소드
	public UserVO getUserVO(String userId){
		String sql = "select * from usertable where userid = ?";
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()){
				UserVO userInfo = new UserVO();
				userInfo.setUserId(rs.getString("userID"));
				userInfo.setUserPwd(rs.getString("userPwd"));
				userInfo.setUserEmail(rs.getString("userEmail"));
				userInfo.setUserPhone(rs.getString("userPhone"));
				userInfo.setUserName(rs.getString("userName")); 
				return userInfo;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return null;
	}
	//회원 정보 변경 메소드
	public int userUpdate(String userPwd, String userId) {
		String sql = "update usertable set userPwd = ? where userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,userPwd);
			pstmt.setString(2, userId);
			int result = pstmt.executeUpdate();
			return result;
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			try{
				pstmt.close();
				conn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		return -1;
	}
	
}
