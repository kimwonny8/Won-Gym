package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class signupAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		System.out.println("dd");
		request.setCharacterEncoding("utf-8");
		memberDAO memberDAO = new memberDAO();
		memberDTO member = new memberDTO();
		cityDTO city = new cityDTO();

		member.setM_pw(request.getParameter("m_pw"));
		member.setM_id(request.getParameter("m_id"));
		member.setM_name(request.getParameter("m_name"));
		member.setM_birth(request.getParameter("m_birth"));
		member.setM_gender(request.getParameter("m_gender"));
		member.setM_phone(request.getParameter("m_phone"));
		member.setM_grade(request.getParameter("m_grade"));
		member.setM_phone(request.getParameter("m_phone"));

		city.setC_name(request.getParameter("c_name"));
		member.setC_code(memberDAO.getCityCode(city));

		memberDAO = new memberDAO();
		boolean result = memberDAO.insertMember(member);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/index.jsp");
		}
		else {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		
		return forward;
	}
}
