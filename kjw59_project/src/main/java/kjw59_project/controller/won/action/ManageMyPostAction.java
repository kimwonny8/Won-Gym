package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class ManageMyPostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO(); // 상품 내용
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		try {
			String m_id = (String) session.getAttribute("m_id");

			ArrayList<PtDTO> postList;
			postList = productDAO.selectAllPostList2(m_id);
			session.setAttribute("postList", postList);

			forward.setPath("/com/yju/2wda/team1/view/won/manageMyPost.jsp");
		} catch (Exception e) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}

}
