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

public class ManageApplicationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		MemberPtDTO memberPt = new MemberPtDTO();

		ArrayList<CartVO> cartList;
		memberPt.setM_id((String)session.getAttribute("m_id"));
		String search = request.getParameter("search");
		if(search == null) {
			cartList = productDAO.getMyClassList(memberPt, member, mImage);
			session.setAttribute("cartList", cartList);
		}
		else {
			cartList = productDAO.getMyClassList(memberPt, member, mImage, search);
			session.setAttribute("cartList", cartList);
		}
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/manageApplication.jsp");
		
		return forward;
	}

}
