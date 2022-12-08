package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.ProductDAO;
import kjw59_project.model.won.PtDTO;

public class ExpulsionPostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		PtDTO pt = new PtDTO();
		
		int pt_code = Integer.parseInt(request.getParameter("pt_code"));
		pt.setPt_code(pt_code);
		
		boolean result = productDAO.deleteProduct(pt);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/adminPost.won");
		}
		else {
			forward.setPath("/error.jsp");
		}
		
		return forward;
	}

}
