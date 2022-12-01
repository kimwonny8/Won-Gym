package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.memberDAO;
import kjw59_project.model.won.memberDTO;

public class chkIdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		memberDAO memberDAO = new memberDAO();
		memberDTO member = new memberDTO();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String m_id = request.getParameter("m_id");
		member.setM_id(m_id);
		boolean result = memberDAO.chkId(member);
		if(result == true) {
			forward.setPath("/com/yju/2wda/team1/view/won/updateMember.jsp");
			return forward;
		}
		else {
			return null;
		}
	}

}
