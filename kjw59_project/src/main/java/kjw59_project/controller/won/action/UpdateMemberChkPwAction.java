package kjw59_project.controller.won.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;

public class UpdateMemberChkPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		request.setCharacterEncoding("utf-8");

		String m_pw = request.getParameter("m_pw");
		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO();

		String m_id=(String)session.getAttribute("m_id"); 		  
		member.setM_id(m_id);
		String pw=memberDAO.updateMemberChkPw(member);
		
		if(m_pw.equals(pw)) {
			forward.setPath("/com/yju/2wda/team1/view/won/myPage.jsp");
			return forward;
		}
		else {
			return null;
		}

		
	}

}
