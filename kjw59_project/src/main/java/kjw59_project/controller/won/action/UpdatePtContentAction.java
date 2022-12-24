package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.ProductDAO;
import kjw59_project.model.won.PtDTO;

public class UpdatePtContentAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		PtDTO pt = new PtDTO();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		// pt 테이블에 내용 추가
		try {
			pt.setPt_code(Integer.parseInt(request.getParameter("pt_code")));
			pt.setT_id((String) session.getAttribute("m_id"));
			pt.setPt_title(request.getParameter("pt_title"));
			pt.setPt_one_c(Integer.parseInt(request.getParameter("pt_one_c")));
			pt.setPt_con_c(Integer.parseInt(request.getParameter("pt_con_c")));
			pt.setPt_content(request.getParameter("pt_content"));

			boolean result = productDAO.updateProduct(pt);

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
