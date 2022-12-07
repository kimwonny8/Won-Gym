package kjw59_project.model.won;

public class MemberDTO {
	private String m_id;
	private String m_pw;
	private String m_name;
	private String m_birth;
	private String m_gender;
	private String m_phone;
	private int m_coin;
	private String m_grade;
	private String c_code;
	
	public MemberDTO() {
		super();
	}
	
	public MemberDTO(String m_id, String m_pw, String m_name, String m_birth, String m_gender, String m_phone,
			int m_coin, String m_grade, String c_code) {
		super();
		this.m_id = m_id;
		this.m_pw = m_pw;
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_gender = m_gender;
		this.m_phone = m_phone;
		this.m_coin = m_coin;
		this.m_grade = m_grade;
		this.c_code = c_code;
	}
	
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pw() {
		return m_pw;
	}
	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_birth() {
		return m_birth;
	}
	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_gender() {
		return m_gender;
	}
	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}
	public String getM_phone() {
		return m_phone;
	}
	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}
	public int getM_coin() {
		return m_coin;
	}
	public void setM_coin(int m_coin) {
		this.m_coin = m_coin;
	}
	public String getM_grade() {
		return m_grade;
	}
	public void setM_grade(String m_grade) {
		this.m_grade = m_grade;
	}
	public String getC_code() {
		return c_code;
	}
	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	@Override
	public String toString() {
		return "memberDTO [m_id=" + m_id + ", m_pw=" + m_pw + ", m_name=" + m_name + ", m_birth=" + m_birth
				+ ", m_gender=" + m_gender + ", m_phone=" + m_phone + ", m_coin=" + m_coin + ", m_grade=" + m_grade
				+ ", c_code=" + c_code + "]";
	}
	
	
}
