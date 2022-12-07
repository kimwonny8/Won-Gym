package kjw59_project.model.won;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class productDAO {
	private PreparedStatement pstmt = null;
	private Connection con = null;

	Context init = null; // 컨텍스트 객체 변수
	DataSource ds = null; // 데이터소스 객체 변수

	ResultSet rs = null;

	public productDAO() {
		super();
		dbConnect();
	}

	public void dbConnect() {
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource) init.lookup("java:comp/env/jdbc_mariadb");
			con = ds.getConnection();

			System.out.println("DB연결 성공");
		} catch (Exception e) {
			System.out.println("DB연결 실패");
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

	// pt 상품 게시글 업로드
	public boolean insertProduct(ptDTO pt) {
		boolean success = false;

		String sql = "insert into pt (t_id, pt_title, pt_one_c, pt_con_c, pt_content)";
		sql += "values (?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pt.getT_id());
			pstmt.setString(2, pt.getPt_title());
			pstmt.setInt(3, pt.getPt_one_c());
			pstmt.setInt(4, pt.getPt_con_c());
			pstmt.setString(5, pt.getPt_content());

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

	// 글 수정시 내용 불러오기
	public ArrayList<ptDTO> updateGetPtList(ptDTO pt) {
		ArrayList<ptDTO> classList = new ArrayList<ptDTO>();

		String sql = "select pt_title, pt_one_c, pt_con_c, pt_content, pt_like from pt where pt_code = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pt.getPt_code());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				pt.setPt_title(rs.getString("pt_title"));
				pt.setPt_one_c(rs.getInt("pt_one_c"));
				pt.setPt_con_c(rs.getInt("pt_con_c"));
				pt.setPt_content(rs.getString("pt_content"));
				pt.setPt_like(rs.getInt("pt_like"));

				classList.add(pt);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classList;
	}

	// pt 상품 게시글 수정
	public boolean updateProduct(ptDTO pt) {
		boolean success = false;

		String sql = "update pt set pt_title=?, pt_one_c=?, pt_con_c=?, pt_content=? where t_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, pt.getPt_title());
			pstmt.setInt(2, pt.getPt_one_c());
			pstmt.setInt(3, pt.getPt_con_c());
			pstmt.setString(4, pt.getPt_content());
			pstmt.setString(5, pt.getT_id());

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

	// pt 상품 게시글 삭제
	public boolean deleteProduct(ptDTO pt) {
		boolean success = false;

		String sql = "delete from pt where pt_code = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pt.getPt_code());

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

	// 게시판 전체 레코드 반환 메소드
	public ArrayList<allClassVO> getClassList(ptDTO pt, memberDTO member, mImageDTO mImage) {
		ArrayList<allClassVO> classList = new ArrayList<allClassVO>();

		String sql = "select p.pt_code, p.t_id, p.pt_title, p.pt_one_c, p.pt_con_c, p.pt_content, p.pt_like, "
				+ "m.m_name, m.c_code, IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.t_id = m.m_id) order by p.pt_code";
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				allClassVO allClass = new allClassVO();
				allClass.setPt_code(rs.getInt("pt_code"));
				allClass.setT_id(rs.getString("t_id"));
				allClass.setPt_title(rs.getString("pt_title"));
				allClass.setPt_one_c(rs.getInt("pt_one_c"));
				allClass.setPt_con_c(rs.getInt("pt_con_c"));
				allClass.setPt_content(rs.getString("pt_content"));
				allClass.setPt_like(rs.getInt("pt_like"));
				allClass.setM_name(rs.getString("m_name"));
				allClass.setC_code(rs.getString("c_code"));
				allClass.setMi_thum_name(rs.getString("mi_thum_name"));

				classList.add(allClass);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classList;
	}

	// 게시판 검색한 동네 레코드를 반환 메소드
	public ArrayList<allClassVO> getClassSearchList(ptDTO pt, memberDTO member, mImageDTO mImage) {
		ArrayList<allClassVO> classList = new ArrayList<allClassVO>();

		String sql = "select p.pt_code, p.t_id, p.pt_title, p.pt_one_c, p.pt_con_c, p.pt_content, p.pt_like, "
				+ "m.m_name, m.c_code, IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.t_id = m.m_id) "
				+ "where m.c_code = ? order by p.pt_code";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getC_code());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				allClassVO allClass = new allClassVO();
				allClass.setPt_code(rs.getInt("pt_code"));
				allClass.setT_id(rs.getString("t_id"));
				allClass.setPt_title(rs.getString("pt_title"));
				allClass.setPt_one_c(rs.getInt("pt_one_c"));
				allClass.setPt_con_c(rs.getInt("pt_con_c"));
				allClass.setPt_content(rs.getString("pt_content"));
				allClass.setPt_like(rs.getInt("pt_like"));
				allClass.setM_name(rs.getString("m_name"));
				allClass.setC_code(rs.getString("c_code"));
				allClass.setMi_thum_name(rs.getString("mi_thum_name"));

				classList.add(allClass);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classList;
	}

	// 선택한 상품 보기
	public ArrayList<allClassVO> selectClassList(ptDTO pt, memberDTO member, mImageDTO mImage) {
		ArrayList<allClassVO> classList = new ArrayList<allClassVO>();

		String sql = "select  p.t_id, p.pt_title, p.pt_one_c, p.pt_con_c, p.pt_content, p.pt_like, "
				+ "m.m_name, m.c_code, IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.t_id = m.m_id) "
				+ "where p.pt_code = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pt.getPt_code());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				allClassVO allClass = new allClassVO();
				allClass.setT_id(rs.getString("t_id"));
				allClass.setPt_title(rs.getString("pt_title"));
				allClass.setPt_one_c(rs.getInt("pt_one_c"));
				allClass.setPt_con_c(rs.getInt("pt_con_c"));
				allClass.setPt_content(rs.getString("pt_content"));
				allClass.setPt_like(rs.getInt("pt_like"));
				allClass.setM_name(rs.getString("m_name"));
				allClass.setC_code(rs.getString("c_code"));
				allClass.setMi_thum_name(rs.getString("mi_thum_name"));

				classList.add(allClass);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classList;
	}

	// 트레이너 아이디, 가격 가져오기
	public void getTidPrice(ptDTO pt) {
		ArrayList<ptDTO> list = new ArrayList<ptDTO>();
		String sql = "select t_id, pt_one_c, pt_con_c from pt where pt_code = ?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pt.getPt_code());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				pt.setT_id(rs.getString("t_id"));
				pt.setPt_con_c(rs.getInt("pt_con_c"));
				pt.setPt_one_c(rs.getInt("pt_one_c"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}
	}

	// 장바구니에 담는 메서드
	public boolean insertCart(memberPtDTO memberPt) {
		boolean success = false;

		String sql = "insert into member_pt (m_id, pt_code, t_id, mp_state, mp_coin, mp_cnt) "
				+ "values (?, ?, ?, ?, ?, ?)";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());
			pstmt.setInt(2, memberPt.getPt_code());
			pstmt.setString(3, memberPt.getT_id());
			pstmt.setString(4, memberPt.getMp_state());
			pstmt.setInt(5, memberPt.getMp_coin());
			pstmt.setInt(6, memberPt.getMp_cnt());

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

	// 장바구니 리스트
	public ArrayList<cartVO> getCartList(memberPtDTO memberPt, memberDTO member, mImageDTO mImage) {
		ArrayList<cartVO> classList = new ArrayList<>();

		String sql = "select p.mp_code, p.pt_code, p.t_id, p.mp_coin, p.mp_cnt, m.c_code, "
				+ "IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from member_pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.m_id = m.m_id) "
				+ "where p.m_id = ? and p.mp_state='CR' order by p.mp_code";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				cartVO cart = new cartVO();
				cart.setMp_code(rs.getInt("mp_code"));
				cart.setPt_code(rs.getInt("pt_code"));
				String t_id = rs.getString("t_id");
				cart.setT_id(t_id);
				cart.setMp_coin(rs.getInt("mp_coin"));
				cart.setMp_cnt(rs.getInt("mp_cnt"));
				cart.setC_code(rs.getString("c_code"));
				cart.setMi_thum_name(rs.getString("mi_thum_name"));

				// 트레이너 아이디로 이름 가져오기
				member.setM_id(t_id);
				memberDAO memberDAO = new memberDAO();
				String t_name = memberDAO.loginNameMember(member);
				cart.setT_name(t_name);

				classList.add(cart);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classList;
	}

	// 장바구니에서 삭제
	public boolean deleteCart(memberPtDTO memberPt) {
		boolean success = false;

		String sql = "delete from member_pt where mp_code = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberPt.getMp_code());

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

	// 장바구니에서 결제진행으로 CR -> PP
	public boolean paymentProgressCart(memberPtDTO memberPt) {
		boolean success = false;

		String sql = "update member_pt set mp_state = 'PP' where mp_code = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberPt.getMp_code());

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

	// 결제 진행중(PP) 리스트
	public ArrayList<cartVO> getPPList(memberPtDTO memberPt, memberDTO member, mImageDTO mImage) {
		ArrayList<cartVO> classList = new ArrayList<>();

		String sql = "select p.mp_code, p.pt_code, p.t_id, p.mp_coin, p.mp_cnt, m.c_code, "
				+ "IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from member_pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.m_id = m.m_id) "
				+ "where p.m_id = ? and p.mp_state='PP' order by p.mp_code";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				cartVO cart = new cartVO();
				cart.setMp_code(rs.getInt("mp_code"));
				cart.setPt_code(rs.getInt("pt_code"));
				String t_id = rs.getString("t_id");
				cart.setT_id(t_id);
				cart.setMp_coin(rs.getInt("mp_coin"));
				cart.setMp_cnt(rs.getInt("mp_cnt"));
				cart.setC_code(rs.getString("c_code"));
				cart.setMi_thum_name(rs.getString("mi_thum_name"));

				// 트레이너 아이디로 이름 가져오기
				member.setM_id(t_id);
				memberDAO memberDAO = new memberDAO();
				String t_name = memberDAO.loginNameMember(member);
				cart.setT_name(t_name);

				classList.add(cart);
			}
			rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			disConnect();
		}

		return classList;
	}

}
