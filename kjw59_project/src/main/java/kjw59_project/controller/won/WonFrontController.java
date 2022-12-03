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
			
		case "/updateMemberChkPw.won":
			action = new updateMemberChkPwAction();
			break;
			
		case "/updateMemberPhoto.won":
			action = new updateMemberPhotoAction();
			break;
			
		case "/deleteMemberChkPw.won":
			action = new deleteMemberChkPwAction();
			break;
		
		case "/updateMember.won":
			action = new updateMemberAction();
			break;
		
		case "/uploadPT.won":
			action = new uploadPTAction();
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
