package kjw59_project.model.won;

public class CityDTO {
	private String c_code;
	private String c_name;
	
	public CityDTO() {
		super();
	}

	public CityDTO(String c_code, String c_name) {
		super();
		this.c_code = c_code;
		this.c_name = c_name;
	}

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}
	
	
	
	
}
