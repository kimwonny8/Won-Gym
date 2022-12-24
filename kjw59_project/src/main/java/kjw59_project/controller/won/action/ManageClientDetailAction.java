package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.CartVO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.MemberPtDTO;
import kjw59_project.model.won.ProductDAO;

public class ManageClientDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();
		MemberDTO member = new MemberDTO();

		ArrayList<CartVO> classList;
		try {
			memberPt.setMp_code(Integer.parseInt(request.getParameter("mp_code")));
			classList = productDAO.getMyClientDetailList(memberPt, member);
			session.setAttribute("classList", classList);

			forward.setPath("/com/yju/2wda/team1/view/won/manageClientDetail.jsp");
		} catch (Exception e) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}

}
