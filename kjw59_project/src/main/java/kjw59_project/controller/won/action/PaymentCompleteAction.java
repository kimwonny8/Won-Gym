package kjw59_project.controller.won.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class PaymentCompleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();

		// memberPt에 키, 체중, 요구사항 정보 추가, PC로 업그레이드
		// 아이디랑 상품state 보고 넣으면 됨
		String m_id = (String)session.getAttribute("m_id");
		int mp_tall = Integer.parseInt(request.getParameter("mp_tall"));
		int mp_weight = Integer.parseInt(request.getParameter("mp_weight"));
		String mp_detail = request.getParameter("mp_detail");
		
		memberPt.setM_id(m_id);
		memberPt.setMp_tall(mp_tall);
		memberPt.setMp_weight(mp_weight);
		memberPt.setMp_detail(mp_detail);		
		boolean result = productDAO.paymentComplete(memberPt);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		if(result == true) {
			// 성공 시 코인 가격도 다운 
			int m_coin = Integer.parseInt(request.getParameter("afterCoin"));
			MemberDTO member = new MemberDTO();
			MemberDAO memberDAO = new MemberDAO();
			member.setM_coin(m_coin);
			member.setM_id(m_id);
			memberDAO.updateCoin(member);
			session.setAttribute("m_coin", m_coin);
			forward.setPath("/com/yju/2wda/team1/view/won/paymentComplete.jsp");
		}
		else {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		
		return forward;
	}

}
