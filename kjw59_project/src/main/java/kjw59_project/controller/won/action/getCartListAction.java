package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;
public class getCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		productDAO productDAO = new productDAO(); // 상품 내용
		memberDTO member = new memberDTO();
		mImageDTO mImage = new mImageDTO();
		memberPtDTO memberPt = new memberPtDTO();
		
		ArrayList<cartVO> cartList;
		memberPt.setM_id((String)session.getAttribute("m_id"));
		cartList = productDAO.getCartList(memberPt, member, mImage);
		request.setAttribute("cartList", cartList);	

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/cart.jsp");
		
		return forward;
	}

}
