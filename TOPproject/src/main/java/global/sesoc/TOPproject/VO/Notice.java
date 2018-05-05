package global.sesoc.TOPproject.VO;

public class Notice {

	/*Notice*/
	private String p_num;
	private String content;
	private String indate;
	private String deledata;
	
	public Notice() {
		super();
	}
	public Notice(String p_num, String content, String indate, String deledata) {
		super();
		this.p_num = p_num;
		this.content = content;
		this.indate = indate;
		this.deledata = deledata;
	}
	
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getDeledata() {
		return deledata;
	}
	public void setDeledata(String deledata) {
		this.deledata = deledata;
	}
	
	@Override
	public String toString() {
		return "Notice [p_num=" + p_num + ", content=" + content + ", indate=" + indate + ", deledata=" + deledata
				+ "]";
	}
	
	
	
}
