package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.MemberPtDTO;
import kjw59_project.model.won.ProductDAO;

public class RefuseStateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberDAO memberDAO = new MemberDAO();
		MemberPtDTO memberPt = new MemberPtDTO();
		MemberDTO member = new MemberDTO();
		
		int mp_code = Integer.parseInt(request.getParameter("mp_code"));
		int mp_coin = Integer.parseInt(request.getParameter("mp_coin"));
		String m_id = request.getParameter("m_id");
		
		memberPt.setMp_code(mp_code);
		member.setM_id(m_id);
		productDAO.changeMpCode(memberPt,"RE");
		
		// 환불할 코인 + 현재 m_id가 갖고 있는 코인 = m_id 코인 값 변경
		mp_coin += memberDAO.getCoinMember(member);
		member.setM_coin(mp_coin);
		memberDAO = new MemberDAO();
		memberDAO.updateCoin(member);
		
		productDAO = new ProductDAO();
		ArrayList<MemberPtDTO> classList;
		memberPt.setM_id((String)session.getAttribute("m_id"));
		classList = productDAO.getMyClientList(memberPt);
		session.setAttribute("classList", classList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/manageClient.jsp");
		
		return forward;
	}

}
