package kjw59_project.model.won;

import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.imageio.ImageIO;
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

	// 회원가입 메서드 - 전체 회원
	public boolean insertMember(memberDTO member) {
		boolean success = false;

		String sql = "insert into member (m_id, m_pw, m_name, m_birth, m_gender, m_phone, m_grade, c_code) ";
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

	// 회원가입 메서드
	public boolean insertTrainer(trainerDTO trainer) {
		boolean success = false;

		String sql = "insert into trainer (t_id) values (?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, trainer.getT_id());

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

	// 회원탈퇴 메서드
	public boolean deleteMember(memberDTO member) {
		boolean success = false;

		String sql = "delete from member where m_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());

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
		String m_pw = "";
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
		String m_name = "";
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

	// id로 동네찾기 반환 메서드
	public String getC_codeMember(memberDTO member) {
		String c_code = "";
		String sql = "select c_code from member where m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
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

	// 트레이너인지 확인하는 메서드
	public String loginChkGrade(memberDTO member) {
		String m_grade = "";
		String sql = "select m_grade from member where m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				m_grade = rs.getString(1);
				System.out.println("m_grade: " + m_grade);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return m_grade;
		} finally {
			disConnect();
		}

		return m_grade;
	}

	// 아이디 중복 확인 메서드
	public boolean chkId(memberDTO member) {
		boolean result = false;
		String sql = "select count(*) from member where m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_id());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				String tmp = rs.getString(1);
				if (!(tmp.equals("1")))
					result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return result;
		} finally {
			disConnect();
		}

		return result;
	}

	// 비밀번호 확인 메서드
	public String updateMemberChkPw(memberDTO member) {
		String m_pw = "";
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

	// 회원정보 수정 메서드
	public boolean updateBeer(memberDTO member) {
		boolean success = false;
		String sql = "UPDATE member SET m_pw=?, m_name=?, m_birth=?, m_gender=?, m_phone=?, m_grade=?, c_code=? WHERE m_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getM_pw());
			pstmt.setString(2, member.getM_name());
			pstmt.setString(3, member.getM_birth());
			pstmt.setString(4, member.getM_gender());
			pstmt.setString(5, member.getM_phone());
			pstmt.setString(6, member.getM_grade());
			pstmt.setString(7, member.getC_code());
			pstmt.setString(8, member.getM_id());

			int result = pstmt.executeUpdate();
			if (result == 1)
				success = true;
		} catch (Exception e) {
			e.printStackTrace();
			return success;
		} finally {
			disConnect();
		}

		return success;
	}

	// 회원이 사진 갖고있는 지 체크, 파일 이름 가져오기
	public String chkMemberPhoto(mImageDTO mImage) {
		String mi_thum_name = "";
		String sql = "select mi_thum_name from m_image where m_id = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mImage.getM_id());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) { // 사진 있으면 썸네일 이름 
				mi_thum_name = rs.getString(1);
			}
			// 사진 없으면 null
			else mi_thum_name = null;
		} catch (Exception e) {
			e.printStackTrace();
			return mi_thum_name;
		} finally {
			disConnect();
		}

		return mi_thum_name;
	}

	// pt 상품, 회원 사진 업로드
	public boolean insertMemberPhoto(mImageDTO mImage) {
		boolean success = false;

		String sql = "insert into m_image (m_id, mi_file_name, mi_size, mi_thum_name)";
		sql += "values (?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mImage.getM_id());
			pstmt.setString(2, mImage.getMi_file_name());
			pstmt.setLong(3, mImage.getMi_size());
			pstmt.setString(4, mImage.getMi_thum_name());

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

	// pt 상품, 회원 사진 업데이트
	public boolean updateMemberPhoto(mImageDTO mImage) {
		boolean success = false;

		String sql = "update m_image set mi_file_name=?, mi_size=?, mi_thum_name=? where m_id=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, mImage.getMi_file_name());
			pstmt.setLong(2, mImage.getMi_size());
			pstmt.setString(3, mImage.getMi_thum_name());
			pstmt.setString(4, mImage.getM_id());

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

	// 썸네일
	public void createImageThumb(String imgDirPath, String thumbImageDir, String originalFileName, int zoom)
			throws IOException {

		String oPath = imgDirPath + originalFileName; // 원본 경로
		File oFile = new File(oPath);

		int index = oPath.lastIndexOf(".");
		String ext = oPath.substring(index + 1); // 파일 확장자

		String tPath = thumbImageDir + "t_" + originalFileName; // 썸네일저장 경로
		File tFile = new File(tPath);

		double ratio = zoom; // 이미지 축소 비율

		try {
			BufferedImage oImage = ImageIO.read(oFile); // 원본이미지
			int tWidth = (int) (oImage.getWidth() / ratio); // 생성할 썸네일이미지의 너비
			int tHeight = (int) (oImage.getHeight() / ratio); // 생성할 썸네일이미지의 높이

			BufferedImage tImage = new BufferedImage(tWidth, tHeight, BufferedImage.TYPE_3BYTE_BGR); // 썸네일이미지
			Graphics2D graphic = tImage.createGraphics();
			Image image = oImage.getScaledInstance(tWidth, tHeight, Image.SCALE_SMOOTH);
			graphic.drawImage(image, 0, 0, tWidth, tHeight, null);
			graphic.dispose(); // 리소스를 모두 해제

			ImageIO.write(tImage, ext, tFile);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
