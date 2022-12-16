package kjw59_project.model.won;

public class TrainerDTO {
	private String t_id;
	private String t_license_name;
	private String t_license_num;
	
	public TrainerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public TrainerDTO(String t_id, String t_license_name, String t_license_num) {
		super();
		this.t_id = t_id;
		this.t_license_name = t_license_name;
		this.t_license_num = t_license_num;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getT_license_name() {
		return t_license_name;
	}

	public void setT_license_name(String t_license_name) {
		this.t_license_name = t_license_name;
	}

	public String getT_license_num() {
		return t_license_num;
	}

	public void setT_license_num(String t_license_num) {
		this.t_license_num = t_license_num;
	}
	
	
}
	
	