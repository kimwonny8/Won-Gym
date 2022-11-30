package kjw59_project.model.won;

// 상품 게시글 테이블
public class ptDTO {
	private String pt_code;
	private String t_id;
	private String pt_title;
	private int pt_one_c;
	private int pt_con_c;
	private String pt_content;
	private int pt_like;
	
	public ptDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ptDTO(String pt_code, String t_id, String pt_title, int pt_one_c, int pt_con_c, String pt_content,
			int pt_like) {
		super();
		this.pt_code = pt_code;
		this.t_id = t_id;
		this.pt_title = pt_title;
		this.pt_one_c = pt_one_c;
		this.pt_con_c = pt_con_c;
		this.pt_content = pt_content;
		this.pt_like = pt_like;
	}
	
	public String getpt_code() {
		return pt_code;
	}
	public void setpt_code(String pt_code) {
		this.pt_code = pt_code;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getPt_title() {
		return pt_title;
	}
	public void setPt_title(String pt_title) {
		this.pt_title = pt_title;
	}
	public int getPt_one_c() {
		return pt_one_c;
	}
	public void setPt_one_c(int pt_one_c) {
		this.pt_one_c = pt_one_c;
	}
	public int getPt_con_c() {
		return pt_con_c;
	}
	public void setPt_con_c(int pt_con_c) {
		this.pt_con_c = pt_con_c;
	}
	public String getPt_content() {
		return pt_content;
	}
	public void setPt_content(String pt_content) {
		this.pt_content = pt_content;
	}
	public int getPt_like() {
		return pt_like;
	}
	public void setPt_like(int pt_like) {
		this.pt_like = pt_like;
	}
	
	
}
