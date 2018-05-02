package global.sesoc.TOPproject.VO;

public class PersonalEdit {

	
	private String p_num;
	private String title;
	private String id;
	private String context;
	private String indate;
	public PersonalEdit(String p_num, String title, String id, String context, String indate) {
		super();
		this.p_num = p_num;
		this.title = title;
		this.id = id;
		this.context = context;
		this.indate = indate;
	}
	public PersonalEdit() {
		super();
	}
	public String getP_num() {
		return p_num;
	}
	public void setP_num(String p_num) {
		this.p_num = p_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	@Override
	public String toString() {
		return "PersonalEdit [p_num=" + p_num + ", title=" + title + ", id=" + id + ", context=" + context + ", indate="
				+ indate + "]";
	}
	
	
	
	
	
	
	
}
