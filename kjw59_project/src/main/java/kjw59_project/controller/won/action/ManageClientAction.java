package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.CartVO;
import kjw59_project.model.won.MImageDTO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.MemberPtDTO;
import kjw59_project.model.won.ProductDAO;

public class ManageClientAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();
		
		ArrayList<MemberPtDTO> classList;
		memberPt.setM_id((String)session.getAttribute("m_id"));
		String search = request.getParameter("search");
		if(search == null) {
			classList = productDAO.getMyClientList(memberPt);
			session.setAttribute("classList", classList);
		}
		else {
			classList = productDAO.getMyClientList(memberPt, search);
			session.setAttribute("classList", classList);
		}
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/manageClient.jsp");
		
		return forward;
	}

}
