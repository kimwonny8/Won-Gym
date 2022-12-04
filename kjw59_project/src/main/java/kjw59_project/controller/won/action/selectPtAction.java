package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.allClassVO;
import kjw59_project.model.won.mImageDTO;
import kjw59_project.model.won.memberDTO;
import kjw59_project.model.won.productDAO;
import kjw59_project.model.won.ptDTO;

public class selectPtAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		System.out.println("test");
		request.setCharacterEncoding("utf-8");
		productDAO productDAO = new productDAO(); // 상품 내용
		memberDTO member = new memberDTO();
		mImageDTO mImage = new mImageDTO();
		ptDTO pt = new ptDTO();
		
		int pt_code=Integer.parseInt(request.getParameter("pt_code"));
		pt.setPt_code(pt_code);
		
		ArrayList<allClassVO> classList;
		
		classList = productDAO.selectClassList(pt, member, mImage);
		request.setAttribute("classList", classList);
	
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/readPT.jsp");
		
		return forward;
	}

}
