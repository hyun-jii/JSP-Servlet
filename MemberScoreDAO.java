/*=================================================
 	MemberScoreDAO.java
 	- 데이터베이스 액션 처리 전용 클래스
 	  (TBL_SCORE 테이블 전용 DAO)
 ==================================================*/

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberScoreDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 담당 메소드
	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}
	
	// 데이터 입력 담당 메소드(성적 데이터 입력)
	public int add(MemberScoreDTO score) throws SQLException
	{
		int result = 0;
		
		String sql="INSERT INTO TBL_SCORE(SID, KOR, ENG, MAT) VALUES(?,?,?,?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, score.getSid());
		pstmt.setInt(2, score.getKor());
		pstmt.setInt(3, score.getEng());
		pstmt.setInt(4, score.getMat());
		
		result = pstmt.executeUpdate();
		
		pstmt.close();
		
		return result;
	}
	
	// 성적 리스트 출력 담당 메소드
	public ArrayList<MemberScoreDTO> lists() throws SQLException
	{
		ArrayList<MemberScoreDTO> result = new ArrayList<MemberScoreDTO>();
		
		String sql = "SELECT SID, NAME, KOR, ENG, MAT,(KOR+ENG+MAT) AS TOT,((KOR+ENG+MAT)/3) AS AVG, RANK() OVER(ORDER BY(KOR+ENG+MAT) DESC) AS RANK FROM VIEW_MEMBERSCORE ORDER BY SID";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		MemberScoreDTO score = null;
		
		while(rs.next())
		{
			score = new MemberScoreDTO();
			
			score.setSid(rs.getString("SID"));
			score.setName(rs.getString("NAME"));
			score.setKor(rs.getInt("KOR"));
			score.setEng(rs.getInt("ENG"));
			score.setMat(rs.getInt("MAT"));
			score.setTot(rs.getInt("TOT"));
			score.setAvg(rs.getDouble("AVG"));
			score.setRank(rs.getInt("RANK"));
			
			result.add(score);
		}
		
		rs.close();
		pstmt.close();
		
		
		return result;
		
	}
	
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	// 데이터 수정 메소드
	public MemberScoreDTO update(String sid) throws SQLException
	{
		MemberScoreDTO score = new MemberScoreDTO();
		int result = 0;
		
		String sql = "UPDATE TBL_SCORE SET KOR=?, ENG=?, MAT=? WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setInt(1, score.getKor());
		pstmt.setInt(2, score.getEng());
		pstmt.setInt(3, score.getMat());
		pstmt.setString(4, sid);
		
		result = pstmt.executeUpdate();
		
		return score;
	}
	
	
	
}
















