package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kjw59_project.controller.won.*;
import kjw59_project.model.won.*;

public class getClassListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		productDAO productDAO = new productDAO(); // 상품 내용
		memberDTO member = new memberDTO();
		mImageDTO mImage = new mImageDTO();
		ptDTO pt = new ptDTO();
		
		ArrayList<allClassVO> classList;
		
		classList = productDAO.getClassList(pt, member, mImage);
		request.setAttribute("classList", classList);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("/com/yju/2wda/team1/view/won/classApplication.jsp");
		
		return forward;
	}

}
