package kjw59_project.model.won;

// 회원-상품 매핑테이블
public class MemberPtDTO {
	private int mp_code;
	private String m_id; // 회원 아이디
	private int pt_code;
	private String t_id; // 트레이너 아이디
	private String mp_state;
	private String mp_date;
	private int mp_coin;
	private int mp_cnt;
	private int mp_tall;
	private int mp_weight;
	private String mp_detail;
	
	public MemberPtDTO() {
		super();
	}

	public MemberPtDTO(int mp_code, String m_id, int pt_code, String t_id, String mp_state, String mp_date,
			int mp_coin, int mp_cnt, int mp_tall, int mp_weight, String mp_detail) {
		super();
		this.mp_code = mp_code;
		this.m_id = m_id;
		this.pt_code = pt_code;
		this.t_id = t_id;
		this.mp_state = mp_state;
		this.mp_date = mp_date;
		this.mp_coin = mp_coin;
		this.mp_cnt = mp_cnt;
		this.mp_tall = mp_tall;
		this.mp_weight = mp_weight;
		this.mp_detail = mp_detail;
	}

	public int getMp_code() {
		return mp_code;
	}

	public void setMp_code(int mp_code) {
		this.mp_code = mp_code;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public int getPt_code() {
		return pt_code;
	}

	public void setPt_code(int pt_code) {
		this.pt_code = pt_code;
	}

	public String getT_id() {
		return t_id;
	}

	public void setT_id(String t_id) {
		this.t_id = t_id;
	}

	public String getMp_state() {
		return mp_state;
	}

	public void setMp_state(String mp_state) {
		this.mp_state = mp_state;
	}

	public String getMp_date() {
		return mp_date;
	}

	public void setMp_date(String mp_date) {
		this.mp_date = mp_date;
	}

	public int getMp_coin() {
		return mp_coin;
	}

	public void setMp_coin(int mp_coin) {
		this.mp_coin = mp_coin;
	}

	public int getMp_cnt() {
		return mp_cnt;
	}

	public void setMp_cnt(int mp_cnt) {
		this.mp_cnt = mp_cnt;
	}


	public int getMp_tall() {
		return mp_tall;
	}

	public void setMp_tall(int mp_tall) {
		this.mp_tall = mp_tall;
	}

	public int getMp_weight() {
		return mp_weight;
	}

	public void setMp_weight(int mp_weight) {
		this.mp_weight = mp_weight;
	}

	public String getMp_detail() {
		return mp_detail;
	}

	public void setMp_detail(String mp_detail) {
		this.mp_detail = mp_detail;
	}

	
}