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
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String tmp=request.getParameter("total");

		if (!isNumeric(tmp)) { // true면 숫자
			forward.setPath("/com/yju/2wda/team1/view/etc/pageError.jsp");
		}
		else {
			int total=Integer.parseInt(tmp);
			member.setM_coin(total);
			member.setM_id((String)session.getAttribute("m_id"));
			
			boolean result = memberDAO.updateCoin(member);
			if(result == true) {
				session.setAttribute("m_coin", total);
				forward.setPath("/com/yju/2wda/team1/view/won/paymentSuccess.jsp");
			}
			else {
				forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
			}

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
