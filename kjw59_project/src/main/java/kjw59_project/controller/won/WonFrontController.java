package kjw59_project.controller.won;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

import java.util.*;
import kjw59_project.controller.won.action.*;
import kjw59_project.model.won.*;

public class WonFrontController extends HttpServlet implements Servlet {
	
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
		command = command.substring(command.lastIndexOf("/"));
		HttpSession session = request.getSession();

		ActionForward forward = null;
		Action action = null;
		
		System.out.println("command = "+command);
		
		
		switch(command) {
		
		/* 로그인, 회원가입 부분 */
		case "/chkId.won":
			action = new chkIdAction();
			break;
		
		case "/signupMember.won":
			action = new signupAction();
			break;
			
		case "/loginMember.won":
			action = new loginAction();
			break;
			
		case "/logoutMember.won":
			action = new logoutAction();
			break;
		
		/* 사진 업데이트 부분 */	
		case "/updateMemberPhoto.won":
			action = new updateMemberPhotoAction();
			break;
		
		/* 회원정보 수정, 탈퇴 부분 */
		case "/updateMemberChkPw.won":
			action = new updateMemberChkPwAction();
			break;
			
		case "/deleteMemberChkPw.won":
			action = new deleteMemberChkPwAction();
			break;
		
		case "/updateMember.won":
			action = new updateMemberAction();
			break;
			
		/* 상품 글 부분 */
		case "/getClassList.won":
			action = new getClassListAction();
			break;
			
		case "/uploadPT.won":
			action = new uploadPTAction();
			break;
			
		case "/selectPt.won":
			action = new selectPtAction();
			break;
			
		case "/updatePt.won":
			action = new updatePtAction();
			break;
			
		case "/updatePtContent.won":
			action = new updatePtContentAction();
			break;
		
		case "/deletePt.won":
			action = new deletePtAction();
			break;
			
		/* 코인 업데이트*/
		case "/updateCoin.won":
			action = new updateCoinAction();
			break;	
			
			
		/* 장바구니 */
		case "/addToCart.won":
			action = new addToCartAction();
			break;		
			
		case "/getCartList.won":
			action = new getCartListAction();
			break;
			
		case "/deleteCartList.won":
			action = new deleteCartListAction();
			break;
			
		/* 결제 */
		case "/paymentProgress.won":
			action = new paymentProgressAction();
			break;	
			
		default:
			action = new DefaultAction();
			break;
		}
		
		try {
			forward = action.execute(request, response);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}
			else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request, response);
	}
}
