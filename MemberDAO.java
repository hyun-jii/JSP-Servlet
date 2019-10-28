/*===========================================
 	MemberDAO.java
	- 데이터베이스 액션 처리 전용 객체 활용
============================================= */

package com.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.util.DBConn;

public class MemberDAO
{
	private Connection conn;
	
	// 데이터베이스 연결 -> 생성자 형태로 정의
	public MemberDAO() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
	}
	
	// 데이터 입력 메소드 정의
	public int add(MemberDTO member) throws SQLException
	{
		int result = 0 ;
		String sql = "INSERT INTO TBL_MEMBER(SID, NAME, TEL) VALUES(MEMBERSEQ.NEXTVAL, ?, ?)";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());
		
		result = pstmt.executeUpdate();
		pstmt.close();
		
		return result;
	}
	
	// 리스트 전체 출력 메소드 정의
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();
		
		String sql ="SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY 1";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next())
		{
			MemberDTO member = new MemberDTO();
			
			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));
			
			result.add(member);
		}
		rs.close();
		pstmt.close();
		
		return result;
	}
	
	//인원 수 확인을 위한 메소드 준비
	public int count() throws SQLException
	{
		int result = 0;
		
		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
			
		}
		
		rs.close();
		pstmt.close();
		
		return result;
			
	}
	
	// 데이터베이스 연결 종료 담당 메소드 정의
	public void close() throws SQLException
	{
		DBConn.close();
	}
	
	
	
}
