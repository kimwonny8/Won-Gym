package kjw59_project.model.won;

// 상품에 들어가는 사진
public class ptImageDTO {
	private String p_id;
	private String t_id;
	private String pi_file_name;
	private String pi_path;
	private int pi_size;
	private String pi_thum_name;
	
	public ptImageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public ptImageDTO(String p_id, String t_id, String pi_file_name, String pi_path, int pi_size,
			String pi_thum_name) {
		super();
		this.p_id = p_id;
		this.t_id = t_id;
		this.pi_file_name = pi_file_name;
		this.pi_path = pi_path;
		this.pi_size = pi_size;
		this.pi_thum_name = pi_thum_name;
	}
	
	public String getP_id() {
		return p_id;
	}
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getT_id() {
		return t_id;
	}
	public void setT_id(String t_id) {
		this.t_id = t_id;
	}
	public String getPi_file_name() {
		return pi_file_name;
	}
	public void setPi_file_name(String pi_file_name) {
		this.pi_file_name = pi_file_name;
	}
	public String getPi_path() {
		return pi_path;
	}
	public void setPi_path(String pi_path) {
		this.pi_path = pi_path;
	}
	public int getPi_size() {
		return pi_size;
	}
	public void setPi_size(int pi_size) {
		this.pi_size = pi_size;
	}
	public String getPi_thum_name() {
		return pi_thum_name;
	}
	public void setPi_thum_name(String pi_thum_name) {
		this.pi_thum_name = pi_thum_name;
	}
	
}
