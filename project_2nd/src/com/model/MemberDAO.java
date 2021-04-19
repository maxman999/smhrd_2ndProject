package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;

	private void getConnection() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String dbid = "hr";
			String dbpw = "hr";

			conn = DriverManager.getConnection(url, dbid, dbpw);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	private void close() {
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// 회원가입
	public int join(MemberDTO dto) {
		int cnt = 0;

		getConnection();

		try {
			String sql = "insert into preg_member values(?,?,?,?,?,?,to_date(?,'YYYY-MM-DD'))";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pw());
			psmt.setString(3, dto.getUser_name());
			psmt.setInt(4, dto.getAge());
			psmt.setString(5, dto.getSex());
			psmt.setString(6, dto.getLocation());
			psmt.setString(7, dto.getPregnancy_day());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

// 로그인
	public MemberDTO login(MemberDTO dto) {

		MemberDTO info = null;

		getConnection();

		String sql = "select * from preg_member where user_id=? and user_pw=?";

		try {

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUser_id());
			psmt.setString(2, dto.getUser_pw());
			rs = psmt.executeQuery();

			if (rs.next()) {

				String user_id = rs.getString("user_id");
				String user_pw = rs.getString("user_pw");
				String user_name = rs.getString("user_name");
				int age = rs.getInt("age");
				String sex = rs.getString("sex");
				String location = rs.getString("location");
				String pregnancy_day = rs.getString("pregnancy_day");
				info = new MemberDTO(user_id, user_pw, user_name, age, sex, location, pregnancy_day);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return info;
	}

	public int update(MemberDTO dto) {
		int cnt = 0;
		getConnection();

		String sql = "update preg_member set user_pw=?, user_name =?, location = ?, pregnancy_day = ? where user_id=?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getUser_pw());
			psmt.setString(2, dto.getUser_name());
			psmt.setString(3, dto.getLocation());
			psmt.setString(4, dto.getPregnancy_day());
			psmt.setString(5, dto.getUser_id());
			cnt = psmt.executeUpdate();
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cnt;
	}
	
	public boolean idCheck(String id) {

	      boolean result = false;

	      getConnection();

	      String sql = "select * from preg_member where user_id = ?";
	      try {
	         psmt = conn.prepareStatement(sql);
	         psmt.setString(1, id);
	         rs = psmt.executeQuery();
	         while (rs.next()) {
	            result = true;
	         }
	      } catch (SQLException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      } finally {
	         close();
	      }

	      return result;
	   }
	public ArrayList<String> getdays(String user_id) {
		ArrayList<String> diarydays = new ArrayList<String>(50);
		getConnection();
		String sql = "select diary_date from diary where user_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user_id);
			rs = psmt.executeQuery();
			while(rs.next()) {
				DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //HH:mm:ss(시분초)
				Date getdate = dateFormat.parse(rs.getString(1));
				diarydays.add(dateFormat.format(getdate));
			}
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ParseException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return diarydays;
	}
	
	public boolean loginCheck(MemberDTO dto) {

        boolean result = false;

        getConnection();

        String sql = "select * from preg_member where user_id = ? and user_pw =? ";
        try {
           psmt = conn.prepareStatement(sql);
           psmt.setString(1, dto.getUser_id());
           psmt.setString(2, dto.getUser_pw());
           rs = psmt.executeQuery();
           while (rs.next()) {
              result = true;
           }
        } catch (SQLException e) {
           // TODO Auto-generated catch block
           e.printStackTrace();
        } finally {
           close();
        }

        return result;
     }
	
}
