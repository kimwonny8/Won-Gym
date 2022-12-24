package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.AllClassVO;
import kjw59_project.model.won.MImageDTO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.ProductDAO;
import kjw59_project.model.won.PtDTO;

public class SelectPtAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO(); // 상품 내용
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		PtDTO pt = new PtDTO();
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		/*
		 *기존엔 하나하나 받아서 체크했지만, try - catch 구문으로 변경
		 String codeString = request.getParameter("pt_code");
		 if(!isNumeric(codeString)) { // true면 숫자
		 forward.setPath("/com/yju/2wda/team1/view/etc/pageError.jsp"); 
		 } else {
		 */
		
		try{
			int pt_code=Integer.parseInt(request.getParameter("pt_code"));
			
			session.setAttribute("pt_code", pt_code);
			pt.setPt_code(pt_code);
			
			if(productDAO.chkPtCode(pt) == true) {
				ArrayList<AllClassVO> classList;
				productDAO = new ProductDAO();
				classList = productDAO.selectClassList(pt, member, mImage);
				session.setAttribute("classList", classList);

				forward.setPath("/com/yju/2wda/team1/view/won/readClass.jsp");
			}
			}
			 catch(Exception e) {
				forward.setPath("/com/yju/2wda/team1/view/etc/pageError.jsp");
			}
	
		return forward;
	}
	
	/*
	  public static boolean isNumeric(String s) {
	        try {
	            Double.parseDouble(s);
	            return true;
	        } catch (NumberFormatException e) {
	            return false;
	        }
	    }
	 */
}
