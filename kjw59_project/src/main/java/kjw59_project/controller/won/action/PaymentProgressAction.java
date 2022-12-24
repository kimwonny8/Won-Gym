package kjw59_project.controller.won.action;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class PaymentProgressAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		MemberPtDTO memberPt = new MemberPtDTO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		
		// ajax를 통해 넘어온 배열 데이터 선언 - int 배열로 변환
		String[] tmp = request.getParameterValues("chkMpCode");
		int[] mp_code = Arrays.stream(tmp).mapToInt(Integer::parseInt).toArray();
		for(int i=0; i<mp_code.length; i++) {
			memberPt.setMp_code(mp_code[i]);
			ProductDAO productDAO = new ProductDAO();
			productDAO.paymentProgressCart(memberPt); // 결제 진행중으로 상태 변경
		}
		
		// PP에 해당하는 리스트 생성
		ProductDAO productDAO = new ProductDAO();
		ArrayList<CartVO> cartList;
		memberPt.setM_id((String)session.getAttribute("m_id"));
		cartList = productDAO.getPPList(memberPt, member, mImage);
		session.setAttribute("cartList", cartList);	

		ActionForward forward = new ActionForward();
		forward.setRedirect(false);

		if(cartList.size() != 0) {
			forward.setPath("/com/yju/2wda/team1/view/won/paymentProgress.jsp");
			return forward;
		}
		else {
			return null;
		}
	}

}
