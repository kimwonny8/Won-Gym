package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*; 

public class AdminPostAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO(); // 상품 내용
		PtDTO pt = new PtDTO();
		
		String search = request.getParameter("search");
		
		ArrayList<PtDTO> postList;
		if(search == null || search.equals("전체")) {
			String searchContent = request.getParameter("searchContent");
			if(searchContent != null && searchContent != "") {
				postList = productDAO.selectAllPostList(searchContent);
				session.setAttribute("postList", postList);
			}
			else {
				postList = productDAO.selectAllPostList();
				session.setAttribute("postList", postList);
			}
			
		}
		else { 
			String searchContent = request.getParameter("searchContent");
			postList = productDAO.selectAllPostList(search, searchContent);
			session.setAttribute("postList", postList);
		}
		
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/adminPost.jsp");
		
		return forward;
	}

}
