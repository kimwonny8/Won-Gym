package kjw59_project.controller.won.action;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kjw59_project.controller.won.Action;
import kjw59_project.controller.won.ActionForward;
import kjw59_project.model.won.MImageDTO;
import kjw59_project.model.won.MemberDAO;
import kjw59_project.model.won.MemberDTO;
import kjw59_project.model.won.ProductDAO;

public class UpdateMemberPhotoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		
		ServletContext application = request.getServletContext();
		String path = application.getRealPath("/");
		String imgDirPath = path + "com\\yju\\2wda\\team1\\image\\memberImage\\";
		
		// 파일 관련
		//String imgDirPath = "D:\\project\\WorkOutNow-Page\\kjw59_project\\src\\main\\webapp\\com\\yju\\2wda\\team1\\image\\memberImage\\";
		String thumbImageDir = imgDirPath+"memberThumb\\";

		int maxSize = 1024 * 1024 * 5; // 최대 5G까지 가능 1024 => 1KB

		MultipartRequest multi = new MultipartRequest(request, imgDirPath, maxSize, "utf-8",
				new DefaultFileRenamePolicy());

		Enumeration<?> files = multi.getFileNames();
		
		request.setCharacterEncoding("utf-8");
		MemberDAO memberDAO = new MemberDAO();
		ProductDAO productDAO = new ProductDAO();
		MemberDTO member = new MemberDTO();
		MImageDTO mImage = new MImageDTO();
		
		mImage.setM_id((String)session.getAttribute("m_id"));
		
		boolean result=false;
		
		String element = "";
		String i_file_name = "";
		String i_original_name = "";
		String i_file_type = "";
		long i_length = 0;
		
		if (files.hasMoreElements()) {
			element = (String) files.nextElement();
			i_file_name = multi.getFilesystemName(element);
			i_original_name = multi.getOriginalFileName(element);
			i_file_type = multi.getContentType(element);
			i_length = multi.getFile(element).length();
			
			System.out.println("photo"+i_file_name);
			mImage.setMi_file_name(i_file_name);
			mImage.setMi_thum_name("t_"+i_file_name);
			mImage.setMi_size(i_length);
			
			// 회원이 사진있는지 체크
			String chkPhoto = memberDAO.chkMemberPhoto(mImage);

			if(chkPhoto != null) { // 사진 이미 있으면 update
				memberDAO = new MemberDAO();
				result = memberDAO.updateMemberPhoto(mImage);
				memberDAO = new MemberDAO();
				memberDAO.createImageThumb(imgDirPath, thumbImageDir, i_file_name, 2);
			
			}
			else { // 사진 없으면 insert
				memberDAO = new MemberDAO();
				result = memberDAO.insertMemberPhoto(mImage);
				memberDAO = new MemberDAO();
				memberDAO.createImageThumb(imgDirPath, thumbImageDir, i_file_name, 2);
			}
			
			// 썸네일 추가 후 이름 알아와서 세션에 저장
			memberDAO = new MemberDAO();
			String mi_thum_name= memberDAO.chkMemberPhoto(mImage);
			session.setAttribute("mi_thum_name", mi_thum_name);
		} 
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(false);
		
		if(result == true) {
			forward.setPath("/index.jsp");
		}
		else {
			forward.setPath("/com/yju/2wda/team1/view/etc/error.jsp");
		}
		
		return forward;
	}

}
