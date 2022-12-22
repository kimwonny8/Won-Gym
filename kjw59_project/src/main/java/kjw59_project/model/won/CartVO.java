package kjw59_project.model.won;

import java.io.Serializable;

public class CartVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// memberPt 테이블 + member 테이블 + mImage 테이블
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
	
	private String m_name;
	private String m_birth;
	private String m_gender;
	private String m_phone;
	private String c_code;
	private int m_coin;
	private String t_name;
	
	private String mi_thum_name;
	
	public CartVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CartVO(int mp_code, String m_id, int pt_code, String t_id, String mp_state, String mp_date, int mp_coin,
			int mp_cnt, int mp_tall, int mp_weight, String mp_detail, String m_name, String m_birth,
			String m_gender, String m_phone, String c_code, int m_coin, String t_name, String mi_thum_name) {
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
		this.m_name = m_name;
		this.m_birth = m_birth;
		this.m_gender = m_gender;
		this.m_phone = m_phone;
		this.c_code = c_code;
		this.m_coin = m_coin;
		this.mi_thum_name = mi_thum_name;
	}

	public String getT_name() {
		return t_name;
	}

	public void setT_name(String t_name) {
		this.t_name = t_name;
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

	public String getC_code() {
		return c_code;
	}

	public void setC_code(String c_code) {
		this.c_code = c_code;
	}

	public int getM_coin() {
		return m_coin;
	}

	public void setM_coin(int m_coin) {
		this.m_coin = m_coin;
	}

	public String getMi_thum_name() {
		return mi_thum_name;
	}

	public void setMi_thum_name(String mi_thum_name) {
		this.mi_thum_name = mi_thum_name;
	}
	
	
	
}
