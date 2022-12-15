package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class AddToCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		ProductDAO productDAO = new ProductDAO();
		MemberPtDTO memberPt = new MemberPtDTO();
		PtDTO pt = new PtDTO();
		
		int pt_code = (int)session.getAttribute("pt_code");
		String m_id = (String)session.getAttribute("m_id");
		int pt_select = Integer.parseInt(request.getParameter("pt_select"));
			
		pt.setPt_code(pt_code);
		productDAO.getTidPrice(pt);
		int pt_con_c = pt.getPt_con_c();
		int pt_one_c = pt.getPt_one_c();
		String t_id = pt.getT_id();
		
		// 0이면 상담
		if(pt_select==0) {
			memberPt.setMp_coin(pt_con_c);
		}
		else {
			memberPt.setMp_coin(pt_one_c*pt_select);
		}
		productDAO = new ProductDAO();
		memberPt.setMp_cnt(pt_select);
		memberPt.setM_id(m_id);
		memberPt.setPt_code(pt_code);
		memberPt.setMp_state("CR"); //장바구니
		memberPt.setT_id(t_id);

		// 같은 제품 있는 지 확인
		String cnt = productDAO.chkSamePt(memberPt);
		System.out.println(cnt);
		if(cnt.equals("0")) {
			// 장바구니에 추가하기
			productDAO = new ProductDAO();
			boolean success = productDAO.insertCart(memberPt);
			
			ActionForward forward = new ActionForward();
			forward.setRedirect(false);
			
			if(success == true) {
				forward.setPath("./getCartList.won");
				return forward;
			}
			else {
				return null;
			}
		}
		else return null;

	}

}
