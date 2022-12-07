package kjw59_project.model.won;

// 회원 자기 사진
public class MImageDTO {
	private String m_id;
	private String mi_file_name;
	private long mi_size;
	private String mi_thum_name;
	
	public MImageDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MImageDTO(String m_id, String mi_file_name, int mi_size, String mi_thum_name) {
		super();
		this.m_id = m_id;
		this.mi_file_name = mi_file_name;
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
	public long getMi_size() {
		return mi_size;
	}
	public void setMi_size(long length) {
		this.mi_size = length;
	}
	public String getMi_thum_name() {
		return mi_thum_name;
	}
	public void setMi_thum_name(String mi_thum_name) {
		this.mi_thum_name = mi_thum_name;
	}
	
	
}
