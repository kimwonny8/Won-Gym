package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;

public class UpdateGradeAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		String m_id=request.getParameter("m_id");
		String m_grade=request.getParameter("m_grade");
	
		member.setM_id(m_id);
		member.setM_grade(m_grade);

		boolean result = memberDAO.updateGrade(member);
			
		if(result == true) {
			forward.setPath("./adminMember.won");
		}
		else {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}

}
