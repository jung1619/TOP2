package global.sesoc.TOPproject.VO;

public class Memo {

	private String id;
	private int p_num;
	private String content;
	private String indate;
	private String deldate;
	
	public Memo(){}
	public Memo(String id, int p_num, String content, String indate, String deldate) {
		super();
		this.id = id;
		this.p_num = p_num;
		this.content = content;
		this.indate = indate;
		this.deldate = deldate;
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
	public String getDeldate() {
		return deldate;
	}
	public void setDeldate(String deldate) {
		this.deldate = deldate;
	}
	
	@Override
	public String toString() {
		return "Memo [id=" + id + ", p_num=" + p_num + ", content=" + content + ", indate=" + indate + ", deldate="
				+ deldate + "]";
	}
	
	
	
	
}