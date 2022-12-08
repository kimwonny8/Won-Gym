package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.CartVO;
import kjw59_project.model.won.MemberPtDTO;
import kjw59_project.model.won.ProductDAO;

public class UpdateStateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();

		// 등급 받아서 올려야 함
		int mp_code = Integer.parseInt(request.getParameter("mp_code"));
		memberPt.setMp_code(mp_code);
		String mp_state = request.getParameter("mp_state");
		
		// 대기 PC -> 진행 CP
		if(mp_state.equals("PC")) {
			productDAO.PCtoCP(memberPt, "CP");
		}
		
		// 진행 CP -> 완료 CC
		else if(mp_state.equals("CP")) {
			productDAO.PCtoCP(memberPt, "CC");
		}
		
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
