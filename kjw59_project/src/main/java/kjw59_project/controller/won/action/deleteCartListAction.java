package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;
public class deleteCartListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		productDAO productDAO = new productDAO();
		memberPtDTO memberPt = new memberPtDTO();
		
		int mp_code = Integer.parseInt(request.getParameter("mp_code"));
		memberPt.setMp_code(mp_code);
		
		boolean result = productDAO.deleteCart(memberPt);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/getCartList.won");
		}
		else {
			forward.setPath("/error.jsp");
		}
		
		return forward;
	}

}
