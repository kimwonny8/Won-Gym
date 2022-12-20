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

public class UpdateStateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();
		MemberDAO memberDAO = new MemberDAO();
		MemberDTO member = new MemberDTO();
		
		// 등급 받아서 올려야 함
		int mp_code = Integer.parseInt(request.getParameter("mp_code"));
		String mp_state = request.getParameter("mp_state");
		memberPt.setMp_code(mp_code);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		// 대기 PC -> 진행 CP
		if(mp_state.equals("PC")) {
			String t_id = request.getParameter("t_id");
			int mp_coin = Integer.parseInt(request.getParameter("mp_coin"));	
			member.setM_id(t_id);
			
			// 등급 변경 + 트레이너 코인 가져와서 더해야 함
			int t_coin = memberDAO.getCoinMember(member);
			
			boolean chk = productDAO.changeMpCode(memberPt, "CP");
			if(chk==true) {
				int total = t_coin + mp_coin;

				memberDAO = new MemberDAO();
				member.setM_coin(total);
				member.setM_id(t_id);
				memberDAO.updateCoin(member);
				
				session.setAttribute("m_coin", total);
				
				productDAO = new ProductDAO();		
				ArrayList<MemberPtDTO> classList;
				memberPt.setM_id((String)session.getAttribute("m_id"));
				classList = productDAO.getMyClientList(memberPt);
				session.setAttribute("classList", classList);
				forward.setPath("/com/yju/2wda/team1/view/won/manageClient.jsp");
				
			}
			else {
				forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
			}
			
		}
		
		// 진행 CP -> 완료 CC
		else if(mp_state.equals("CP")) {
			boolean chk = productDAO.changeMpCode(memberPt, "CC");
			
			if(chk==true) {
				productDAO = new ProductDAO();
				
				ArrayList<MemberPtDTO> classList;
				memberPt.setM_id((String)session.getAttribute("m_id"));
				classList = productDAO.getMyClientList(memberPt);
				session.setAttribute("classList", classList);
				
				forward.setPath("/com/yju/2wda/team1/view/won/manageClient.jsp");
			}
			else {
				forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
			}
		}
		
		return forward;
	}
}
