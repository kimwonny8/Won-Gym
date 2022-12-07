package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;

public class DeleteMemberChkPwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO();

		String m_id=(String)session.getAttribute("m_id"); 		  
		member.setM_id(m_id);
		String pw=memberDAO.updateMemberChkPw(member);
		String m_pw = request.getParameter("m_pw");
		
		if(m_pw.equals(pw)) {
			memberDAO = new MemberDAO();
			boolean result=memberDAO.deleteMember(member);
			if(result==true) {
				session.setAttribute("loginState", "logout");
				forward.setPath("/com/yju/2wda/team1/view/won/updateMember.jsp");
				return forward;
			}
			return null;
		}
		else {
			return null;
		}

	}
	}
