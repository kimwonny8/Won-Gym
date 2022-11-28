package kjw59_project.model.won;

// 회원 자기 사진
public class mImageDTO {
	private String m_id;
	private String mi_file_name;
	private String mi_path;
	private int mi_size;
	private String mi_thum_name;
	
	public mImageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public mImageDTO(String m_id, String mi_file_name, String mi_path, int mi_size, String mi_thum_name) {
		super();
		this.m_id = m_id;
		this.mi_file_name = mi_file_name;
		this.mi_path = mi_path;
		this.mi_size = mi_size;
		this.mi_thum_name = mi_thum_name;
	}

	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getMi_file_name() {
		return mi_file_name;
	}
	public void setMi_file_name(String mi_file_name) {
		this.mi_file_name = mi_file_name;
	}
	public String getMi_path() {
		return mi_path;
	}
	public void setMi_path(String mi_path) {
		this.mi_path = mi_path;
	}
	public int getMi_size() {
		return mi_size;
	}
	public void setMi_size(int mi_size) {
		this.mi_size = mi_size;
	}
	public String getMi_thum_name() {
		return mi_thum_name;
	}
	public void setMi_thum_name(String mi_thum_name) {
		this.mi_thum_name = mi_thum_name;
	}
	
	
}
