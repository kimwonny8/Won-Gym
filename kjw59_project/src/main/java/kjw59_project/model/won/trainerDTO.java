package kjw59_project.model.won;

public class trainerDTO {
	private String t_id;
	private int t_con_cnt;
	private int t_pt_cnt;
	
	public trainerDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public trainerDTO(String t_id, int t_con_cnt, int t_pt_cnt) {
		super();
		this.t_id = t_id;
		this.t_con_cnt = t_con_cnt;
		this.t_pt_cnt = t_pt_cnt;
	}


	public String getT_id() {
		return t_id;
	}


	public void setT_id(String t_id) {
		this.t_id = t_id;
	}


	public int getT_con_cnt() {
		return t_con_cnt;
	}


	public void setT_con_cnt(int t_con_cnt) {
		this.t_con_cnt = t_con_cnt;
	}


	public int getT_pt_cnt() {
		return t_pt_cnt;
	}


	public void setT_pt_cnt(int t_pt_cnt) {
		this.t_pt_cnt = t_pt_cnt;
	}
	
	
}
