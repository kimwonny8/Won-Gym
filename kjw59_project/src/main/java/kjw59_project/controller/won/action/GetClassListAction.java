package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.*;
import kjw59_project.model.won.*;

public class GetClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		PtDTO pt = new PtDTO();
		
		ArrayList<AllClassVO> classList;
		
		// 동네 선택 안 했을 때 => 전체
		String c_code = request.getParameter("c_code");
		if(c_code == null || c_code.equals("전체")) { 
			classList = productDAO.getClassList(pt, member, mImage);
			session.setAttribute("classList", classList);	
		}
		// 동네 선택 했을 때
		else {
			member.setC_code(c_code);
			classList = productDAO.getClassSearchList(pt, member, mImage);
			session.setAttribute("classList", classList);
		}
		
		session.setAttribute("select_c_code", c_code);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/classApplication.jsp");
		
		return forward;
	}

}
