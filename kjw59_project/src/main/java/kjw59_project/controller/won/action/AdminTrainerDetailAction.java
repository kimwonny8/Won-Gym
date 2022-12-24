package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.TrainerDTO;

public class AdminTrainerDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		try {

			String t_id = request.getParameter("m_id");
			if (t_id != null) {
				ArrayList<TrainerDTO> trainerList = memberDAO.getTrainerLicense(t_id);
				session.setAttribute("trainerList", trainerList);
				forward.setPath("/com/yju/2wda/team1/view/won/adminTrainerDetail.jsp");
			} else {
				forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
			}
		} catch (Exception e) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}
}
