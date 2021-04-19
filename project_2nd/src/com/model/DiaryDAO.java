package com.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DiaryDAO {

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
	public int diary(DiaryDTO dto) {
		int cnt = 0;

		getConnection();

		try {
			String sql = "insert into diary values(preg_num.nextval, ?, to_date(?,'YYYY-MM-DD'),?,?,?)";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getDay());
			psmt.setString(3, dto.getTitle());
			psmt.setString(4, dto.getContent());
			psmt.setString(5, dto.getImg());
			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public DiaryDTO diaryReading(String id, String targetdate) {

		getConnection();

		DiaryDTO dto = null;

		try {
			String sql = "select * from diary where user_id = ? and DIARY_DATE = ?"; // 다이어리 작성
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			psmt.setString(2, targetdate);
			rs = psmt.executeQuery();

			if (rs.next()) {
				int num = rs.getInt("diary_id");
				id = rs.getString("user_id");
				String img = rs.getString("uspicture");
				String day = rs.getString("diary_date");
				String title = rs.getString("title");
				String content = rs.getString("content");
				dto = new DiaryDTO(num, id, img, day, title, content);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dto;
	}

	// 게시글 보기
	public DiaryDTO alldiarydate(String id) {

		getConnection();

		DiaryDTO dto = null;

		try {
			String sql = "select * from diary where user_id = ? Order By diary_date desc"; // 다이어리 작성
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, id);
			rs = psmt.executeQuery();

			if(rs.next()) {
				int num = rs.getInt("diary_id");
				id = rs.getString("user_id");
				String img = rs.getString("uspicture");
				String day = rs.getString("diary_date");
				String title = rs.getString("title");
				String content = rs.getString("content");
				dto = new DiaryDTO(num, id, img, day, title, content);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}

		return dto;
	}

	public int update(DiaryDTO dto) {

		int cnt = 0;
		getConnection();

		try {
			String sql = "update diary set diary_date=?, title=?, content=?,  uspicture=? where diary_id =? ";
			psmt = conn.prepareStatement(sql);

			psmt.setString(1, dto.getDay());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getImg());
			psmt.setInt(5, dto.getNum());

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public int removeDiary(int num) {
		int cnt = 0;

		getConnection();

		String sql = "delete from diary where diary_id = ?";

		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, num);

			cnt = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		return cnt;
	}

	public DiaryDTO selectDiaryOne(String did, String dd) {
		DiaryDTO dto = null;
		getConnection();
		
		String sql = "select * from diary where user_id = ?";
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, did);
			rs = psmt.executeQuery();
			while(rs.next()) {
				String value = rs.getString(3).substring(2,10);
				if(value.equals(dd)) {
					//System.out.println("일치");
					 int num = rs.getInt(1);
					 String id = rs.getString(2);
					 String img = rs.getString(6);
					 String day = rs.getString(3);
					 String title = rs.getString(4);
					 String content = rs.getString(5);
					 dto = new DiaryDTO(num, id, img, day.substring(0, 10), title, content);
					
					return dto;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			close();
		}
		
		
		
		return dto;
	}

}
