package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class GetCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		MemberPtDTO memberPt = new MemberPtDTO();

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		ArrayList<CartVO> cartList;
		try {
			memberPt.setM_id((String) session.getAttribute("m_id"));
			productDAO.PPtoCRCart(memberPt); // 결제진행중이다가 안해서 그대로 PP 인것 CR로 변경

			productDAO = new ProductDAO();
			cartList = productDAO.getCartList(memberPt, member, mImage);
			session.setAttribute("cartList", cartList);

			forward.setPath("/com/yju/2wda/team1/view/won/cart.jsp");
		} catch (Exception e) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}

}
