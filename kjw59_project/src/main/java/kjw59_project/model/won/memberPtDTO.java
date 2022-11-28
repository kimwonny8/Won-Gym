package kjw59_project.model.won;

// 회원-상품 매핑테이블
public class memberPtDTO {
	private String mp_code;
	private String m_id;
	private String pt_id;
	private String t_id;
	private String mp_state;
	private String mp_date;
	private int mp_coin;
	private int mp_cnt;
	private String mp_tall;
	private String mp_weight;
	private String mp_detail;
	
	public memberPtDTO() {
		super();
	}
	
	public memberPtDTO(String mp_code, String m_id, String pt_id, String t_id, String mp_state, String mp_date,
			int mp_coin, int mp_cnt, String mp_tall, String mp_weight, String mp_detail) {
		super();
		this.mp_code = mp_code;
		this.m_id = m_id;
		this.pt_id = pt_id;
		this.t_id = t_id;
		this.mp_state = mp_state;
		this.mp_date = mp_date;
		this.mp_coin = mp_coin;
		this.mp_cnt = mp_cnt;
		this.mp_tall = mp_tall;
		this.mp_weight = mp_weight;
		this.mp_detail = mp_detail;
	}
	
	public String getMp_code() {
		return mp_code;
	}
	public void setMp_code(String mp_code) {
		this.mp_code = mp_code;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getPt_id() {
		return pt_id;
	}
	public void setPt_id(String pt_id) {
		this.pt_id = pt_id;
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
	public String getMp_tall() {
		return mp_tall;
	}
	public void setMp_tall(String mp_tall) {
		this.mp_tall = mp_tall;
	}
	public String getMp_weight() {
		return mp_weight;
	}
	public void setMp_weight(String mp_weight) {
		this.mp_weight = mp_weight;
	}
	public String getMp_detail() {
		return mp_detail;
	}
	public void setMp_detail(String mp_detail) {
		this.mp_detail = mp_detail;
	}
	
	
	
}