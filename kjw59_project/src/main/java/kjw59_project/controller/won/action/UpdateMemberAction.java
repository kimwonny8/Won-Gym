package kjw59_project.controller.won.action;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.TrainerDTO;

public class UpdateMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO();

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		try {
			String m_id = (String) session.getAttribute("m_id");
			String m_name = (String) session.getAttribute("m_name");
			String m_grade = (String) session.getAttribute("m_grade");

			member.setM_id(m_id);
			member.setM_name(m_name);
			member.setM_grade(m_grade);
			member.setM_pw(encrypt(request.getParameter("m_pw")));
			member.setM_birth(request.getParameter("m_birth"));
			member.setM_gender(request.getParameter("m_gender"));
			member.setM_phone(request.getParameter("m_phone"));
			member.setC_code(request.getParameter("c_code"));

			memberDAO = new MemberDAO();
			boolean result = memberDAO.updateMember(member);

			if (result == true) {
				forward.setPath("/com/yju/2wda/team1/view/won/updateMember.jsp");
				return forward;
			} else {
				return null;
			}
		} catch (Exception e) {
			response.sendRedirect("/kjw59_project/com/yju/2wda/team1/view/etc/error.jsp");
			return null;
		}
	}

	// 비밀번호 암호화
	public String encrypt(String text) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		md.update(text.getBytes());

		return bytesToHex(md.digest());
	}

	private String bytesToHex(byte[] bytes) {
		StringBuilder builder = new StringBuilder();
		for (byte b : bytes) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}

}
