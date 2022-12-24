package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.ProductDAO;
import kjw59_project.model.won.PtDTO;

public class DeletePtAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		PtDTO pt = new PtDTO();

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		try {
			int pt_code = Integer.parseInt(request.getParameter("pt_code"));
			pt.setPt_code(pt_code);

			boolean result = productDAO.deleteProduct(pt);

			if (result == true) {
				forward.setPath("/getClassList.won");
			} else {
				forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
			}
		} catch (Exception e) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}

}
