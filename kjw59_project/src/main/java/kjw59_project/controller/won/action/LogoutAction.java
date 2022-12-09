package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberPtDTO;
import kjw59_project.model.won.ProductDAO;

public class LogoutAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();

		String m_id = (String)session.getAttribute("m_id");
		memberPt.setM_id(m_id);
		productDAO.PPtoCRCart(memberPt);
		session.invalidate();
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/index.jsp");
		
		return forward;
	}

}
