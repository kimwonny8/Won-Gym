package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.memberDAO;
import kjw59_project.model.won.memberDTO;
import kjw59_project.model.won.trainerDTO;

public class updateMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		memberDAO memberDAO = new memberDAO();
		memberDTO member = new memberDTO();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String m_id=(String)session.getAttribute("m_id");
		String m_name=(String)session.getAttribute("m_name");
		String m_grade=(String)session.getAttribute("m_grade");
	
		member.setM_id(m_id);
		member.setM_name(m_name);
		member.setM_grade(m_grade);
		member.setM_pw(request.getParameter("m_pw"));
		member.setM_birth(request.getParameter("m_birth"));
		member.setM_gender(request.getParameter("m_gender"));
		member.setM_phone(request.getParameter("m_phone"));
		member.setC_code(request.getParameter("c_code"));

		memberDAO = new memberDAO();
		boolean result = memberDAO.updateMember(member);
			
		if(result == true) {
			forward.setPath("/com/yju/2wda/team1/view/won/updateMember.jsp");
			return forward;
		}
		else {
			return null;
		}
	}

}
