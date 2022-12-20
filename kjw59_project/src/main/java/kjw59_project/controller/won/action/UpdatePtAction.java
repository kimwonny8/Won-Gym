package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.AllClassVO;
import kjw59_project.model.won.MImageDTO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.ProductDAO;
import kjw59_project.model.won.PtDTO;

public class UpdatePtAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		ProductDAO productDAO = new ProductDAO(); // 상품 내용
		PtDTO pt = new PtDTO();

		String codeString = request.getParameter("pt_code");
		if (!isNumeric(codeString)) { // true면 숫자
			forward.setPath("/com/yju/2wda/team1/view/etc/pageError.jsp");
		} else {
			int pt_code = Integer.parseInt(request.getParameter("pt_code"));

			session.setAttribute("pt_code", pt_code);
			pt.setPt_code(pt_code);

			ArrayList<PtDTO> ptList;

			ptList = productDAO.updateGetPtList(pt);
			session.setAttribute("ptList", ptList);

			forward.setPath("/com/yju/2wda/team1/view/won/uploadClass.jsp");
		}
		return forward;
	}

	public static boolean isNumeric(String s) {
		try {
			Double.parseDouble(s);
			return true;
		} catch (NumberFormatException e) {
			return false;
		}
	}
}
