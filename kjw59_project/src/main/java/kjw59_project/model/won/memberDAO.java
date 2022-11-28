package kjw59_project.model.won;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class memberDAO {
	private PreparedStatement pstmt = null;
	private Connection con = null;

	Context init = null; // 컨텍스트 객체 변수
	DataSource ds = null; // 데이터소스 객체 변수

	ResultSet rs = null;

	public memberDAO() {
		super();
		dbConnect();
	}

	public void dbConnect() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc_mariadb");
			con = ds.getConnection();

			System.out.println("DB연결 성공!!");
		} catch (Exception e) {
			System.out.println("DB연결 실패!!");
			e.printStackTrace();
		}
	}

	// 데이터베이스 연결 해제 메소드
	public void disConnect() {
		if (pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (con != null) {
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		if (rs != null) {
			try {
				rs.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	
	
	// 도시 코드 받아오기
	public String getCityCode(cityDTO city) {
		String c_code = "";

		String sql = "select * from city where c_name = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, city.getC_name());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				c_code = rs.getString(1);
				System.out.println("c_code: " + c_code);
			}

		} catch (Exception e) {
			e.printStackTrace();
			return c_code;
		} finally {
			disConnect();
		}

		return c_code;
	}

	// 회원가입 메서드 
	public boolean insertMember(memberDTO member) {
		boolean success = false;

		String sql = "insert into member (m_id, m_pw, m_name, m_birth, "
				+ "m_gender, m_phone, m_grade, c_code) ";
		sql += "values(?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			pstmt.setString(2, member.getM_pw());
			pstmt.setString(3, member.getM_name());
			pstmt.setString(4, member.getM_birth());
			pstmt.setString(5, member.getM_gender());
			pstmt.setString(6, member.getM_phone());
			pstmt.setString(7, member.getM_grade());
			pstmt.setString(8, member.getC_code());
			
			pstmt.executeUpdate();
			success = true;
		} catch (SQLException e) {
			e.printStackTrace();
			return success;
		} finally {
			disConnect();

		}
		return success;
	}
	
	// 로그인 메서드 
	public String loginPwMember(memberDTO member) {
		String m_pw="";
		String sql = "select m_pw from member where m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				m_pw = rs.getString(1);
				System.out.println("m_pw: " + m_pw);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return m_pw;
		} finally {
			disConnect();
		}

		return m_pw;
	}
	
	// 이름 반환 메서드 
	public String loginNameMember(memberDTO member) {
		String m_name="";
		String sql = "select m_name from member where m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				m_name = rs.getString(1);
				System.out.println("m_name: " + m_name);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return m_name;
		} finally {
			disConnect();
		}

		return m_name;
	}

}
