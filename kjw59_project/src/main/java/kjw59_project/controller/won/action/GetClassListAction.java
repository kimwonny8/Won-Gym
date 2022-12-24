package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.*;
import kjw59_project.model.won.*;

public class GetClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		session.setAttribute("ptList", null);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		PtDTO pt = new PtDTO();

		ArrayList<AllClassVO> classList;

		try {
			String search = request.getParameter("search");
			String searchContent;

			if (search == null || search.equals("전체")) {
				searchContent = request.getParameter("searchContent");
				if (searchContent != null && searchContent != "") {
					classList = productDAO.getClassSearchList(pt, member, mImage, searchContent);
					session.setAttribute("classList", classList);
				} else {
					classList = productDAO.getClassSearchList(pt, member, mImage);
					session.setAttribute("classList", classList);
				}
			}

			else {
				if (search.equals("c_code")) { // 동네면 citySearchContent
					searchContent = request.getParameter("citySearchContent");
				} else {
					searchContent = request.getParameter("searchContent");
				}
				classList = productDAO.getClassSearchList(pt, member, mImage, search, searchContent);
				session.setAttribute("classList", classList);
			}

			session.setAttribute("searchContent", searchContent);

			forward.setPath("/com/yju/2wda/team1/view/won/classApplication.jsp");
		} catch (Exception e) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		return forward;
	}

}
