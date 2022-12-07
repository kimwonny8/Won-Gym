package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;

public class UpdateCoinAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO(); // 상품 내용
		MemberDTO member = new MemberDTO();
	
		int total=Integer.parseInt(request.getParameter("total"));
		member.setM_coin(total);
		member.setM_id((String)session.getAttribute("m_id"));
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		boolean result = memberDAO.updateCoin(member);
		if(result == true) {
			session.setAttribute("m_coin", total);
			forward.setPath("/com/yju/2wda/team1/view/won/myPage.jsp");
		}
		else {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}

		return forward;
	}

}
