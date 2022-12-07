package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.JOptionPane;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class SignupAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO();
		TrainerDTO trainer = new TrainerDTO();
		CityDTO city = new CityDTO();
		
		String m_grade=request.getParameter("m_grade");
		String m_id=request.getParameter("m_id");

		member.setM_pw(request.getParameter("m_pw"));
		member.setM_id(m_id);
		member.setM_name(request.getParameter("m_name"));
		member.setM_birth(request.getParameter("m_birth"));
		member.setM_gender(request.getParameter("m_gender"));
		member.setM_phone(request.getParameter("m_phone"));
		member.setM_grade(m_grade);
		member.setC_code(request.getParameter("c_code"));

		memberDAO = new MemberDAO();
		boolean result = memberDAO.insertMember(member);
		
		// trainer 테이블에도 추가
		if(m_grade.equals("trainer")) {
			trainer.setT_id(m_id);
			
			memberDAO = new MemberDAO();
			boolean result2 = memberDAO.insertTrainer(trainer);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/index.jsp");
			return forward;
		}
		else {
			return null;
		}
	}
}
