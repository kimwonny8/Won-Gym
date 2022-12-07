package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.AllClassVO;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.ProductDAO;

public class AdminMemberAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO(); // 상품 내용
		MemberDTO member = new MemberDTO();
		
		ArrayList<MemberDTO> memberList;
		memberList = memberDAO.selectAllMemberList(member);
		session.setAttribute("memberList", memberList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/adminMember.jsp");
		
		return forward;
	}

}
