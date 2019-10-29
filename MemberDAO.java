/*=================================================
 	MemberDAO.java
 	- 데이터베이스 액션 처리 전용 클래스
 	  (TBL_MEMBER 테이블 전용 DAO)
 ==================================================*/

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

	public Connection connection() throws ClassNotFoundException, SQLException
	{
		conn = DBConn.getConnection();
		return conn;
	}

	// 데이터 입력 담당 메소드
	public int add(MemberDTO member) throws SQLException
	{
		int result = 0;

		String sql = "INSERT INTO TBL_MEMBER(SID,NAME,TEL) VALUES(MEMBERSEQ.NEXTVAL,?,?)";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getName());
		pstmt.setString(2, member.getTel());

		result = pstmt.executeUpdate();

		pstmt.close();

		return result;
	}

	// 회원 리스트 출력 담당 메소드
	public ArrayList<MemberDTO> lists() throws SQLException
	{
		ArrayList<MemberDTO> result = new ArrayList<MemberDTO>();

		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER ORDER BY SID";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();
		MemberDTO member = null;

		while (rs.next())
		{
			member = new MemberDTO();

			member.setSid(rs.getString("SID"));
			member.setName(rs.getString("NAME"));
			member.setTel(rs.getString("TEL"));

			result.add(member);
		}

		rs.close();
		pstmt.close();

		return result;
	}

	// 인원수 확인 담당 메소드
	public int count() throws SQLException
	{
		int result = 0;

		String sql = "SELECT COUNT(*) AS COUNT FROM TBL_MEMBER";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next())
		{
			result = rs.getInt("COUNT");
		}
		rs.close();
		pstmt.close();

		return result;
	}

	// 데이터베이스 연결 종료 담당 메소드
	public void close() throws SQLException
	{
		DBConn.close();
	}

	// 메소드 추가
	// -------------------------------------------------------------------------------------------------------

	// 회원 정보 검색 담당 메소드
	public MemberDTO searchMember(String sid) throws SQLException
	{
		MemberDTO result = new MemberDTO();

		String sql = "SELECT SID, NAME, TEL FROM TBL_MEMBER WHERE SID=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, sid);

		ResultSet rs = pstmt.executeQuery();

		if (rs.next())
		{
			result.setSid(rs.getString("SID"));
			result.setName(rs.getString("NAME"));
			result.setTel(rs.getString("TEL"));
		}

		rs.close();
		pstmt.close();

		return result;
	}

	// 회원 데이터 수정 담당 메소드
	public int update(MemberDTO dto) throws SQLException
	{

		String sql = "UPDATE TBL_MEMBER SET NAME=?, TEL=? WHERE SID=?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		pstmt.setString(1, dto.getName());
		pstmt.setString(2, dto.getTel());
		pstmt.setString(3, dto.getSid());

		int result = pstmt.executeUpdate();

		pstmt.close();

		return result;

	}
	
	// 회원 데이터 삭제 담당 메소드
	public int delete(String sid) throws SQLException
	{
		String sql = "DELETE FROM TBL_MEMBER WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		int result = pstmt.executeUpdate();
		
		
		pstmt.close();
		
		
		return result;
	}
	
	// 자식 테이블의 참조 데이터 레코드 수 확인
	public int refCount(String sid) throws SQLException
	{
		int result = 0;
		
		String sql="SELECT COUNT(*) AS COUNT FROM TBL_SCORE WHERE SID=?";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, sid);
		
		ResultSet rs = pstmt.executeQuery();
		
		if(rs.next())
		{
			result = rs.getInt("COUNT");
		}
		
		pstmt.close();
		rs.close();
		
		return result;
	}
}




















