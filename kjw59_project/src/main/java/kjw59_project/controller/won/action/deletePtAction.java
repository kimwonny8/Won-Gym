package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.productDAO;
import kjw59_project.model.won.ptDTO;

public class deletePtAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		productDAO productDAO = new productDAO();
		ptDTO pt = new ptDTO();
		
		int pt_code = Integer.parseInt(request.getParameter("pt_code"));
		pt.setPt_code(pt_code);
		
		boolean result = productDAO.deleteProduct(pt);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/getClassList.won");
		}
		else {
			forward.setPath("/error.jsp");
		}
		
		return forward;
	}

}
