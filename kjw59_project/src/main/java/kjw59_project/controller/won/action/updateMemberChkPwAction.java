package kjw59_project.controller.won.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.memberDAO;
import kjw59_project.model.won.memberDTO;

public class updateMemberChkPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		request.setCharacterEncoding("utf-8");

		String m_pw = request.getParameter("m_pw");
		System.out.println("dd" + m_pw);
		request.setCharacterEncoding("utf-8");
		memberDAO memberDAO = new memberDAO();
		memberDTO member = new memberDTO();

		String m_id=(String)session.getAttribute("m_id"); 		  
		member.setM_id(m_id);
		String pw=memberDAO.updateMemberChkPw(member);
		
		if(m_pw.equals(pw)) {
			forward.setPath("/com/yju/2wda/team1/view/won/updateMember.jsp");
			return forward;
		}
		else {
			return null;
			//forward.setPath("/com/yju/2wda/team1/view/won/mypageChkPw.jsp");
		}

		
	}

}
