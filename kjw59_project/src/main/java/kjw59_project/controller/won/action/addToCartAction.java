package kjw59_project.controller.won.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.*;

public class addToCartAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		productDAO productDAO = new productDAO();
		memberPtDTO memberPt = new memberPtDTO();
		ptDTO pt = new ptDTO();
		
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
		memberPt.setMp_cnt(pt_select);
		memberPt.setM_id(m_id);
		memberPt.setPt_code(pt_code);
		memberPt.setMp_state("CR"); //장바구니
		memberPt.setT_id(t_id);

		// 장바구니에 추가하기
		productDAO = new productDAO();
		boolean success = productDAO.insertCart(memberPt);
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		forward.setPath("./getCartList.won");
		
		return forward;
	}

}
