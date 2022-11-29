package kjw59_project.controller.won;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kjw59_project.model.won.*;

public class uploadPTAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		
		// 파일 관련
		String imgDirPath = "D:\\project\\WorkOutNow-Page\\kjw59_project\\src\\main\\webapp\\com\\yju\\2wda\\team1\\image\\memberImage\\";
		String thumbImageDir = "D:\\project\\WorkOutNow-Page\\kjw59_project\\src\\main\\webapp\\com\\yju\\2wda\\team1\\image\\memberImage\\memberThumb\\";

		int maxSize = 1024 * 1024 * 5; // 최대 5G까지 가능 1024 => 1KB

		String element = "";
		String i_file_name = "";
		String i_original_name = "";
		String i_file_type = "";
		
		MultipartRequest multi = new MultipartRequest(request, imgDirPath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		Enumeration files = multi.getFileNames();
		
		request.setCharacterEncoding("utf-8");
		memberDAO memberDAO = new memberDAO();
		productDAO productDAO = new productDAO();
		
		memberDTO member = new memberDTO();
		cityDTO city = new cityDTO();
		ptDTO pt = new ptDTO();
		
		pt.setPt_title(multi.getParameter("pt_title"));
		pt.setT_id((String)session.getAttribute("m_id"));
		pt.setPt_one_c(Integer.parseInt(multi.getParameter("pt_one_c")));
		pt.setPt_con_c(Integer.parseInt(multi.getParameter("pt_con_c")));
		pt.setPt_content(multi.getParameter("pt_content"));
		
		// 회원 정보 사진 받아와야 함
		
		boolean result = productDAO.insertProduct(pt);
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/com/yju/2wda/team1/view/won/classApplication.jsp");
		}
		else {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		
		return forward;
	}

}
