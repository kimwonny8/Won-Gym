package kjw59_project.model.won;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ProductDAO {
	private PreparedStatement pstmt = null;
	private Connection con = null;

	Context init = null; // 컨텍스트 객체 변수
	DataSource ds = null; // 데이터소스 객체 변수

	ResultSet rs = null;

	public ProductDAO() {
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
	public boolean insertProduct(PtDTO pt) {
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
	public ArrayList<PtDTO> updateGetPtList(PtDTO pt) {
		ArrayList<PtDTO> classList = new ArrayList<PtDTO>();

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
	public boolean updateProduct(PtDTO pt) {
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
	public boolean deleteProduct(PtDTO pt) {
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

	// 주문완료 후 pt에 키, 체중 등 수정
	public boolean paymentComplete(MemberPtDTO memberPt) {
		boolean success = false;

		String sql = "update member_pt set mp_state='PC', mp_tall=?, mp_weight=?, mp_detail=? where m_id=? and mp_state = 'PP'";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberPt.getMp_tall());
			pstmt.setInt(2, memberPt.getMp_weight());
			pstmt.setString(3, memberPt.getMp_detail());
			pstmt.setString(4, memberPt.getM_id());

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
	public ArrayList<AllClassVO> getClassList(PtDTO pt, MemberDTO member, MImageDTO mImage) {
		ArrayList<AllClassVO> classList = new ArrayList<AllClassVO>();

		String sql = "select p.pt_code, p.t_id, p.pt_title, p.pt_one_c, p.pt_con_c, p.pt_content, p.pt_like, "
				+ "m.m_name, m.c_code, IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.t_id = m.m_id) order by p.pt_code";
		try {
			pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AllClassVO allClass = new AllClassVO();
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
	public ArrayList<AllClassVO> getClassSearchList(PtDTO pt, MemberDTO member, MImageDTO mImage) {
		ArrayList<AllClassVO> classList = new ArrayList<AllClassVO>();

		String sql = "select p.pt_code, p.t_id, p.pt_title, p.pt_one_c, p.pt_con_c, p.pt_content, p.pt_like, "
				+ "m.m_name, m.c_code, IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.t_id = m.m_id) "
				+ "where m.c_code = ? order by p.pt_code";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, member.getC_code());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AllClassVO allClass = new AllClassVO();
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
	public ArrayList<AllClassVO> selectClassList(PtDTO pt, MemberDTO member, MImageDTO mImage) {
		ArrayList<AllClassVO> classList = new ArrayList<AllClassVO>();

		String sql = "select  p.t_id, p.pt_title, p.pt_one_c, p.pt_con_c, p.pt_content, p.pt_like, "
				+ "m.m_name, m.c_code, IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.t_id = m.m_id) "
				+ "where p.pt_code = ?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, pt.getPt_code());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				AllClassVO allClass = new AllClassVO();
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
	public void getTidPrice(PtDTO pt) {
		ArrayList<PtDTO> list = new ArrayList<PtDTO>();
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

	// 장바구니에 담기 전 동일 상품 있는 지 확인
	public String chkSamePt(MemberPtDTO memberPt) {
		String cnt = null;
		String sql = "select count(*) from member_pt where pt_code =? and m_id=?";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, memberPt.getPt_code());
			pstmt.setString(2, memberPt.getM_id());
			ResultSet rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getString(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
			return cnt;
		} finally {
			disConnect();
		}
		return cnt;
	}

	// 장바구니에 담는 메서드
	public boolean insertCart(MemberPtDTO memberPt) {
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
	public ArrayList<CartVO> getCartList(MemberPtDTO memberPt, MemberDTO member, MImageDTO mImage) {
		ArrayList<CartVO> classList = new ArrayList<>();

		String sql = "select p.mp_code, p.pt_code, p.t_id, p.mp_coin, p.mp_cnt, m.c_code, "
				+ "IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from member_pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.m_id = m.m_id) "
				+ "where p.m_id = ? and p.mp_state='CR' order by p.mp_code";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CartVO cart = new CartVO();
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
				MemberDAO memberDAO = new MemberDAO();
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
	public boolean deleteCart(MemberPtDTO memberPt) {
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

	// 장바구니에서 결제진행으로 PP -> CR
	public boolean PPtoCRCart(MemberPtDTO memberPt) {
		boolean success = false;

		String sql = "update member_pt set mp_state = 'CR' where m_id = ? and mp_state='PP'";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());

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
	public boolean paymentProgressCart(MemberPtDTO memberPt) {
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

	// 바로 구매
	public ArrayList<CartVO> buyRightNow(MemberPtDTO memberPt, MemberDTO member, MImageDTO mImage) {
		ArrayList<CartVO> classList = new ArrayList<>();

		String sql = "select p.mp_code, p.pt_code, p.t_id, p.mp_coin, p.mp_cnt, m.c_code, "
				+ "IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from member_pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.m_id = m.m_id) "
				+ "where p.mp_code = ? ";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CartVO cart = new CartVO();
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
				MemberDAO memberDAO = new MemberDAO();
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

	// 결제 진행중(PP) 리스트
	public ArrayList<CartVO> getPPList(MemberPtDTO memberPt, MemberDTO member, MImageDTO mImage) {
		ArrayList<CartVO> classList = new ArrayList<>();

		String sql = "select p.mp_code, p.pt_code, p.t_id, p.mp_coin, p.mp_cnt, m.c_code, "
				+ "IFNULL(i.mi_thum_name, 'user.png') AS mi_thum_name "
				+ "from member_pt p left join m_image i on (p.t_id = i.m_id) left join member m on (p.m_id = m.m_id) "
				+ "where p.m_id = ? and p.mp_state='PP' order by p.mp_code";

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, memberPt.getM_id());
			ResultSet rs = pstmt.executeQuery();

			while (rs.next()) {
				CartVO cart = new CartVO();
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
				MemberDAO memberDAO = new MemberDAO();
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
