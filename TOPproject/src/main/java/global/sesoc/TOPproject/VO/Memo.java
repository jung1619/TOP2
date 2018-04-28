package global.sesoc.TOPproject.VO;

public class Memo {

	private String id;
	private int p_num;
	private String n_content;
	private String n_indate;
	private String n_deldate;
	
	public Memo(){}
	public Memo(String id, String n_content, String n_deldate) {
		this.id = id;
		this.n_content = n_content;
		this.n_deldate = n_deldate;
	}
	public Memo(int p_num, String n_content, String n_deldate) {
		this.p_num = p_num;
		this.n_content = n_content;
		this.n_deldate = n_deldate;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_num() {
		return p_num;
	}
	public void setP_num(int p_num) {
		this.p_num = p_num;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_indate() {
		return n_indate;
	}
	public void setN_indate(String n_indate) {
		this.n_indate = n_indate;
	}
	public String getN_deldate() {
		return n_deldate;
	}
	public void setN_deldate(String n_deldate) {
		this.n_deldate = n_deldate;
	}
	
	@Override
	public String toString() {
		return "Memo [id=" + id + ", p_num=" + p_num + ", n_content=" + n_content + ", n_indate=" + n_indate
				+ ", n_deldate=" + n_deldate + "]";
	}
	
}