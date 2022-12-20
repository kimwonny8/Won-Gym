package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.CartVO;
import kjw59_project.model.won.MImageDTO;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.MemberPtDTO;
import kjw59_project.model.won.ProductDAO;

public class BuyRightNowAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		MemberPtDTO memberPt = new MemberPtDTO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		String codeString = request.getParameter("mp_code");
		if (!isNumeric(codeString)) {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
			return forward;
		} else {
			int mp_code = Integer.parseInt(request.getParameter("mp_code"));

			memberPt.setMp_code(mp_code);

			ProductDAO productDAO = new ProductDAO();
			productDAO.paymentProgressCart(memberPt); // 결제 진행중으로 상태 변경

			// PP에 해당하는 리스트 생성
			productDAO = new ProductDAO();
			ArrayList<CartVO> cartList;
			memberPt.setM_id((String) session.getAttribute("m_id"));
			cartList = productDAO.getPPList(memberPt, member, mImage);
			session.setAttribute("cartList", cartList);

			if (cartList.size() != 0) {
				forward.setPath("/com/yju/2wda/team1/view/won/paymentProgress.jsp");
				return forward;
			}
			else {
				return null;
			}
		}
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
