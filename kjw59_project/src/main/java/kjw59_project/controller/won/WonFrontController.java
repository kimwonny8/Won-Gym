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
			action = new ChkIdAction();
			break;
		
		case "/signupMember.won":
			action = new SignupAction();
			break;
			
		case "/loginMember.won":
			action = new LoginAction();
			break;
			
		case "/logoutMember.won":
			action = new LogoutAction();
			break;
		
		/* 사진 업데이트 부분 */	
		case "/updateMemberPhoto.won":
			action = new UpdateMemberPhotoAction();
			break;
		
		/* 회원정보 수정, 탈퇴 부분 */
		case "/updateMemberChkPw.won":
			action = new UpdateMemberChkPwAction();
			break;
			
		case "/deleteMemberChkPw.won":
			action = new DeleteMemberChkPwAction();
			break;
		
		case "/updateMember.won":
			action = new UpdateMemberAction();
			break;
			
		/* 상품 글 부분 */
		case "/getClassList.won":
			action = new GetClassListAction();
			break;
			
		case "/uploadPT.won":
			action = new UploadPTAction();
			break;
			
		case "/selectPt.won":
			action = new SelectPtAction();
			break;
			
		case "/updatePt.won":
			action = new UpdatePtAction();
			break;
			
		case "/updatePtContent.won":
			action = new UpdatePtContentAction();
			break;
		
		case "/deletePt.won":
			action = new DeletePtAction();
			break;
			
		/* 코인 업데이트*/
		case "/updateCoin.won":
			action = new UpdateCoinAction();
			break;	
			
		/* 장바구니 */
		case "/addToCart.won":
			action = new AddToCartAction();
			break;		
			
		case "/getCartList.won":
			action = new GetCartListAction();
			break;
			
		case "/deleteCartList.won":
			action = new DeleteCartListAction();
			break;
		
		case "/buyRightNow.won":
			action = new BuyRightNowAction();
			break;
			
		/* 결제 */
		case "/paymentProgress.won":
			action = new PaymentProgressAction();
			break;	
			
		case "/paymentComplete.won":
			action = new PaymentCompleteAction();
			break;	
		
		/* 관리자 */
		case "/adminMember.won":
			action = new AdminMemberAction();
			break;	
			
		case "/adminPost.won":
			action = new AdminPostAction();
			break;	
		
		case "/expulsionMember.won":
			action = new ExpulsionMemberAction();
			break;	
			
		case "/expulsionPost.won":
			action = new ExpulsionPostAction();
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
