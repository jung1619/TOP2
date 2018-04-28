package global.sesoc.TOPproject.VO;

public class Notice {

	/*Notice*/
	private String p_num;
	private String n_content;
	private String n_indate;
	private String n_deledata;
	public Notice(String p_num, String n_content, String n_indate, String n_deledata) {
		super();
		this.p_num = p_num;
		this.n_content = n_content;
		this.n_indate = n_indate;
		this.n_deledata = n_deledata;
	}
	public Notice() {
		super();
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
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
	public String getN_deledata() {
		return n_deledata;
	}
	public void setN_deledata(String n_deledata) {
		this.n_deledata = n_deledata;
	}
	@Override
	public String toString() {
		return "Notice [p_num=" + p_num + ", n_content=" + n_content + ", n_indate=" + n_indate + ", n_deledata="
				+ n_deledata + "]";
	}
	
	
	
	
}
